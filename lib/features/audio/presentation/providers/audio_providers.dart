import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import '../../data/repositories/audio_repository_impl.dart';
import '../../../../core/constants/reciters.dart';
import '../../../../shared/models/downloaded_audio_model.dart';

enum AudioRepeatMode { off, one, all }

final audioPlayerProvider = Provider<AudioPlayer>((ref) {
  final player = AudioPlayer();
  ref.onDispose(() => player.dispose());
  return player;
});

final currentReciterProvider = StateProvider<Reciter>((ref) {
  return Reciters.defaultReciter;
});

final isPlayingProvider = StateProvider<bool>((ref) => false);

final currentSurahProvider = StateProvider<int?>((ref) => null);

final repeatModeProvider = StateProvider<AudioRepeatMode>((ref) => AudioRepeatMode.off);

final playbackSpeedProvider = StateProvider<double>((ref) => 1.0);

final downloadedAudiosProvider = FutureProvider<List<DownloadedAudioModel>>((ref) async {
  final repo = ref.read(audioRepositoryProvider);
  return await repo.getAllDownloaded();
});
