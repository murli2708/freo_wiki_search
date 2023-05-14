import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freo_wiki_search/features/search/provider/search_state.dart';
import 'package:freo_wiki_search/features/search/provider/search_state_provider.dart';

import '../../../core/dio_client.dart';
import '../data/api/search_api.dart';
import '../data/repository/search_repository.dart';

final dioInstanceProvider = Provider<Dio>((ref) {
  return Dio();
});

final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.watch(dioInstanceProvider);
  return DioClient(dio);
});

final searchApiProvider = Provider<SearchApi>((ref) {
  return SearchApi(ref.read(dioClientProvider));
});

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepository(ref.read(searchApiProvider));
});

final searchDataProvider =
    StateNotifierProvider<SearchDataNotifier, SearchState>((ref) {
  return SearchDataNotifier(
      ref.read(searchRepositoryProvider), ref.read(searchTextProvider));
});

final searchTextProvider = StateProvider<String>((ref) {
  return 'freo';
});
final pageIdProvider = StateProvider<String>((ref) {
  return '';
});
