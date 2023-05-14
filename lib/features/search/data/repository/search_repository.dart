import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:freo_wiki_search/features/search/data/models/search_model.dart';

import '../api/search_api.dart';

class SearchRepository {
  final SearchApi _searchApi;

  SearchRepository(this._searchApi);

  Future<Result> fetchResult(String url) async {
    try {
      final res = await _searchApi.fetchSearchApiRequest(url);
      final data = Result.fromJson(res);
      return data;
    } on DioError catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
