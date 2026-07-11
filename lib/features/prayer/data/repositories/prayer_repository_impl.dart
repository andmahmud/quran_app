import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../datasources/prayer_remote_datasource.dart';
import '../../domain/repositories/prayer_repository.dart';

final prayerRepositoryProvider = Provider<PrayerRepository>((ref) {
  return PrayerRepositoryImpl(ref.read(prayerRemoteDataSourceProvider));
});

class PrayerRepositoryImpl implements PrayerRepository {
  final PrayerRemoteDataSource _remoteDataSource;

  PrayerRepositoryImpl(this._remoteDataSource);

  @override
  Future<Map<String, dynamic>> getPrayerTimes(String city, String country) async {
    try {
      final response = await _remoteDataSource.getPrayerTimes(city, country);
      return response['data'] ?? {};
    } catch (e) {
      throw Exception('Failed to load prayer times: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getQibla(double latitude, double longitude) async {
    try {
      final response = await _remoteDataSource.getQibla(latitude, longitude);
      return response['data'] ?? {};
    } catch (e) {
      throw Exception('Failed to load qibla direction: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getHijriDate() async {
    try {
      final response = await _remoteDataSource.getHijriDate();
      return response['data'] ?? {};
    } catch (e) {
      throw Exception('Failed to load hijri date: $e');
    }
  }
}
