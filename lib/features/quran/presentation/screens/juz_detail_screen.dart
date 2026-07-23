import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../providers/quran_providers.dart';
import '../widgets/ayah_card.dart';
import '../../../settings/presentation/providers/settings_providers.dart';

class JuzDetailScreen extends ConsumerStatefulWidget {
  final int juzNumber;

  const JuzDetailScreen({super.key, required this.juzNumber});

  @override
  ConsumerState<JuzDetailScreen> createState() => _JuzDetailScreenState();
}

class _JuzDetailScreenState extends ConsumerState<JuzDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final ayahsAsync = ref.watch(juzAyahsProvider(widget.juzNumber));
    final arabicFontSize = ref.watch(arabicFontSizeProvider);
    final translationFontSize = ref.watch(translationFontSizeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Juz ${widget.juzNumber}',
          style: GoogleFonts.cairo(fontWeight: FontWeight.w600),
        ),
      ),
      body: ayahsAsync.when(
        data: (ayahs) {
          if (ayahs.isEmpty) {
            return const Center(child: Text('No ayahs found for this Juz'));
          }
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 100),
            itemCount: ayahs.length,
            itemBuilder: (context, index) {
              final ayah = ayahs[index];
              return AyahCard(
                ayah: ayah,
                arabicFontSize: arabicFontSize,
                translationFontSize: translationFontSize,
              )
                  .animate()
                  .fadeIn(
                      delay: Duration(milliseconds: (index.clamp(0, 30)) * 20),
                      duration: 400.ms);
            },
          );
        },
        loading: () => const LoadingWidget(message: 'Loading Juz...'),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(juzAyahsProvider(widget.juzNumber)),
        ),
      ),
    );
  }
}
