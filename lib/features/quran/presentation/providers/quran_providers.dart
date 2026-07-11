import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/quran_repository_impl.dart';
import '../../../../shared/models/surah_model.dart';
import '../../../../shared/models/ayah_model.dart';

final surahListProvider = FutureProvider<List<SurahModel>>((ref) async {
  final repository = ref.read(quranRepositoryProvider);
  return await repository.getAllSurahs();
});

final surahAyahsProvider =
    FutureProvider.family<List<AyahModel>, int>((ref, surahNumber) async {
  final repository = ref.read(quranRepositoryProvider);
  return await repository.getSurahAyahs(surahNumber);
});

final randomAyahProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final repository = ref.read(quranRepositoryProvider);
  return await repository.getRandomAyah();
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider =
    FutureProvider<List<AyahModel>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.isEmpty) return [];
  final repository = ref.read(quranRepositoryProvider);
  return await repository.searchAyahs(query);
});
