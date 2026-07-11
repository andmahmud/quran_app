import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';
import '../providers/prayer_providers.dart';

class PrayerTimesScreen extends ConsumerStatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  ConsumerState<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends ConsumerState<PrayerTimesScreen> {
  @override
  Widget build(BuildContext context) {
    final city = ref.watch(selectedCityProvider);
    final country = ref.watch(selectedCountryProvider);
    final prayerTimesAsync = ref.watch(
      prayerTimesProvider((city: city, country: country)),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Times'),
        actions: [
          IconButton(
            icon: const Icon(Icons.explore),
            onPressed: () => context.push('/home/qibla'),
            tooltip: 'Qibla',
          ),
        ],
      ),
      body: prayerTimesAsync.when(
        data: (data) {
          final timings = data['timings'] as Map<String, dynamic>? ?? {};
          final date = data['date'] as Map<String, dynamic>? ?? {};

          final prayers = [
            {'name': 'Fajr', 'time': timings['Fajr'] ?? '--', 'icon': Icons.wb_sunny_outlined},
            {'name': 'Sunrise', 'time': timings['Sunrise'] ?? '--', 'icon': Icons.wb_sunny},
            {'name': 'Dhuhr', 'time': timings['Dhuhr'] ?? '--', 'icon': Icons.wb_sunny_outlined},
            {'name': 'Asr', 'time': timings['Asr'] ?? '--', 'icon': Icons.wb_cloudy},
            {'name': 'Maghrib', 'time': timings['Maghrib'] ?? '--', 'icon': Icons.wb_twilight},
            {'name': 'Isha', 'time': timings['Isha'] ?? '--', 'icon': Icons.nights_stay},
          ];

          return Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.primaryColor,
                      AppTheme.primaryColor.withOpacity(0.8),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.mosque, color: Colors.white, size: 48),
                    const SizedBox(height: 8),
                    Text(
                      city,
                      style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (date['hijri'] != null)
                      Text(
                        '${date['hijri']['day']} ${date['hijri']['month']['en']} ${date['hijri']['year']} AH',
                        style: const TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: prayers.length,
                  itemBuilder: (context, index) {
                    final prayer = prayers[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Icon(
                          prayer['icon'] as IconData,
                          color: AppTheme.primaryColor,
                        ),
                        title: Text(
                          prayer['name'] as String,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        trailing: Text(
                          prayer['time'] as String,
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(
                            delay: Duration(milliseconds: index * 80),
                            duration: 400.ms);
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(e.toString()),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(
                    prayerTimesProvider((city: city, country: country))),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
