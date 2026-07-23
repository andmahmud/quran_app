import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../providers/quran_providers.dart';
import '../widgets/ayah_card.dart';
import '../../../settings/presentation/providers/settings_providers.dart';

class SurahDetailScreen extends ConsumerStatefulWidget {
  final int surahNumber;
  final int ayahNumber;

  const SurahDetailScreen({
    super.key,
    required this.surahNumber,
    this.ayahNumber = 1,
  });

  @override
  ConsumerState<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends ConsumerState<SurahDetailScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToAyah(widget.ayahNumber);
    });
  }

  void _scrollToAyah(int ayahNumber) {
    final targetOffset = (ayahNumber - 1) * 120.0;
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        targetOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ayahsAsync = ref.watch(surahAyahsProvider(widget.surahNumber));
    final arabicFontSize = ref.watch(arabicFontSizeProvider);
    final translationFontSize = ref.watch(translationFontSizeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Surah ${widget.surahNumber}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.headphones),
            onPressed: () {
              context.push(
                '/home/audio-player',
                extra: {
                  'surahNumber': widget.surahNumber,
                  'surahName': 'Surah ${widget.surahNumber}',
                },
              );
            },
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'share', child: Text('Share')),
              const PopupMenuItem(value: 'copy', child: Text('Copy Translation')),
              const PopupMenuItem(value: 'jump', child: Text('Jump to Ayah')),
            ],
            onSelected: (value) {
              switch (value) {
                case 'share':
                  _shareSurah(ayahsAsync);
                  break;
                case 'copy':
                  _copyTranslation(ayahsAsync);
                  break;
                case 'jump':
                  _showJumpDialog();
                  break;
              }
            },
          ),
        ],
      ),
      body: ayahsAsync.when(
        data: (ayahs) {
          return ListView.builder(
            controller: _scrollController,
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
        loading: () => const LoadingWidget(message: 'Loading Ayahs...'),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(surahAyahsProvider(widget.surahNumber)),
        ),
      ),
    );
  }

  void _showJumpDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Jump to Ayah'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter Ayah number',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final number = int.tryParse(controller.text);
              if (number != null) {
                Navigator.pop(context);
                _scrollToAyah(number);
              }
            },
            child: const Text('Go'),
          ),
        ],
      ),
    );
  }

  void _shareSurah(AsyncValue<List<dynamic>> ayahsAsync) {
    ayahsAsync.whenData((ayahs) {
      final text = ayahs
          .take(5)
          .map((a) => '${a.arabicText}\n${a.translationText}')
          .join('\n\n');
      Share.share(text);
    });
  }

  void _copyTranslation(AsyncValue<List<dynamic>> ayahsAsync) {
    ayahsAsync.whenData((ayahs) {
      final text = ayahs.map((a) => a.translationText).join('\n');
      Clipboard.setData(ClipboardData(text: text));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Translation copied')),
      );
    });
  }
}
