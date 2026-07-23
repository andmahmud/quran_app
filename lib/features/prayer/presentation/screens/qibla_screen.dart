import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/theme/app_theme.dart';
import '../providers/prayer_providers.dart';

class QiblaScreen extends ConsumerStatefulWidget {
  const QiblaScreen({super.key});

  @override
  ConsumerState<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends ConsumerState<QiblaScreen> {
  double _qiblaDirection = 0;
  bool _hasPermission = false;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    final status = await Permission.location.status;
    if (status.isGranted) {
      setState(() => _hasPermission = true);
      _loadQibla();
    } else {
      final result = await Permission.location.request();
      if (result.isGranted) {
        setState(() => _hasPermission = true);
        _loadQibla();
      }
    }
  }

  void _loadQibla() async {
    try {
      final qiblaAsync = ref.read(
        qiblaProvider((lat: 23.8103, lng: 90.4125)),
      );
      qiblaAsync.whenData((data) {
        setState(() {
          _qiblaDirection = (data['data']?['direction'] as num?)?.toDouble() ?? 0;
        });
      });
    } catch (e) {
      // Use default
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Qibla Direction')),
      body: Center(
        child: _hasPermission
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Qibla Direction',
                    style: GoogleFonts.cairo(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: 220,
                    height: 220,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.primaryColor.withValues(alpha: 0.3),
                              width: 2,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: _qiblaDirection * (pi / 180),
                          child: const Icon(
                            Icons.navigation,
                            size: 80,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '${_qiblaDirection.toStringAsFixed(1)}°',
                    style: GoogleFonts.cairo(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Northeast of your location',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_off, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('Location permission required'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      await openAppSettings();
                    },
                    child: const Text('Open Settings'),
                  ),
                ],
              ),
      ),
    );
  }
}
