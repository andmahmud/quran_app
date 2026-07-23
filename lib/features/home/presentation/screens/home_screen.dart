import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/theme/app_theme.dart';
import '../widgets/continue_reading_card.dart';
import '../widgets/daily_verse_card.dart';
import '../widgets/quick_actions_grid.dart';
import '../widgets/prayer_times_card.dart';
import '../widgets/recent_surahs_section.dart';
import '../widgets/random_ayah_card.dart';
import '../../../quran/presentation/providers/quran_providers.dart';
import '../../../settings/presentation/screens/settings_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _HomeContent(),
          const _QuranTab(),
          const _BookmarksTab(),
          const _SettingsTab(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        indicatorColor: AppTheme.primaryColor.withValues(alpha: 0.2),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home, color: AppTheme.primaryColor),
            label: 'home'.tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.menu_book_outlined),
            selectedIcon: const Icon(Icons.menu_book, color: AppTheme.primaryColor),
            label: 'quran'.tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.bookmark_outline),
            selectedIcon: const Icon(Icons.bookmark, color: AppTheme.primaryColor),
            label: 'bookmarks'.tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings, color: AppTheme.primaryColor),
            label: 'settings'.tr(),
          ),
        ],
      ),
    );
  }
}

class _HomeContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 180,
          floating: true,
          pinned: true,
          backgroundColor: const Color(0xFF1B5E20),
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => context.push('/home/search'),
            ),
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1B5E20), Color(0xFF2E7D32), Color(0xFF388E3C)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Assalamu Alaikum',
                        style: GoogleFonts.cairo(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'app_name'.tr(),
                        style: GoogleFonts.amiri(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.mosque_rounded, color: Colors.white.withValues(alpha: 0.7), size: 16),
                          const SizedBox(width: 6),
                          Text(
                            'Read • Listen • Reflect',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.7),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            titlePadding: EdgeInsets.zero,
            title: const SizedBox.shrink(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContinueReadingCard(),
                const SizedBox(height: 16),
                const DailyVerseCard(),
                const SizedBox(height: 16),
                const QuickActionsGrid(),
                const SizedBox(height: 16),
                const PrayerTimesCard(),
                const SizedBox(height: 16),
                const RecentSurahsSection(),
                const SizedBox(height: 16),
                const RandomAyahCard(),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _QuranTab extends ConsumerWidget {
  const _QuranTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surahsAsync = ref.watch(surahListProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text('quran'.tr()),
          backgroundColor: const Color(0xFF1B5E20),
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => context.push('/home/search'),
            ),
          ],
        ),
      body: surahsAsync.when(
        data: (surahs) => ListView.builder(
          padding: const EdgeInsets.only(bottom: 80),
          itemCount: surahs.length,
          itemBuilder: (context, index) {
            final surah = surahs[index];
            return ListTile(
              leading: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '${surah.surahNumber}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
              ),
              title: Text(surah.nameEnglish,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(
                '${surah.revelationType} • ${surah.totalAyahs} Ayahs',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              trailing: Text(
                surah.nameArabic,
                style: GoogleFonts.amiri(fontSize: 18),
              ),
              onTap: () => context.push(
                '/home/surah/${surah.surahNumber}',
                extra: {'ayahNumber': 1},
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}

class _BookmarksTab extends StatelessWidget {
  const _BookmarksTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('bookmarks'.tr())),
      body: const Center(child: Text('')),
    );
  }
}

class _SettingsTab extends StatelessWidget {
  const _SettingsTab();

  @override
  Widget build(BuildContext context) {
    return const SettingsScreen();
  }
}
