import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../prayer/presentation/providers/prayer_providers.dart';

class IslamicCalendarScreen extends ConsumerWidget {
  const IslamicCalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hijriAsync = ref.watch(hijriDateProvider);

    final months = [
      'Muharram', 'Safar', 'Rabi al-Awwal', 'Rabi al-Thani',
      'Jumada al-Ula', 'Jumada al-Thani', 'Rajab', 'Sha\'ban',
      'Ramadan', 'Shawwal', 'Dhul Qi\'dah', 'Dhul Hijjah',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Islamic Calendar')),
      body: hijriAsync.when(
        data: (data) {
          final hijri = data['hijri'] ?? {};
          final monthIndex = (hijri['month']?['number'] ?? 1) - 1;
          final monthName = months[monthIndex.clamp(0, 11)];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.primaryColor,
                        AppTheme.primaryColor.withValues(alpha: 0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Text(
                        hijri['day']?.toString() ?? '',
                        style: GoogleFonts.cairo(
                          fontSize: 64,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        monthName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        hijri['year']?.toString() ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                      const Text(
                        'AH',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          'Gregorian Date',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          data['gregorian']?['date'] ?? '',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Months',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 12),
                ...List.generate(months.length, (index) {
                  final isCurrentMonth = index == monthIndex;
                  return Card(
                    margin: const EdgeInsets.only(bottom: 6),
                    color: isCurrentMonth
                        ? AppTheme.primaryColor.withValues(alpha: 0.1)
                        : null,
                    child: ListTile(
                      leading: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: isCurrentMonth
                              ? AppTheme.primaryColor
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: isCurrentMonth ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        months[index],
                        style: TextStyle(
                          fontWeight:
                              isCurrentMonth ? FontWeight.w700 : FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
