import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../quran/presentation/providers/quran_providers.dart';

class RandomAyahCard extends ConsumerWidget {
  const RandomAyahCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomAyah = ref.watch(randomAyahProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.casino_rounded, color: Color(0xFF1B5E20), size: 20),
                const SizedBox(width: 8),
                Text(
                  'random_ayah'.tr(),
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () => ref.invalidate(randomAyahProvider),
                  iconSize: 20,
                ),
              ],
            ),
            const SizedBox(height: 12),
            randomAyah.when(
              data: (data) {
                final ayah = data['data'];
                if (ayah == null) return const SizedBox.shrink();
                return Text(
                  ayah['text'] ?? '',
                  style: GoogleFonts.amiri(fontSize: 18, height: 1.8),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('error_occurred'.tr()),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 600.ms, duration: 600.ms);
  }
}
