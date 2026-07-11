import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';

class NinetyNineNamesScreen extends StatelessWidget {
  const NinetyNineNamesScreen({super.key});

  static const List<Map<String, String>> _names = [
    {'arabic': 'الرَّحْمَنُ', 'transliteration': 'Ar-Rahman', 'meaning': 'The Most Gracious'},
    {'arabic': 'الرَّحِيمُ', 'transliteration': 'Ar-Raheem', 'meaning': 'The Most Merciful'},
    {'arabic': 'الْمَلِكُ', 'transliteration': 'Al-Malik', 'meaning': 'The King'},
    {'arabic': 'الْقُدُّوسُ', 'transliteration': 'Al-Quddus', 'meaning': 'The Holy'},
    {'arabic': 'السَّلَامُ', 'transliteration': 'As-Salam', 'meaning': 'The Source of Peace'},
    {'arabic': 'الْمُؤْمِنُ', 'transliteration': 'Al-Mu\'min', 'meaning': 'The Guardian of Faith'},
    {'arabic': 'الْمُهَيْمِنُ', 'transliteration': 'Al-Muhaymin', 'meaning': 'The Protector'},
    {'arabic': 'الْعَزِيزُ', 'transliteration': 'Al-Aziz', 'meaning': 'The Mighty'},
    {'arabic': 'الْجَبَّارُ', 'transliteration': 'Al-Jabbar', 'meaning': 'The Compeller'},
    {'arabic': 'الْمُتَكَبِّرُ', 'transliteration': 'Al-Mutakabbir', 'meaning': 'The Supreme'},
    {'arabic': 'الْخَالِقُ', 'transliteration': 'Al-Khaliq', 'meaning': 'The Creator'},
    {'arabic': 'الْبَارِئُ', 'transliteration': 'Al-Bari', 'meaning': 'The Evolver'},
    {'arabic': 'الْمُصَوِّرُ', 'transliteration': 'Al-Musawwir', 'meaning': 'The Fashioner'},
    {'arabic': 'الْغَفَّارُ', 'transliteration': 'Al-Ghaffar', 'meaning': 'The Forgiver'},
    {'arabic': 'الْقَهَّارُ', 'transliteration': 'Al-Qahhar', 'meaning': 'The Subduer'},
    {'arabic': 'الْوَهَّابُ', 'transliteration': 'Al-Wahhab', 'meaning': 'The Bestower'},
    {'arabic': 'الرَّزَّاقُ', 'transliteration': 'Ar-Razzaq', 'meaning': 'The Provider'},
    {'arabic': 'الْفَتَّاحُ', 'transliteration': 'Al-Fattah', 'meaning': 'The Opener'},
    {'arabic': 'الْعَلِيمُ', 'transliteration': 'Al-Alim', 'meaning': 'The All-Knowing'},
    {'arabic': 'الْقَابِضُ', 'transliteration': 'Al-Qabid', 'meaning': 'The Restrainer'},
    {'arabic': 'الْبَاسِطُ', 'transliteration': 'Al-Basit', 'meaning': 'The Reliever'},
    {'arabic': 'الْخَافِضُ', 'transliteration': 'Al-Khafid', 'meaning': 'The Abaser'},
    {'arabic': 'الرَّافِعُ', 'transliteration': 'Ar-Rafi', 'meaning': 'The Exalter'},
    {'arabic': 'الْمُعِزُّ', 'transliteration': 'Al-Muizz', 'meaning': 'The Bestower of Honor'},
    {'arabic': 'الْمُذِلُّ', 'transliteration': 'Al-Muzill', 'meaning': 'The Humiliator'},
    {'arabic': 'السَّمِيعُ', 'transliteration': 'As-Sami', 'meaning': 'The All-Hearing'},
    {'arabic': 'الْبَصِيرُ', 'transliteration': 'Al-Basir', 'meaning': 'The All-Seeing'},
    {'arabic': 'الْحَكَمُ', 'transliteration': 'Al-Hakam', 'meaning': 'The Judge'},
    {'arabic': 'الْعَدْلُ', 'transliteration': 'Al-Adl', 'meaning': 'The Just'},
    {'arabic': 'اللَّطِيفُ', 'transliteration': 'Al-Latif', 'meaning': 'The Subtle One'},
    {'arabic': 'الْخَبِيرُ', 'transliteration': 'Al-Khabir', 'meaning': 'The All-Aware'},
    {'arabic': 'الْحَلِيمُ', 'transliteration': 'Al-Halim', 'meaning': 'The Forbearing'},
    {'arabic': 'الْعَظِيمُ', 'transliteration': 'Al-Azeem', 'meaning': 'The Magnificent'},
    {'arabic': 'الْغَفُورُ', 'transliteration': 'Al-Ghafur', 'meaning': 'The Forgiving'},
    {'arabic': 'الشَّكُورُ', 'transliteration': 'Ash-Shakur', 'meaning': 'The Appreciative'},
    {'arabic': 'الْعَلِيُّ', 'transliteration': 'Al-Aliyy', 'meaning': 'The Most High'},
    {'arabic': 'الْكَبِيرُ', 'transliteration': 'Al-Kabir', 'meaning': 'The Greatest'},
    {'arabic': 'الْحَفِيظُ', 'transliteration': 'Al-Hafiz', 'meaning': 'The Preserver'},
    {'arabic': 'الْمُقِيتُ', 'transliteration': 'Al-Muqit', 'meaning': 'The Sustainer'},
    {'arabic': 'الْحَسِيبُ', 'transliteration': 'Al-Hasib', 'meaning': 'The Reckoner'},
    {'arabic': 'الْجَلِيلُ', 'transliteration': 'Al-Jalil', 'meaning': 'The Majestic'},
    {'arabic': 'الْكَرِيمُ', 'transliteration': 'Al-Karim', 'meaning': 'The Generous'},
    {'arabic': 'الرَّقِيبُ', 'transliteration': 'Ar-Raqib', 'meaning': 'The Watchful'},
    {'arabic': 'الْمُجِيبُ', 'transliteration': 'Al-Mujib', 'meaning': 'The Responsive'},
    {'arabic': 'الْوَاسِعُ', 'transliteration': 'Al-Wasi', 'meaning': 'The All-Encompassing'},
    {'arabic': 'الْحَكِيمُ', 'transliteration': 'Al-Hakim', 'meaning': 'The Wise'},
    {'arabic': 'الْوَدُودُ', 'transliteration': 'Al-Wadud', 'meaning': 'The Loving'},
    {'arabic': 'الْمَجِيدُ', 'transliteration': 'Al-Majid', 'meaning': 'The Glorious'},
    {'arabic': 'الْبَاعِثُ', 'transliteration': 'Al-Baith', 'meaning': 'The Resurrector'},
    {'arabic': 'الشَّهِيدُ', 'transliteration': 'Ash-Shahid', 'meaning': 'The Witness'},
    {'arabic': 'الْحَقُّ', 'transliteration': 'Al-Haqq', 'meaning': 'The Truth'},
    {'arabic': 'الْوَكِيلُ', 'transliteration': 'Al-Wakil', 'meaning': 'The Trustee'},
    {'arabic': 'الْقَوِيُّ', 'transliteration': 'Al-Qawwyy', 'meaning': 'The Strong'},
    {'arabic': 'الْمَتِينُ', 'transliteration': 'Al-Matin', 'meaning': 'The Firm'},
    {'arabic': 'الْوَلِيُّ', 'transliteration': 'Al-Waliyy', 'meaning': 'The Patron'},
    {'arabic': 'الْحَمِيدُ', 'transliteration': 'Al-Hamid', 'meaning': 'The Praiseworthy'},
    {'arabic': 'الْمُحْصِي', 'transliteration': 'Al-Muhsi', 'meaning': 'The Counter'},
    {'arabic': 'الْمُبْدِئُ', 'transliteration': 'Al-Mubdi', 'meaning': 'The Originator'},
    {'arabic': 'الْمُعِيدُ', 'transliteration': 'Al-Mu\'id', 'meaning': 'The Restorer'},
    {'arabic': 'الْمُحْيِي', 'transliteration': 'Al-Muhyi', 'meaning': 'The Giver of Life'},
    {'arabic': 'الْمُمِيتُ', 'transliteration': 'Al-Mumit', 'meaning': 'The Giver of Death'},
    {'arabic': 'الْحَيُّ', 'transliteration': 'Al-Hayy', 'meaning': 'The Ever-Living'},
    {'arabic': 'الْقَيُّومُ', 'transliteration': 'Al-Qayyum', 'meaning': 'The Self-Subsisting'},
    {'arabic': 'الْوَاجِدُ', 'transliteration': 'Al-Wajid', 'meaning': 'The Finder'},
    {'arabic': 'الْمَاجِدُ', 'transliteration': 'Al-Majid', 'meaning': 'The Noble'},
    {'arabic': 'الْوَاحِدُ', 'transliteration': 'Al-Wahid', 'meaning': 'The One'},
    {'arabic': 'الصَّمَدُ', 'transliteration': 'As-Samad', 'meaning': 'The Eternal'},
    {'arabic': 'الْقَادِرُ', 'transliteration': 'Al-Qadir', 'meaning': 'The Capable'},
    {'arabic': 'الْمُقْتَدِرُ', 'transliteration': 'Al-Muqtadir', 'meaning': 'The Powerful'},
    {'arabic': 'الْمُقَدِّمُ', 'transliteration': 'Al-Muqaddim', 'meaning': 'The Expediter'},
    {'arabic': 'الْمُؤَخِّرُ', 'transliteration': 'Al-Muakhkhir', 'meaning': 'The Delayer'},
    {'arabic': 'الْأَوَّلُ', 'transliteration': 'Al-Awwal', 'meaning': 'The First'},
    {'arabic': 'الْآخِرُ', 'transliteration': 'Al-Akhir', 'meaning': 'The Last'},
    {'arabic': 'الظَّاهِرُ', 'transliteration': 'Az-Zahir', 'meaning': 'The Manifest'},
    {'arabic': 'الْبَاطِنُ', 'transliteration': 'Al-Batin', 'meaning': 'The Hidden'},
    {'arabic': 'الْوَالِي', 'transliteration': 'Al-Wali', 'meaning': 'The Governor'},
    {'arabic': 'الْمُتَعَالِي', 'transliteration': 'Al-Muta\'ali', 'meaning': 'The Exalted'},
    {'arabic': 'الْبَرُّ', 'transliteration': 'Al-Barr', 'meaning': 'The Beneficent'},
    {'arabic': 'التَّوَّابُ', 'transliteration': 'At-Tawwab', 'meaning': 'The Oft-Returning'},
    {'arabic': 'الْمُنْتَقِمُ', 'transliteration': 'Al-Muntaqim', 'meaning': 'The Avenger'},
    {'arabic': 'العَفُوُّ', 'transliteration': 'Al-Afuww', 'meaning': 'The Pardoner'},
    {'arabic': 'الرَّؤُوفُ', 'transliteration': 'Ar-Ra\'uf', 'meaning': 'The Compassionate'},
    {'arabic': 'مَالِكُ الْمُلْكِ', 'transliteration': 'Malik-ul-Mulk', 'meaning': 'Master of Sovereignty'},
    {'arabic': 'ذُو الْجَلَالِ وَالْإِكْرَامِ', 'transliteration': 'Dhul-Jalal wal-Ikram', 'meaning': 'Lord of Majesty and Honor'},
    {'arabic': 'الْمُقْسِطُ', 'transliteration': 'Al-Muqsit', 'meaning': 'The Equitable'},
    {'arabic': 'الْجَامِعُ', 'transliteration': 'Al-Jami', 'meaning': 'The Gatherer'},
    {'arabic': 'الْغَنِيُّ', 'transliteration': 'Al-Ghaniyy', 'meaning': 'The Rich'},
    {'arabic': 'الْمُغْنِي', 'transliteration': 'Al-Mughni', 'meaning': 'The Enricher'},
    {'arabic': 'الْمَانِعُ', 'transliteration': 'Al-Mani', 'meaning': 'The Preventer'},
    {'arabic': 'الضَّارُّ', 'transliteration': 'Ad-Darr', 'meaning': 'The Harmer'},
    {'arabic': 'النَّافِعُ', 'transliteration': 'An-Nafi', 'meaning': 'The Benefiter'},
    {'arabic': 'النُّورُ', 'transliteration': 'An-Nur', 'meaning': 'The Light'},
    {'arabic': 'الْهَادِي', 'transliteration': 'Al-Hadi', 'meaning': 'The Guide'},
    {'arabic': 'الْبَدِيعُ', 'transliteration': 'Al-Badi', 'meaning': 'The Incomparable'},
    {'arabic': 'الْبَاقِي', 'transliteration': 'Al-Baqi', 'meaning': 'The Everlasting'},
    {'arabic': 'الْوَارِثُ', 'transliteration': 'Al-Warith', 'meaning': 'The Inheritor'},
    {'arabic': 'الرَّشِيدُ', 'transliteration': 'Ar-Rashid', 'meaning': 'The Righteous Guide'},
    {'arabic': 'الصَّبُورُ', 'transliteration': 'As-Sabur', 'meaning': 'The Patient'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('99 Names of Allah'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _names.length,
        itemBuilder: (context, index) {
          final name = _names[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
              ),
              title: Text(
                name['transliteration']!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                name['meaning']!,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              trailing: Text(
                name['arabic']!,
                style: GoogleFonts.amiri(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
              .animate()
              .fadeIn(delay: Duration(milliseconds: index * 20), duration: 400.ms);
        },
      ),
    );
  }
}
