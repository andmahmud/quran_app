import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/models/surah_model.dart';
import '../../../../shared/models/ayah_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../datasources/quran_remote_datasource.dart';
import '../datasources/quran_local_datasource.dart';
import '../../domain/repositories/quran_repository.dart';

final quranRepositoryProvider = Provider<QuranRepository>((ref) {
  return QuranRepositoryImpl(
    remoteDataSource: ref.read(quranRemoteDataSourceProvider),
    localDataSource: ref.read(quranLocalDataSourceProvider),
  );
});

class QuranRepositoryImpl implements QuranRepository {
  final QuranRemoteDataSource remoteDataSource;
  final QuranLocalDataSource localDataSource;

  QuranRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<SurahModel>> getAllSurahs() async {
    final localSurahs = await localDataSource.getSurahs();
    if (localSurahs.isNotEmpty) return localSurahs;

    try {
      final response = await remoteDataSource.getAllSurahs();
      final List<dynamic> data = response['data'] ?? [];
      final surahs = data.map((json) {
        final model = SurahModel()
          ..surahNumber = json['number']
          ..nameArabic = json['name'] ?? ''
          ..nameEnglish = json['englishName'] ?? ''
          ..nameTranslated = json['englishNameTranslation'] ?? ''
          ..revelationType = json['revelationType'] ?? ''
          ..totalAyahs = json['numberOfAyahs'] ?? 0;
        return model;
      }).toList();

      await localDataSource.saveSurahs(surahs);
      return surahs;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<AyahModel>> getSurahAyahs(int surahNumber) async {
    final hasLocal = await localDataSource.hasAyahs(surahNumber);
    if (hasLocal) {
      return await localDataSource.getAyahs(surahNumber);
    }

    try {
      final response = await remoteDataSource.getSurah(surahNumber);
      final List<dynamic> data = response['data']?['ayahs'] ?? [];
      final ayahs = <AyahModel>[];

      for (int i = 0; i < data.length; i++) {
        final json = data[i];
        final model = AyahModel()
          ..surahNumber = surahNumber
          ..ayahNumber = json['numberInSurah'] ?? (i + 1)
          ..arabicText = json['text'] ?? ''
          ..translationText = ''
          ..juz = json['juz'] ?? 1
          ..page = json['page'] ?? 1
          ..hizb = json['hizbQuarter'] ?? 1
          ..ruku = json['ruku'] ?? 1;
        ayahs.add(model);
      }

      if (response['data']?['ayahs'] != null) {
        for (int i = 0; i < ayahs.length && i < data.length; i++) {
          final editions = data[i]['edition'];
          if (editions is List) {
            for (final edition in editions) {
              if (edition['language'] == 'en') {
                ayahs[i].translationText = edition['text'] ?? '';
              }
            }
          }
        }
      }

      await localDataSource.saveAyahs(ayahs);
      await localDataSource.addRecentSurah(surahNumber);
      return ayahs;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<SurahModel?> getSurah(int surahNumber) async {
    return await localDataSource.getSurah(surahNumber);
  }

  @override
  Future<List<AyahModel>> searchAyahs(String query) async {
    final allSurahs = await localDataSource.getSurahs();
    final results = <AyahModel>[];

    for (final surah in allSurahs) {
      final ayahs = await localDataSource.getAyahs(surah.surahNumber);
      for (final ayah in ayahs) {
        if (ayah.arabicText.toLowerCase().contains(query.toLowerCase()) ||
            ayah.translationText.toLowerCase().contains(query.toLowerCase())) {
          results.add(ayah);
        }
      }
      if (results.length >= 50) break;
    }
    return results;
  }

  @override
  Future<Map<String, dynamic>> getRandomAyah() async {
    try {
      return await remoteDataSource.getRandomAyah();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<AyahModel>> getJuzAyahs(int juzNumber) async {
    try {
      final response = await remoteDataSource.getJuz(juzNumber);
      final dynamic juzData = response['data'];
      if (juzData is List && juzData.isNotEmpty) {
        final editions = juzData;
        final arabicAyahs = editions[0]['ayahs'] as List<dynamic>? ?? [];
        final englishEditions = editions.length > 1 ? editions[1] : null;
        final englishAyahs = englishEditions?['ayahs'] as List<dynamic>? ?? [];
        final ayahs = <AyahModel>[];
        for (int i = 0; i < arabicAyahs.length; i++) {
          final arabic = arabicAyahs[i];
          final surahInfo = arabic['surah'] as Map<String, dynamic>?;
          final model = AyahModel()
            ..surahNumber = surahInfo?['number'] ?? 0
            ..ayahNumber = arabic['numberInSurah'] ?? (i + 1)
            ..arabicText = arabic['text'] ?? ''
            ..translationText =
                i < englishAyahs.length ? (englishAyahs[i]['text'] ?? '') : ''
            ..juz = arabic['juz'] ?? juzNumber
            ..page = arabic['page'] ?? 1
            ..hizb = arabic['hizbQuarter'] ?? 1
            ..ruku = arabic['ruku'] ?? 1;
          ayahs.add(model);
        }
        return ayahs;
      } else if (juzData is Map<String, dynamic>) {
        final arabicAyahs = juzData['ayahs'] as List<dynamic>? ?? [];
        final ayahs = <AyahModel>[];
        for (int i = 0; i < arabicAyahs.length; i++) {
          final arabic = arabicAyahs[i];
          final surahInfo = arabic['surah'] as Map<String, dynamic>?;
          final model = AyahModel()
            ..surahNumber = surahInfo?['number'] ?? 0
            ..ayahNumber = arabic['numberInSurah'] ?? (i + 1)
            ..arabicText = arabic['text'] ?? ''
            ..translationText = ''
            ..juz = arabic['juz'] ?? juzNumber
            ..page = arabic['page'] ?? 1
            ..hizb = arabic['hizbQuarter'] ?? 1
            ..ruku = arabic['ruku'] ?? 1;
          ayahs.add(model);
        }
        return ayahs;
      }
      return [];
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
