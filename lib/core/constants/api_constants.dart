class ApiConstants {
  ApiConstants._();

  static const String quranBaseUrl = 'https://api.alquran.cloud/v1';
  static const String aladhanBaseUrl = 'https://api.aladhan.com/v1';
  static const String quranAudioBaseUrl = 'https://download.quranicaudio.com/quran';

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  static const String defaultEnglishEdition = 'en.asad';
  static const String defaultArabicEdition = 'quran-uthmani';
  static const String defaultBanglaEdition = 'bn.bengali';

  static const int totalSurahs = 114;
  static const int totalJuz = 30;
  static const int totalPages = 604;
  static const int totalHizbQuarters = 240;
}
