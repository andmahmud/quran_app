class Reciter {
  final String id;
  final String name;
  final String path;

  const Reciter({
    required this.id,
    required this.name,
    required this.path,
  });
}

class Reciters {
  Reciters._();

  static const List<Reciter> availableReciters = [
    Reciter(
      id: 'ar.alafasy',
      name: 'Mishary Rashid Alafasy',
      path: 'mishaari_raashid_al_3afaasee',
    ),
    Reciter(
      id: 'ar.muhammadjibreel',
      name: 'Muhammad Jibreel',
      path: 'muhammad_jibreel',
    ),
    Reciter(
      id: 'ar.maalminturanquran',
      name: 'Abdul Basit (Murattal)',
      path: 'abdul_basit_abdul_majid_murattal',
    ),
    Reciter(
      id: 'ar.minshawi',
      name: 'Muhammad Siddiq El-Minshawi',
      path: 'muhammad_siddiq_minshawi_murattal',
    ),
    Reciter(
      id: 'ar.husary',
      name: 'Mahmoud Khalil Al-Husary',
      path: 'mahmoud_khalil_alhusary',
    ),
    Reciter(
      id: 'ar.ayyoub',
      name: 'Muhammad Ayyoub',
      path: 'muhammad_ayyoub',
    ),
  ];

  static Reciter get defaultReciter => availableReciters.first;

  static Reciter? getById(String id) {
    try {
      return availableReciters.firstWhere((r) => r.id == id);
    } catch (_) {
      return null;
    }
  }

  static String getAudioUrl(String reciterPath, int surahNumber) {
    final padded = surahNumber.toString().padLeft(3, '0');
    return 'https://download.quranicaudio.com/quran/$reciterPath/$padded.mp3';
  }
}
