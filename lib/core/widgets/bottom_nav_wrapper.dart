import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/quran/presentation/screens/surah_list_screen.dart';
import '../../features/bookmark/presentation/screens/bookmark_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';

class BottomNavWrapper extends StatelessWidget {
  final Widget child;

  const BottomNavWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
