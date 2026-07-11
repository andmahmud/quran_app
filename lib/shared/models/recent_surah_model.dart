import 'package:isar_community/isar.dart';

part 'recent_surah_model.g.dart';

@collection
class RecentSurahModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int surahNumber;

  late DateTime openedAt;
}
