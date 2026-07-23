import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

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
      appBar: AppBar(title: Text('settings'.tr())),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionHeader(title: 'appearance'.tr()),
          Card(
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.dark_mode,
                  title: 'theme'.tr(),
                  subtitle: _getThemeName(themeMode),
                  onTap: () => _showThemeDialog(context, ref, themeMode),
                ),
                const Divider(height: 1),
                SettingsTile(
                  icon: Icons.text_fields,
                  title: 'arabic_font_size'.tr(),
                  subtitle: '${arabicFontSize.round()}px',
                  onTap: () => _showFontSizeDialog(context, ref, arabicFontSize),
                ),
                const Divider(height: 1),
                SettingsTile(
                  icon: Icons.format_size,
                  title: 'translation_font_size'.tr(),
                  subtitle: '${translationFontSize.round()}px',
                  onTap: () => _showTranslationSizeDialog(context, ref, translationFontSize),
                ),
                const Divider(height: 1),
                SettingsTile(
                  icon: Icons.format_line_spacing,
                  title: 'line_height'.tr(),
                  subtitle: lineHeight.toStringAsFixed(1),
                  onTap: () => _showLineHeightDialog(context, ref, lineHeight),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _SectionHeader(title: 'reading'.tr()),
          Card(
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.language,
                  title: 'language'.tr(),
                  subtitle: _getLanguageName(language),
                  onTap: () => _showLanguageDialog(context, ref, language),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _SectionHeader(title: 'audio'.tr()),
          Card(
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.high_quality,
                  title: 'audio_quality'.tr(),
                  subtitle: ref.watch(audioQualityProvider).tr(),
                  onTap: () => _showAudioQualityDialog(context, ref, ref.watch(audioQualityProvider)),
                ),
                const Divider(height: 1),
                SettingsTile(
                  icon: Icons.record_voice_over,
                  title: 'preferred_reciter'.tr(),
                  subtitle: ref.watch(preferredReciterProvider),
                  onTap: () => _showReciterDialog(context, ref, ref.watch(preferredReciterProvider)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _SectionHeader(title: 'about'.tr()),
          Card(
            child: Column(
              children: [
                SettingsTile(
                  icon: Icons.info_outline,
                  title: 'version'.tr(),
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
        return 'light'.tr();
      case ThemeMode.dark:
        return 'dark'.tr();
      case ThemeMode.system:
        return 'system'.tr();
    }
  }

  String _getLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'english'.tr();
      case 'bn':
        return 'bangla'.tr();
      case 'ar':
        return 'arabic'.tr();
      default:
        return code;
    }
  }

  void _showThemeDialog(BuildContext context, WidgetRef ref, ThemeMode current) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('theme'.tr()),
        content: RadioGroup<ThemeMode>(
          groupValue: current,
          onChanged: (value) {
            if (value != null) {
              ref.read(themeModeProvider.notifier).state = value;
              ref.read(storageServiceProvider).setInt(
                  AppConstants.themeKey, value.index);
              Navigator.pop(context);
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ThemeMode.values.map((mode) {
              return RadioListTile<ThemeMode>(
                title: Text(_getThemeName(mode)),
                value: mode,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _showFontSizeDialog(
      BuildContext context, WidgetRef ref, double current) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('arabic_font_size'.tr()),
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
            child: Text('ok'.tr()),
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
        title: Text('translation_font_size'.tr()),
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
            child: Text('ok'.tr()),
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
        title: Text('line_height'.tr()),
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
            child: Text('ok'.tr()),
          ),
        ],
      ),
    );
  }

  void _showAudioQualityDialog(BuildContext context, WidgetRef ref, String current) {
    final qualities = ['low', 'medium', 'high'];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('audio_quality'.tr()),
        content: RadioGroup<String>(
          groupValue: current,
          onChanged: (value) {
            if (value != null) {
              ref.read(audioQualityProvider.notifier).state = value;
              ref.read(storageServiceProvider).setString(AppConstants.audioQualityKey, value);
              Navigator.pop(context);
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: qualities.map((q) {
              return RadioListTile<String>(
                title: Text(q.tr()),
                value: q,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _showReciterDialog(BuildContext context, WidgetRef ref, String current) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('preferred_reciter'.tr()),
        content: RadioGroup<String>(
          groupValue: current,
          onChanged: (value) {
            if (value != null) {
              ref.read(preferredReciterProvider.notifier).state = value;
              ref.read(storageServiceProvider).setString(AppConstants.preferredReciterKey, value);
              Navigator.pop(context);
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: const Text('Mishary Rashid Alafasy'),
                subtitle: const Text('ar.alafasy'),
                value: 'ar.alafasy',
              ),
              RadioListTile<String>(
                title: const Text('Muhammad Jibreel'),
                subtitle: const Text('ar.muhammadjibreel'),
                value: 'ar.muhammadjibreel',
              ),
              RadioListTile<String>(
                title: const Text('Abdul Basit (Murattal)'),
                subtitle: const Text('ar.maalminturanquran'),
                value: 'ar.maalminturanquran',
              ),
              RadioListTile<String>(
                title: const Text('Mahmoud Khalil Al-Husary'),
                subtitle: const Text('ar.husary'),
                value: 'ar.husary',
              ),
              RadioListTile<String>(
                title: const Text('Muhammad Ayyoub'),
                subtitle: const Text('ar.ayyoub'),
                value: 'ar.ayyoub',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLanguageDialog(
      BuildContext context, WidgetRef ref, String current) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('language'.tr()),
        content: RadioGroup<String>(
          groupValue: current,
          onChanged: (value) {
            if (value != null) {
              ref.read(languageProvider.notifier).state = value;
              ref.read(storageServiceProvider)
                  .setString(AppConstants.languageKey, value);
              final locale = Locale(value);
              context.setLocale(locale);
              Navigator.pop(context);
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: Text('english'.tr()),
                value: 'en',
              ),
              RadioListTile<String>(
                title: Text('bangla'.tr()),
                value: 'bn',
              ),
              RadioListTile<String>(
                title: Text('arabic'.tr()),
                value: 'ar',
              ),
            ],
          ),
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
