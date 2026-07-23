import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/constants/app_constants.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  final storage = ref.watch(storageServiceProvider);
  final index = storage.getInt(AppConstants.themeKey) ?? 0;
  return ThemeMode.values[index];
});

final arabicFontSizeProvider = StateProvider<double>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return storage.getDouble(AppConstants.arabicFontSizeKey) ?? AppConstants.defaultArabicFontSize;
});

final translationFontSizeProvider = StateProvider<double>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return storage.getDouble(AppConstants.translationFontSizeKey) ?? AppConstants.defaultTranslationFontSize;
});

final lineHeightProvider = StateProvider<double>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return storage.getDouble(AppConstants.lineHeightKey) ?? AppConstants.defaultLineHeight;
});

final fontFamilyProvider = StateProvider<String>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return storage.getString(AppConstants.fontFamilyKey) ?? 'Cairo';
});

final languageProvider = StateProvider<String>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return storage.getString(AppConstants.languageKey) ?? 'en';
});

final audioQualityProvider = StateProvider<String>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return storage.getString(AppConstants.audioQualityKey) ?? 'high';
});

final preferredReciterProvider = StateProvider<String>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return storage.getString(AppConstants.preferredReciterKey) ?? 'ar.alafasy';
});
