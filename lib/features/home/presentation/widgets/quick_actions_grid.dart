import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      _ActionItem(
        icon: Icons.menu_book_rounded,
        labelKey: 'surah_list',
        color: const Color(0xFF1B5E20),
        route: '/home/surah-list',
      ),
      _ActionItem(
        icon: Icons.book_rounded,
        labelKey: 'juz_list',
        color: const Color(0xFF2E7D32),
        route: '/home/juz-list',
      ),
      _ActionItem(
        icon: Icons.headphones_rounded,
        labelKey: 'audio',
        color: const Color(0xFF388E3C),
        route: '/home/audio-player',
      ),
      _ActionItem(
        icon: Icons.location_on_rounded,
        labelKey: 'prayer_times',
        color: const Color(0xFF43A047),
        route: '/home/prayer-times',
      ),
      _ActionItem(
        icon: Icons.explore_rounded,
        labelKey: 'qibla',
        color: const Color(0xFF4CAF50),
        route: '/home/qibla',
      ),
      _ActionItem(
        icon: Icons.search_rounded,
        labelKey: 'search',
        color: const Color(0xFF66BB6A),
        route: '/home/search',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return InkWell(
          onTap: () {
            if (action.route == '/home/audio-player') {
              context.push(action.route, extra: {
                'surahNumber': 1,
                'surahName': 'Al-Fatihah',
              });
            } else {
              context.push(action.route);
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              color: action.color.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(action.icon, color: action.color, size: 28),
                const SizedBox(height: 8),
                Text(
                  action.labelKey.tr(),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: action.color,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
            .animate()
            .fadeIn(
                delay: Duration(milliseconds: index * 80), duration: 500.ms)
            .scale(begin: const Offset(0.8, 0.8));
      },
    );
  }
}

class _ActionItem {
  final IconData icon;
  final String labelKey;
  final Color color;
  final String route;

  const _ActionItem({
    required this.icon,
    required this.labelKey,
    required this.color,
    required this.route,
  });
}
