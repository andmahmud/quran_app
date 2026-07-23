import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/constants/api_constants.dart';

final quranRemoteDataSourceProvider = Provider<QuranRemoteDataSource>((ref) {
  return QuranRemoteDataSource(ref.read(dioClientProvider));
});

class QuranRemoteDataSource {
  final DioClient _dioClient;

  QuranRemoteDataSource(this._dioClient);

  Future<Map<String, dynamic>> getAllSurahs() async {
    final response = await _dioClient.get('/surah');
    return response.data;
  }

  Future<Map<String, dynamic>> getSurah(int surahNumber, {String? edition}) async {
    final editions = edition ?? '${ApiConstants.defaultArabicEdition},${ApiConstants.defaultEnglishEdition}';
    final response = await _dioClient.get(
      '/surah/$surahNumber',
      queryParameters: {'editions': editions},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getRandomAyah() async {
    final response = await _dioClient.get(
      '/ayah/random/${ApiConstants.defaultEnglishEdition}',
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getJuz(int juzNumber) async {
    final response = await _dioClient.get(
      '/juz/$juzNumber',
      queryParameters: {
        'editions': '${ApiConstants.defaultArabicEdition},${ApiConstants.defaultEnglishEdition}'
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getPage(int pageNumber) async {
    final response = await _dioClient.get(
      '/page/$pageNumber',
      queryParameters: {
        'editions': '${ApiConstants.defaultArabicEdition},${ApiConstants.defaultEnglishEdition}'
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getSurahAudio(int surahNumber, String edition) async {
    final response = await _dioClient.get('/surah/$surahNumber/$edition');
    return response.data;
  }

  Future<Map<String, dynamic>> searchEditions(String language) async {
    final response = await _dioClient.get('/edition/language/$language');
    return response.data;
  }
}
