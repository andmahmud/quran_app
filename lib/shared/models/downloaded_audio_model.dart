import 'package:isar_community/isar.dart';

part 'downloaded_audio_model.g.dart';

@collection
class DownloadedAudioModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int surahNumber;

  late String reciter;
  late String reciterPath;
  late String localPath;
  late DateTime downloadedAt;
  late int fileSize;
}
