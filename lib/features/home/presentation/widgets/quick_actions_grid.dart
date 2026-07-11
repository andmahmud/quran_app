import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      _ActionItem(
        icon: Icons.menu_book_rounded,
        label: 'Surah List',
        color: AppTheme.primaryColor,
        route: '/home/surah-list',
      ),
      _ActionItem(
        icon: Icons.book_rounded,
        label: 'Juz List',
        color: Colors.orange.shade700,
        route: '/home/juz-list',
      ),
      _ActionItem(
        icon: Icons.headphones_rounded,
        label: 'Audio',
        color: Colors.blue.shade700,
        route: '/home/audio-player',
      ),
      _ActionItem(
        icon: Icons.location_on_rounded,
        label: 'Prayer Times',
        color: Colors.teal.shade700,
        route: '/home/prayer-times',
      ),
      _ActionItem(
        icon: Icons.explore_rounded,
        label: 'Qibla',
        color: Colors.purple.shade700,
        route: '/home/qibla',
      ),
      _ActionItem(
        icon: Icons.search_rounded,
        label: 'Search',
        color: Colors.red.shade700,
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
              color: action.color.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(action.icon, color: action.color, size: 28),
                const SizedBox(height: 8),
                Text(
                  action.label,
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
  final String label;
  final Color color;
  final String route;

  const _ActionItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.route,
  });
}
