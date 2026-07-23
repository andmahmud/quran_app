import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/quran/presentation/screens/surah_list_screen.dart';
import '../../features/quran/presentation/screens/surah_detail_screen.dart';
import '../../features/quran/presentation/screens/juz_list_screen.dart';
import '../../features/quran/presentation/screens/juz_detail_screen.dart';
import '../../features/audio/presentation/screens/audio_player_screen.dart';
import '../../features/bookmark/presentation/screens/bookmark_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/prayer/presentation/screens/prayer_times_screen.dart';
import '../../features/prayer/presentation/screens/qibla_screen.dart';
import '../services/storage_service.dart';
import '../constants/app_constants.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final storageService = ref.read(storageServiceProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'surah-list',
            name: 'surah-list',
            builder: (context, state) => const SurahListScreen(),
          ),
          GoRoute(
            path: 'juz-list',
            name: 'juz-list',
            builder: (context, state) => const JuzListScreen(),
          ),
          GoRoute(
            path: 'juz/:juzNumber',
            name: 'juz-detail',
            builder: (context, state) {
              final juzNumber = int.parse(state.pathParameters['juzNumber']!);
              return JuzDetailScreen(juzNumber: juzNumber);
            },
          ),
          GoRoute(
            path: 'surah/:surahNumber',
            name: 'surah-detail',
            builder: (context, state) {
              final surahNumber = int.parse(state.pathParameters['surahNumber']!);
              final extra = state.extra as Map<String, dynamic>?;
              return SurahDetailScreen(
                surahNumber: surahNumber,
                ayahNumber: extra?['ayahNumber'] ?? 1,
              );
            },
          ),
          GoRoute(
            path: 'audio-player',
            name: 'audio-player',
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>;
              return AudioPlayerScreen(
                surahNumber: extra['surahNumber'],
                surahName: extra['surahName'] ?? '',
              );
            },
          ),
          GoRoute(
            path: 'bookmarks',
            name: 'bookmarks',
            builder: (context, state) => const BookmarkScreen(),
          ),
          GoRoute(
            path: 'search',
            name: 'search',
            builder: (context, state) => const SearchScreen(),
          ),
          GoRoute(
            path: 'settings',
            name: 'settings',
            builder: (context, state) => const SettingsScreen(),
          ),
          GoRoute(
            path: 'prayer-times',
            name: 'prayer-times',
            builder: (context, state) => const PrayerTimesScreen(),
          ),
          GoRoute(
            path: 'qibla',
            name: 'qibla',
            builder: (context, state) => const QiblaScreen(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final isOnboarding = state.matchedLocation == '/onboarding';
      final isSplash = state.matchedLocation == '/';

      if (isSplash || isOnboarding) return null;

      final onboardingComplete =
          storageService.getBool(AppConstants.onboardingCompleteKey) ?? false;
      if (!onboardingComplete) {
        return '/onboarding';
      }
      return null;
    },
  );
});
