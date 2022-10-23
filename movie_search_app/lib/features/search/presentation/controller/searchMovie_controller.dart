// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_search_app/features/search/domain/useCases/search_movie_usecase.dart';
import 'package:movie_search_app/features/search/presentation/states/search_movie_state.dart';

final searchMovieControllerProvider =
    StateNotifierProvider<SearchMovieController, SearchMovieState>((ref) {
  return SearchMovieController(
      ref: ref,
      movieState: SearchMovieState(
          movies: const AsyncValue.data([]),
          textEditingController: TextEditingController()));
});

class SearchMovieController extends StateNotifier<SearchMovieState> {
  final Ref ref;

  SearchMovieController({SearchMovieState? movieState, required this.ref})
      : super(movieState!);

  searchMovies(keyword) async {
    debugPrint("loading.....");
    state = state.copywith(movies: const AsyncValue.loading());
    final result =
        await ref.watch(searchMovieUseCaseProvider).getSearchedMovies(keyword);
    result.when((error) {
      state = state.copywith(
          movies:
              AsyncValue.error(error));
    }, (success) => state = state.copywith(movies: AsyncValue.data(success)));
  }
}
