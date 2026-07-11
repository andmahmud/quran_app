import 'package:isar_community/isar.dart';

part 'ayah_model.g.dart';

@collection
class AyahModel {
  Id id = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('ayahNumber')])
  late int surahNumber;

  late int ayahNumber;

  late String arabicText;
  late String translationText;
  late int juz;
  late int page;
  late int hizb;
  late int ruku;

  @ignore
  bool get isSajdah {
    const sajdahAyahs = [
      {'surah': 7, 'ayah': 206},
      {'surah': 13, 'ayah': 15},
      {'surah': 16, 'ayah': 50},
      {'surah': 17, 'ayah': 109},
      {'surah': 19, 'ayah': 58},
      {'surah': 22, 'ayah': 18},
      {'surah': 22, 'ayah': 77},
      {'surah': 25, 'ayah': 60},
      {'surah': 27, 'ayah': 26},
      {'surah': 32, 'ayah': 15},
      {'surah': 38, 'ayah': 24},
      {'surah': 41, 'ayah': 38},
      {'surah': 53, 'ayah': 62},
      {'surah': 84, 'ayah': 21},
      {'surah': 96, 'ayah': 19},
    ];
    return sajdahAyahs.any((s) => s['surah'] == surahNumber && s['ayah'] == ayahNumber);
  }
}
