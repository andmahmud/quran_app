import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionServiceProvider = Provider<PermissionService>((ref) {
  return PermissionService();
});

class PermissionService {
  Future<bool> requestStoragePermission() async {
    final status = await Permission.storage.status;
    if (status.isGranted) return true;
    final result = await Permission.storage.request();
    return result.isGranted;
  }

  Future<bool> requestNotificationPermission() async {
    final status = await Permission.notification.status;
    if (status.isGranted) return true;
    final result = await Permission.notification.request();
    return result.isGranted;
  }

  Future<bool> requestLocationPermission() async {
    final status = await Permission.location.status;
    if (status.isGranted) return true;
    final result = await Permission.location.request();
    return result.isGranted;
  }

  Future<bool> isStoragePermissionGranted() async {
    return await Permission.storage.isGranted;
  }
}
