import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/constants/app_constants.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.system;
});

final arabicFontSizeProvider = StateProvider<double>((ref) {
  return AppConstants.defaultArabicFontSize;
});

final translationFontSizeProvider = StateProvider<double>((ref) {
  return AppConstants.defaultTranslationFontSize;
});

final lineHeightProvider = StateProvider<double>((ref) {
  return AppConstants.defaultLineHeight;
});

final fontFamilyProvider = StateProvider<String>((ref) {
  return 'Cairo';
});

final languageProvider = StateProvider<String>((ref) {
  return 'en';
});

final audioQualityProvider = StateProvider<String>((ref) {
  return 'high';
});

final preferredReciterProvider = StateProvider<String>((ref) {
  return 'ar.alafasy';
});

final settingsInitializerProvider = Provider<void>((ref) {
  final storage = ref.read(storageServiceProvider);

  final themeIndex = storage.getInt(AppConstants.themeKey) ?? 0;
  ref.read(themeModeProvider.notifier).state = ThemeMode.values[themeIndex];

  ref.read(arabicFontSizeProvider.notifier).state =
      storage.getDouble(AppConstants.arabicFontSizeKey) ?? AppConstants.defaultArabicFontSize;

  ref.read(translationFontSizeProvider.notifier).state =
      storage.getDouble(AppConstants.translationFontSizeKey) ?? AppConstants.defaultTranslationFontSize;

  ref.read(lineHeightProvider.notifier).state =
      storage.getDouble(AppConstants.lineHeightKey) ?? AppConstants.defaultLineHeight;

  ref.read(fontFamilyProvider.notifier).state =
      storage.getString(AppConstants.fontFamilyKey) ?? 'Cairo';

  ref.read(languageProvider.notifier).state =
      storage.getString(AppConstants.languageKey) ?? 'en';

  ref.read(audioQualityProvider.notifier).state =
      storage.getString(AppConstants.audioQualityKey) ?? 'high';

  ref.read(preferredReciterProvider.notifier).state =
      storage.getString(AppConstants.preferredReciterKey) ?? 'ar.alafasy';
});
