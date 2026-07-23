import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  int _count = 0;
  final int _target = 33;
  int _selectedIndex = 0;

  final List<Map<String, String>> _dhikr = [
    {'arabic': 'سُبْحَانَ اللَّهِ', 'english': 'SubhanAllah', 'meaning': 'Glory be to Allah'},
    {'arabic': 'الْحَمْدُ لِلَّهِ', 'english': 'Alhamdulillah', 'meaning': 'Praise be to Allah'},
    {'arabic': 'اللَّهُ أَكْبَرُ', 'english': 'Allahu Akbar', 'meaning': 'Allah is Greatest'},
    {'arabic': 'لَا إِلَٰهَ إِلَّا اللَّهُ', 'english': 'La Ilaha IllAllah', 'meaning': 'There is no god but Allah'},
    {'arabic': 'أَسْتَغْفِرُ اللَّهَ', 'english': 'Astaghfirullah', 'meaning': 'I seek forgiveness from Allah'},
    {'arabic': 'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ', 'english': 'La Hawla Wa La Quwwa', 'meaning': 'There is no power except with Allah'},
  ];

  void _increment() {
    HapticFeedback.lightImpact();
    setState(() {
      _count++;
      if (_count >= _target) {
        _count = 0;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Target reached! Starting new cycle.'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    });
  }

  void _reset() {
    setState(() => _count = 0);
  }

  @override
  Widget build(BuildContext context) {
    final dhikr = _dhikr[_selectedIndex];
    final progress = _count / _target;

    return Scaffold(
      appBar: AppBar(title: const Text('Tasbih')),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.primaryColor.withValues(alpha: 0.05),
              Theme.of(context).scaffoldBackgroundColor,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _dhikr.length,
                itemBuilder: (context, index) {
                  final isSelected = index == _selectedIndex;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(
                        _dhikr[index]['english']!,
                        style: TextStyle(
                          color: isSelected ? Colors.white : null,
                          fontSize: 12,
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: AppTheme.primaryColor,
                      onSelected: (selected) {
                        setState(() {
                          _selectedIndex = index;
                          _count = 0;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            Text(
              dhikr['arabic']!,
              style: GoogleFonts.amiri(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: AppTheme.primaryColor,
              ),
            ).animate().fadeIn(duration: 400.ms),
            const SizedBox(height: 8),
            Text(
              dhikr['english']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              dhikr['meaning']!,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 6,
                      backgroundColor: Colors.grey.shade200,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  Text(
                    '$_count',
                    style: GoogleFonts.cairo(
                      fontSize: 64,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$_count / $_target',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: _reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: _increment,
                  icon: const Icon(Icons.add),
                  label: const Text('Count'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(160, 56),
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
