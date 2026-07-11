import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/services/database_service.dart';
import '../../../../shared/models/bookmark_model.dart';

final bookmarkListProvider =
    NotifierProvider<BookmarkListNotifier, List<BookmarkModel>>(
  BookmarkListNotifier.new,
);

class BookmarkListNotifier extends Notifier<List<BookmarkModel>> {
  @override
  List<BookmarkModel> build() {
    _loadBookmarks();
    return [];
  }

  Future<void> _loadBookmarks() async {
    final db = ref.read(databaseServiceProvider);
    state = await db.getAllBookmarks();
  }

  Future<void> toggleBookmark({
    required int surahNumber,
    required int ayahNumber,
    String? note,
  }) async {
    final db = ref.read(databaseServiceProvider);
    final existing = await db.getBookmark(surahNumber, ayahNumber);

    if (existing != null) {
      await db.removeBookmark(existing.id);
    } else {
      final bookmark = BookmarkModel()
        ..surahNumber = surahNumber
        ..ayahNumber = ayahNumber
        ..note = note
        ..createdAt = DateTime.now()
        ..isFavorite = false;
      await db.addBookmark(bookmark);
    }
    await _loadBookmarks();
  }

  Future<void> removeBookmark(int id) async {
    final db = ref.read(databaseServiceProvider);
    await db.removeBookmark(id);
    await _loadBookmarks();
  }

  bool isBookmarked(int surahNumber, int ayahNumber) {
    return state.any(
        (b) => b.surahNumber == surahNumber && b.ayahNumber == ayahNumber);
  }
}
