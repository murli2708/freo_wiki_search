import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freo_wiki_search/core/custom_endpoint.dart';
import 'package:freo_wiki_search/features/search/provider/search_state.dart';

import '../data/repository/search_repository.dart';

class SearchDataNotifier extends StateNotifier<SearchState> {
  SearchDataNotifier(this.searchRepository, this.searchText)
      : super(InitialState()) {
    getSearchResult(searchText);
  }
  SearchRepository searchRepository;
  String searchText;

  Future<void> getSearchResult(text) async {
    state = LoadingState();
    try {
      await searchRepository
          .fetchResult(Endpoint.getSearchEndpoint(searchText: text))
          .then((data) {
        state = LoadedState(data: data);
      });
    } catch (e) {
      state = ErrorState(message: e.toString());
    }
  }
}
