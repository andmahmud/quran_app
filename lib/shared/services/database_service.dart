import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/surah_model.dart';
import '../models/ayah_model.dart';
import '../models/bookmark_model.dart';
import '../models/last_read_model.dart';
import '../models/downloaded_audio_model.dart';
import '../models/note_model.dart';
import '../models/recent_surah_model.dart';

final databaseServiceProvider = Provider<DatabaseService>((ref) {
  throw UnimplementedError('Override in main');
});

class DatabaseService {
  late Isar _isar;

  Isar get isar => _isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([
      SurahModelSchema,
      AyahModelSchema,
      BookmarkModelSchema,
      LastReadModelSchema,
      DownloadedAudioModelSchema,
      NoteModelSchema,
      RecentSurahModelSchema,
    ], directory: dir.path);
  }

  // Surah operations
  Future<void> saveSurahs(List<SurahModel> surahs) async {
    await _isar.writeTxn(() async {
      await _isar.surahModels.clear();
      await _isar.surahModels.putAll(surahs);
    });
  }

  Future<List<SurahModel>> getAllSurahs() async {
    return await _isar.surahModels.where().sortBySurahNumber().findAll();
  }

  Future<SurahModel?> getSurah(int surahNumber) async {
    return await _isar.surahModels
        .where()
        .surahNumberEqualTo(surahNumber)
        .findFirst();
  }

  // Ayah operations
  Future<void> saveAyahs(List<AyahModel> ayahs) async {
    await _isar.writeTxn(() async {
      await _isar.ayahModels.putAll(ayahs);
    });
  }

  Future<List<AyahModel>> getAyahsBySurah(int surahNumber) async {
    return await _isar.ayahModels
        .where()
        .filter()
        .surahNumberEqualTo(surahNumber)
        .sortByAyahNumber()
        .findAll();
  }

  Future<bool> hasSurahAyahs(int surahNumber) async {
    final count = await _isar.ayahModels
        .where()
        .filter()
        .surahNumberEqualTo(surahNumber)
        .count();
    return count > 0;
  }

  // Bookmark operations
  Future<void> addBookmark(BookmarkModel bookmark) async {
    await _isar.writeTxn(() async {
      await _isar.bookmarkModels.put(bookmark);
    });
  }

  Future<void> removeBookmark(int id) async {
    await _isar.writeTxn(() async {
      await _isar.bookmarkModels.delete(id);
    });
  }

  Future<List<BookmarkModel>> getAllBookmarks() async {
    return await _isar.bookmarkModels.where().sortByCreatedAtDesc().findAll();
  }

  Future<bool> isBookmarked(int surahNumber, int ayahNumber) async {
    final count = await _isar.bookmarkModels
        .where()
        .filter()
        .surahNumberEqualTo(surahNumber)
        .ayahNumberEqualTo(ayahNumber)
        .count();
    return count > 0;
  }

  Future<BookmarkModel?> getBookmark(int surahNumber, int ayahNumber) async {
    return await _isar.bookmarkModels
        .where()
        .filter()
        .surahNumberEqualTo(surahNumber)
        .ayahNumberEqualTo(ayahNumber)
        .findFirst();
  }

  // Last Read operations
  Future<void> saveLastRead(LastReadModel lastRead) async {
    await _isar.writeTxn(() async {
      await _isar.lastReadModels.put(lastRead);
    });
  }

  Future<LastReadModel?> getLastRead() async {
    return await _isar.lastReadModels.where().findFirst();
  }

  // Downloaded Audio operations
  Future<void> saveDownloadedAudio(DownloadedAudioModel audio) async {
    await _isar.writeTxn(() async {
      await _isar.downloadedAudioModels.put(audio);
    });
  }

  Future<void> removeDownloadedAudio(int id) async {
    await _isar.writeTxn(() async {
      await _isar.downloadedAudioModels.delete(id);
    });
  }

  Future<List<DownloadedAudioModel>> getAllDownloadedAudio() async {
    return await _isar.downloadedAudioModels
        .where()
        .sortByDownloadedAtDesc()
        .findAll();
  }

  Future<DownloadedAudioModel?> getDownloadedAudio(int surahNumber, String reciter) async {
    return await _isar.downloadedAudioModels
        .where()
        .filter()
        .surahNumberEqualTo(surahNumber)
        .reciterEqualTo(reciter)
        .findFirst();
  }

  // Notes operations
  Future<void> saveNote(NoteModel note) async {
    await _isar.writeTxn(() async {
      await _isar.noteModels.put(note);
    });
  }

  Future<void> deleteNote(int id) async {
    await _isar.writeTxn(() async {
      await _isar.noteModels.delete(id);
    });
  }

  Future<List<NoteModel>> getNotesForAyah(int surahNumber, int ayahNumber) async {
    return await _isar.noteModels
        .where()
        .filter()
        .surahNumberEqualTo(surahNumber)
        .ayahNumberEqualTo(ayahNumber)
        .findAll();
  }

  // Recent Surahs
  Future<void> addRecentSurah(int surahNumber) async {
    await _isar.writeTxn(() async {
      final existing = await _isar.recentSurahModels
          .where()
          .filter()
          .surahNumberEqualTo(surahNumber)
          .findFirst();
      if (existing != null) {
        existing.openedAt = DateTime.now();
        await _isar.recentSurahModels.put(existing);
      } else {
        final model = RecentSurahModel()
          ..surahNumber = surahNumber
          ..openedAt = DateTime.now();
        await _isar.recentSurahModels.put(model);
      }
    });
  }

  Future<List<RecentSurahModel>> getRecentSurahs({int limit = 10}) async {
    return await _isar.recentSurahModels
        .where()
        .sortByOpenedAtDesc()
        .limit(limit)
        .findAll();
  }

  Future<void> clearAll() async {
    await _isar.writeTxn(() async {
      await _isar.clear();
    });
  }
}
