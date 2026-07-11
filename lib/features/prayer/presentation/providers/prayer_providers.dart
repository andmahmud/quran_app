import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/prayer_repository_impl.dart';

final prayerTimesProvider =
    FutureProvider.family<Map<String, dynamic>, ({String city, String country})>(
        (ref, params) async {
  final repo = ref.read(prayerRepositoryProvider);
  return await repo.getPrayerTimes(params.city, params.country);
});

final qiblaProvider =
    FutureProvider.family<Map<String, dynamic>, ({double lat, double lng})>(
        (ref, params) async {
  final repo = ref.read(prayerRepositoryProvider);
  return await repo.getQibla(params.lat, params.lng);
});

final hijriDateProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final repo = ref.read(prayerRepositoryProvider);
  return await repo.getHijriDate();
});

final selectedCityProvider = StateProvider<String>((ref) => 'Dhaka');
final selectedCountryProvider = StateProvider<String>((ref) => 'Bangladesh');
