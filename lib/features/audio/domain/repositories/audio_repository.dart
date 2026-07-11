import '../../../../shared/models/downloaded_audio_model.dart';
import '../../../../core/constants/reciters.dart';

abstract class AudioRepository {
  String getAudioUrl(int surahNumber, String reciterPath);
  Future<DownloadedAudioModel?> getDownloadedAudio(int surahNumber, String reciter);
  Future<List<DownloadedAudioModel>> getAllDownloaded();
  Future<String> downloadAudio(int surahNumber, Reciter reciter,
      {Function(int, int)? onProgress});
  Future<void> deleteDownload(int id, String localPath);
  Future<bool> isDownloaded(int surahNumber, String reciter);
}
