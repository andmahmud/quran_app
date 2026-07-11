import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/constants/api_constants.dart';

final prayerRemoteDataSourceProvider = Provider<PrayerRemoteDataSource>((ref) {
  return PrayerRemoteDataSource(ref.read(dioClientProvider));
});

class PrayerRemoteDataSource {
  final DioClient _dioClient;

  PrayerRemoteDataSource(this._dioClient);

  Future<Map<String, dynamic>> getPrayerTimes(String city, String country) async {
    final response = await _dioClient.get(
      '/timingsByCity',
      queryParameters: {
        'city': city,
        'country': country,
      },
      baseUrl: ApiConstants.aladhanBaseUrl,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getQibla(double latitude, double longitude) async {
    final response = await _dioClient.get(
      '/qibla/$latitude/$longitude',
      baseUrl: ApiConstants.aladhanBaseUrl,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getHijriDate() async {
    final now = DateTime.now();
    final response = await _dioClient.get(
      '/gToH/${now.day}-${now.month}-${now.year}',
      baseUrl: ApiConstants.aladhanBaseUrl,
    );
    return response.data;
  }
}
