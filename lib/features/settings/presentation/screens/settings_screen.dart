import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/constants/app_constants.dart';
import '../providers/settings_providers.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final arabicFontSize = ref.watch(arabicFontSizeProvider);
    final translationFontSize = ref.watch(translationFontSizeProvider);
    final lineHeight = ref.watch(lineHeightProvider);
    final language = ref.watch(languageProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionHeader(title: 'Appearance'),
          Card(
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.dark_mode,
                  title: 'Theme',
                  subtitle: _getThemeName(themeMode),
                  onTap: () => _showThemeDialog(context, ref, themeMode),
                ),
                const Divider(height: 1),
                SettingsTile(
                  icon: Icons.text_fields,
                  title: 'Arabic Font Size',
                  subtitle: '${arabicFontSize.round()}px',
                  onTap: () => _showFontSizeDialog(context, ref, arabicFontSize),
                ),
                const Divider(height: 1),
                SettingsTile(
                  icon: Icons.format_size,
                  title: 'Translation Font Size',
                  subtitle: '${translationFontSize.round()}px',
                  onTap: () => _showTranslationSizeDialog(context, ref, translationFontSize),
                ),
                const Divider(height: 1),
                SettingsTile(
                  icon: Icons.format_line_spacing,
                  title: 'Line Height',
                  subtitle: lineHeight.toStringAsFixed(1),
                  onTap: () => _showLineHeightDialog(context, ref, lineHeight),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _SectionHeader(title: 'Reading'),
          Card(
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.language,
                  title: 'Language',
                  subtitle: _getLanguageName(language),
                  onTap: () => _showLanguageDialog(context, ref, language),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _SectionHeader(title: 'Audio'),
          Card(
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.high_quality,
                  title: 'Audio Quality',
                  subtitle: ref.watch(audioQualityProvider),
                  onTap: () {},
                ),
                const Divider(height: 1),
                SettingsTile(
                  icon: Icons.record_voice_over,
                  title: 'Preferred Reciter',
                  subtitle: ref.watch(preferredReciterProvider),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _SectionHeader(title: 'About'),
          Card(
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.info_outline,
                  title: 'Version',
                  subtitle: AppConstants.appVersion,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  String _getThemeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }

  String _getLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'bn':
        return 'Bangla';
      case 'ar':
        return 'Arabic';
      default:
        return code;
    }
  }

  void _showThemeDialog(BuildContext context, WidgetRef ref, ThemeMode current) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ThemeMode.values.map((mode) {
            return RadioListTile<ThemeMode>(
              title: Text(_getThemeName(mode)),
              value: mode,
              groupValue: current,
              onChanged: (value) {
                if (value != null) {
                  ref.read(themeModeProvider.notifier).state = value;
                  ref.read(storageServiceProvider).setInt(
                      AppConstants.themeKey, value.index);
                  Navigator.pop(context);
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showFontSizeDialog(
      BuildContext context, WidgetRef ref, double current) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Arabic Font Size'),
        content: StatefulBuilder(
          builder: (context, setDialogState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Slider(
                  value: current,
                  min: 20,
                  max: 40,
                  divisions: 20,
                  label: '${current.round()}',
                  onChanged: (value) {
                    setDialogState(() {});
                    ref.read(arabicFontSizeProvider.notifier).state = value;
                    ref.read(storageServiceProvider)
                        .setDouble(AppConstants.arabicFontSizeKey, value);
                  },
                ),
                Text('${current.round()}px'),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _showTranslationSizeDialog(
      BuildContext context, WidgetRef ref, double current) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Translation Font Size'),
        content: StatefulBuilder(
          builder: (context, setDialogState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Slider(
                  value: current,
                  min: 12,
                  max: 24,
                  divisions: 12,
                  label: '${current.round()}',
                  onChanged: (value) {
                    setDialogState(() {});
                    ref.read(translationFontSizeProvider.notifier).state = value;
                    ref.read(storageServiceProvider)
                        .setDouble(AppConstants.translationFontSizeKey, value);
                  },
                ),
                Text('${current.round()}px'),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _showLineHeightDialog(
      BuildContext context, WidgetRef ref, double current) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Line Height'),
        content: StatefulBuilder(
          builder: (context, setDialogState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Slider(
                  value: current,
                  min: 1.0,
                  max: 3.0,
                  divisions: 20,
                  label: current.toStringAsFixed(1),
                  onChanged: (value) {
                    setDialogState(() {});
                    ref.read(lineHeightProvider.notifier).state = value;
                    ref.read(storageServiceProvider)
                        .setDouble(AppConstants.lineHeightKey, value);
                  },
                ),
                Text(current.toStringAsFixed(1)),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(
      BuildContext context, WidgetRef ref, String current) {
    final languages = [
      {'code': 'en', 'name': 'English'},
      {'code': 'bn', 'name': 'Bangla'},
      {'code': 'ar', 'name': 'Arabic'},
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: languages.map((lang) {
            return RadioListTile<String>(
              title: Text(lang['name']!),
              value: lang['code']!,
              groupValue: current,
              onChanged: (value) {
                if (value != null) {
                  ref.read(languageProvider.notifier).state = value;
                  ref.read(storageServiceProvider)
                      .setString(AppConstants.languageKey, value);
                  Navigator.pop(context);
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
