import 'package:isar_community/isar.dart';

part 'note_model.g.dart';

@collection
class NoteModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int surahNumber;

  @Index()
  late int ayahNumber;

  late String content;
  late DateTime createdAt;
  late DateTime updatedAt;
}
