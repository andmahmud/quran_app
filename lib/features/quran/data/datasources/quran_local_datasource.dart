import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/services/database_service.dart';
import '../../../../shared/models/surah_model.dart';
import '../../../../shared/models/ayah_model.dart';

final quranLocalDataSourceProvider = Provider<QuranLocalDataSource>((ref) {
  return QuranLocalDataSource(ref.read(databaseServiceProvider));
});

class QuranLocalDataSource {
  final DatabaseService _databaseService;

  QuranLocalDataSource(this._databaseService);

  Future<List<SurahModel>> getSurahs() async {
    return await _databaseService.getAllSurahs();
  }

  Future<SurahModel?> getSurah(int surahNumber) async {
    return await _databaseService.getSurah(surahNumber);
  }

  Future<void> saveSurahs(List<SurahModel> surahs) async {
    await _databaseService.saveSurahs(surahs);
  }

  Future<List<AyahModel>> getAyahs(int surahNumber) async {
    return await _databaseService.getAyahsBySurah(surahNumber);
  }

  Future<void> saveAyahs(List<AyahModel> ayahs) async {
    await _databaseService.saveAyahs(ayahs);
  }

  Future<bool> hasAyahs(int surahNumber) async {
    return await _databaseService.hasSurahAyahs(surahNumber);
  }

  Future<void> addRecentSurah(int surahNumber) async {
    await _databaseService.addRecentSurah(surahNumber);
  }

  Future<List<dynamic>> getRecentSurahs({int limit = 10}) async {
    return await _databaseService.getRecentSurahs(limit: limit);
  }
}
