class AyahEntity {
  final int surahNumber;
  final int ayahNumber;
  final String arabicText;
  final String translationText;
  final int juz;
  final int page;
  final int hizb;
  final int ruku;
  final bool isSajdah;

  const AyahEntity({
    required this.surahNumber,
    required this.ayahNumber,
    required this.arabicText,
    required this.translationText,
    required this.juz,
    required this.page,
    required this.hizb,
    required this.ruku,
    this.isSajdah = false,
  });
}
