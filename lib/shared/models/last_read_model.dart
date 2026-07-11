import 'package:isar_community/isar.dart';

part 'last_read_model.g.dart';

@collection
class LastReadModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int surahNumber;

  late int ayahNumber;
  late double scrollPosition;
  late DateTime updatedAt;
}
