import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../domain/repositories/audio_repository.dart';
import '../datasources/audio_local_datasource.dart';
import '../../../../shared/models/downloaded_audio_model.dart';
import '../../../../core/constants/reciters.dart';

final audioRepositoryProvider = Provider<AudioRepository>((ref) {
  return AudioRepositoryImpl(ref.read(audioLocalDataSourceProvider));
});

class AudioRepositoryImpl implements AudioRepository {
  final AudioLocalDataSource _localDataSource;

  AudioRepositoryImpl(this._localDataSource);

  @override
  String getAudioUrl(int surahNumber, String reciterPath) {
    return Reciters.getAudioUrl(reciterPath, surahNumber);
  }

  @override
  Future<DownloadedAudioModel?> getDownloadedAudio(int surahNumber, String reciter) async {
    return await _localDataSource.getDownloadedAudio(surahNumber, reciter);
  }

  @override
  Future<List<DownloadedAudioModel>> getAllDownloaded() async {
    return await _localDataSource.getAllDownloaded();
  }

  @override
  Future<String> downloadAudio(int surahNumber, Reciter reciter,
      {Function(int, int)? onProgress}) async {
    final dir = await getApplicationDocumentsDirectory();
    final audioDir = Directory(p.join(dir.path, 'audio', reciter.path));
    if (!await audioDir.exists()) {
      await audioDir.create(recursive: true);
    }

    final padded = surahNumber.toString().padLeft(3, '0');
    final filePath = p.join(audioDir.path, '$padded.mp3');
    final url = Reciters.getAudioUrl(reciter.path, surahNumber);

    final taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: audioDir.path,
      fileName: '$padded.mp3',
      showNotification: true,
      openFileFromNotification: true,
    );

    if (taskId != null) {
      final model = DownloadedAudioModel()
        ..surahNumber = surahNumber
        ..reciter = reciter.id
        ..reciterPath = reciter.path
        ..localPath = filePath
        ..downloadedAt = DateTime.now()
        ..fileSize = await _getFileSize(filePath);

      await _localDataSource.saveDownloaded(model);
      return filePath;
    }
    throw Exception('Download failed');
  }

  @override
  Future<void> deleteDownload(int id, String localPath) async {
    final file = File(localPath);
    if (await file.exists()) {
      await file.delete();
    }
    await _localDataSource.deleteDownloaded(id);
  }

  @override
  Future<bool> isDownloaded(int surahNumber, String reciter) async {
    final model = await _localDataSource.getDownloadedAudio(surahNumber, reciter);
    if (model != null) {
      return await File(model.localPath).exists();
    }
    return false;
  }

  Future<int> _getFileSize(String path) async {
    try {
      final file = File(path);
      return await file.length();
    } catch (_) {
      return 0;
    }
  }
}
