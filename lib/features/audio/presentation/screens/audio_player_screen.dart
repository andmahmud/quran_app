import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:just_audio/just_audio.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/constants/reciters.dart';
import '../providers/audio_providers.dart';
import '../../data/repositories/audio_repository_impl.dart';

class AudioPlayerScreen extends ConsumerStatefulWidget {
  final int surahNumber;
  final String surahName;

  const AudioPlayerScreen({
    super.key,
    required this.surahNumber,
    this.surahName = '',
  });

  @override
  ConsumerState<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends ConsumerState<AudioPlayerScreen> {
  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    final player = ref.read(audioPlayerProvider);
    final reciter = ref.read(currentReciterProvider);

    final url = ref.read(audioRepositoryProvider).getAudioUrl(
          widget.surahNumber,
          reciter.path,
        );

    try {
      await player.setUrl(url);
      ref.read(isPlayingProvider.notifier).state = true;
      ref.read(currentSurahProvider.notifier).state = widget.surahNumber;
      await player.play();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error playing audio: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    final player = ref.read(audioPlayerProvider);
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final player = ref.watch(audioPlayerProvider);
    final isPlaying = ref.watch(isPlayingProvider);
    final reciter = ref.watch(currentReciterProvider);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.primaryColor,
              AppTheme.primaryDark,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          'Surah ${widget.surahNumber}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          reciter.name,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.mosque_rounded,
                    size: 64,
                    color: Colors.white,
                  ),
                ),
              )
                  .animate(
                      onPlay: (controller) => controller.repeat(reverse: true))
                  .scale(
                    begin: const Offset(0.95, 0.95),
                    end: const Offset(1.05, 1.05),
                    duration: 2000.ms,
                  ),
              const SizedBox(height: 40),
              StreamBuilder<Duration>(
                stream: player.positionStream,
                builder: (context, snapshot) {
                  final position = snapshot.data ?? Duration.zero;
                  final duration = player.duration ?? Duration.zero;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 3,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 6),
                          ),
                          child: Slider(
                            value: position.inMilliseconds.toDouble(),
                            max: duration.inMilliseconds.toDouble().clamp(1, double.infinity),
                            activeColor: Colors.white,
                            inactiveColor: Colors.white.withOpacity(0.3),
                            onChanged: (value) {
                              player.seek(
                                  Duration(milliseconds: value.toInt()));
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppUtils.formatDuration(position),
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              AppUtils.formatDuration(duration),
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous_rounded,
                        color: Colors.white, size: 36),
                    onPressed: () {
                      final current = ref.read(currentSurahProvider);
                      if (current != null && current > 1) {
                        ref.read(currentSurahProvider.notifier).state =
                            current - 1;
                      }
                    },
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: AppTheme.primaryColor,
                        size: 36,
                      ),
                      onPressed: () {
                        if (isPlaying) {
                          player.pause();
                          ref.read(isPlayingProvider.notifier).state = false;
                        } else {
                          player.play();
                          ref.read(isPlayingProvider.notifier).state = true;
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.skip_next_rounded,
                        color: Colors.white, size: 36),
                    onPressed: () {
                      final current = ref.read(currentSurahProvider);
                      if (current != null && current < 114) {
                        ref.read(currentSurahProvider.notifier).state =
                            current + 1;
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.repeat, color: Colors.white70),
                    onPressed: () {
                      final mode = ref.read(repeatModeProvider);
                      switch (mode) {
                        case AudioRepeatMode.off:
                          ref.read(repeatModeProvider.notifier).state =
                              AudioRepeatMode.one;
                          player.setLoopMode(LoopMode.one);
                          break;
                        case AudioRepeatMode.one:
                          ref.read(repeatModeProvider.notifier).state =
                              AudioRepeatMode.all;
                          player.setLoopMode(LoopMode.all);
                          break;
                        case AudioRepeatMode.all:
                          ref.read(repeatModeProvider.notifier).state =
                              AudioRepeatMode.off;
                          player.setLoopMode(LoopMode.off);
                          break;
                      }
                    },
                  ),
                  const SizedBox(width: 32),
                  IconButton(
                    icon: const Icon(Icons.speed, color: Colors.white70),
                    onPressed: () {
                      final speed = ref.read(playbackSpeedProvider);
                      final newSpeed = speed >= 2.0 ? 0.5 : speed + 0.25;
                      ref.read(playbackSpeedProvider.notifier).state =
                          newSpeed;
                      player.setSpeed(newSpeed);
                    },
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

