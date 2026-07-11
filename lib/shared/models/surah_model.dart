import 'package:isar_community/isar.dart';

part 'surah_model.g.dart';

@collection
class SurahModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int surahNumber;

  late String nameArabic;
  late String nameEnglish;
  late String nameTranslated;
  late String revelationType;
  late int totalAyahs;

  @ignore
  String get paddedNumber => surahNumber.toString().padLeft(3, '0');
}
