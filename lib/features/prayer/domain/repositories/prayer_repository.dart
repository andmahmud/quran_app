abstract class PrayerRepository {
  Future<Map<String, dynamic>> getPrayerTimes(String city, String country);
  Future<Map<String, dynamic>> getQibla(double latitude, double longitude);
  Future<Map<String, dynamic>> getHijriDate();
}
