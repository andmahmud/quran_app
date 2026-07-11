import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/models/ayah_model.dart';
import '../../../bookmark/presentation/providers/bookmark_providers.dart';
import '../../../settings/presentation/providers/settings_providers.dart';

class AyahCard extends ConsumerWidget {
  final AyahModel ayah;
  final double arabicFontSize;
  final double translationFontSize;
  final int? highlightAyah;

  const AyahCard({
    super.key,
    required this.ayah,
    this.arabicFontSize = 28,
    this.translationFontSize = 16,
    this.highlightAyah,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isHighlighted = highlightAyah == ayah.ayahNumber;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: isHighlighted ? AppTheme.primaryColor.withOpacity(0.1) : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${ayah.surahNumber}:${ayah.ayahNumber}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
                if (ayah.isSajdah)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'سجدة',
                      style: TextStyle(fontSize: 11, color: Colors.amber),
                    ),
                  ),
                const Spacer(),
                _ActionButton(
                  icon: Icons.bookmark_border,
                  onTap: () => _toggleBookmark(context, ref),
                ),
                _ActionButton(
                  icon: Icons.copy,
                  onTap: () => _copyText(context),
                ),
                _ActionButton(
                  icon: Icons.share,
                  onTap: () => _shareAyah(context),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              ayah.arabicText,
              style: GoogleFonts.amiri(
                fontSize: arabicFontSize,
                fontWeight: FontWeight.w500,
                height: 2.0,
              ),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 12),
            Text(
              ayah.translationText.isNotEmpty
                  ? ayah.translationText
                  : 'Translation not available',
              style: TextStyle(
                fontSize: translationFontSize,
                color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _InfoChip(label: 'Juz ${ayah.juz}'),
                const SizedBox(width: 4),
                _InfoChip(label: 'Page ${ayah.page}'),
                const SizedBox(width: 4),
                _InfoChip(label: 'Hizb ${ayah.hizb}'),
                const SizedBox(width: 4),
                _InfoChip(label: 'Ruku ${ayah.ruku}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _toggleBookmark(BuildContext context, WidgetRef ref) {
    ref.read(bookmarkListProvider.notifier).toggleBookmark(
          surahNumber: ayah.surahNumber,
          ayahNumber: ayah.ayahNumber,
        );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Bookmark toggled'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _copyText(BuildContext context) {
    final text = '${ayah.arabicText}\n\n${ayah.translationText}';
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _shareAyah(BuildContext context) {
    final text = '${ayah.arabicText}\n\n${ayah.translationText}';
    Share.share(text);
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ActionButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(icon, size: 18, color: Colors.grey.shade600),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  const _InfoChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
      ),
    );
  }
}
