import 'package:isar_community/isar.dart';

part 'bookmark_model.g.dart';

@collection
class BookmarkModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int surahNumber;

  @Index()
  late int ayahNumber;

  String? note;

  late DateTime createdAt;

  bool isFavorite = false;
}
