// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:freo_wiki_search/features/search/data/models/search_model.dart';

//Username States

@immutable
abstract class SearchState {}

class InitialState extends SearchState {
  // final String text;
  // InitialState({required this.text});
}

class LoadingState extends SearchState {}

class LoadedState extends SearchState {
  final Result data;
  LoadedState({required this.data});
}

class ErrorState extends SearchState {
  final String message;
  ErrorState({
    required this.message,
  });
}
