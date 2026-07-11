import '../../../../shared/models/surah_model.dart';
import '../../../../shared/models/ayah_model.dart';

abstract class QuranRepository {
  Future<List<SurahModel>> getAllSurahs();
  Future<SurahModel?> getSurah(int surahNumber);
  Future<List<AyahModel>> getSurahAyahs(int surahNumber);
  Future<List<AyahModel>> searchAyahs(String query);
  Future<Map<String, dynamic>> getRandomAyah();
}
