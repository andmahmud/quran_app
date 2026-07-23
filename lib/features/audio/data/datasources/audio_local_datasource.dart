import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/services/database_service.dart';
import '../../../../shared/models/downloaded_audio_model.dart';

final audioLocalDataSourceProvider = Provider<AudioLocalDataSource>((ref) {
  return AudioLocalDataSource(ref.read(databaseServiceProvider));
});

class AudioLocalDataSource {
  final DatabaseService _databaseService;

  AudioLocalDataSource(this._databaseService);

  Future<DownloadedAudioModel?> getDownloadedAudio(int surahNumber, String reciter) async {
    return await _databaseService.getDownloadedAudio(surahNumber, reciter);
  }

  Future<List<DownloadedAudioModel>> getAllDownloaded() async {
    return await _databaseService.getAllDownloadedAudio();
  }

  Future<void> saveDownloaded(DownloadedAudioModel audio) async {
    await _databaseService.saveDownloadedAudio(audio);
  }

  Future<void> deleteDownloaded(int id) async {
    await _databaseService.removeDownloadedAudio(id);
  }
}
