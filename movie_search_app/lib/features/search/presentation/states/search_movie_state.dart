import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_search_app/features/search/domain/search_movie_model.dart';

class SearchMovieState {
  final TextEditingController textEditingController;
  final AsyncValue<List<MovieModel>> movies;

  SearchMovieState({required this.textEditingController, required this.movies});

  SearchMovieState copywith(
      {TextEditingController? textEditingController,
      AsyncValue<List<MovieModel>>? movies}) {
    return SearchMovieState(
        textEditingController:
            textEditingController ?? this.textEditingController,
        movies: movies ?? this.movies);
  }
}
