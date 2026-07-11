import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../providers/bookmark_providers.dart';

class BookmarkScreen extends ConsumerWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarkListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: bookmarks.isEmpty
          ? const EmptyStateWidget(
              message: 'No bookmarks yet.\nStart reading and bookmark your favorite verses.',
              icon: Icons.bookmark_border,
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                final bookmark = bookmarks[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '${bookmark.surahNumber}:${bookmark.ayahNumber}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppTheme.primaryColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Surah ${bookmark.surahNumber}, Ayah ${bookmark.ayahNumber}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: bookmark.note != null && bookmark.note!.isNotEmpty
                        ? Text(
                            bookmark.note!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey.shade600),
                          )
                        : Text(
                            '${bookmark.createdAt.day}/${bookmark.createdAt.month}/${bookmark.createdAt.year}',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12,
                            ),
                          ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete_outline, size: 20),
                          onPressed: () {
                            ref
                                .read(bookmarkListProvider.notifier)
                                .removeBookmark(bookmark.id);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right, size: 20),
                          onPressed: () {
                            context.push(
                              '/home/surah/${bookmark.surahNumber}',
                              extra: {'ayahNumber': bookmark.ayahNumber},
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(delay: Duration(milliseconds: index * 50), duration: 400.ms);
              },
            ),
    );
  }
}
