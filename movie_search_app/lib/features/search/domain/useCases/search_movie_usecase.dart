// ignore_for_file: unused_catch_clause

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_search_app/core/failure.dart';
import 'package:movie_search_app/features/search/data/search_movie_repository.dart';
import 'package:movie_search_app/features/search/domain/search_movie_model.dart';
import 'package:movie_search_app/features/search/domain/search_movie_repository_impl.dart';
import 'package:multiple_result/multiple_result.dart';

final searchMovieUseCaseProvider = Provider<SearchMovieUseCase>((ref) {
  final movieRepo = ref.watch(searchMovieRepositoryProvider);
  return SearchMovieUseCaseImpl(searchMovie: movieRepo);
});

abstract class SearchMovieUseCase {
  Future<Result<Failure, List<MovieModel>>> getSearchedMovies(movieKeyword);
}

class SearchMovieUseCaseImpl implements SearchMovieUseCase {
  final SearchMovieRepository searchMovie;

  SearchMovieUseCaseImpl({required this.searchMovie});
  @override
  Future<Result<Failure, List<MovieModel>>> getSearchedMovies(
      movieKeyword) async {
    try {
      print("---seraching--");
      final getSearchedMoviesEntities =
          await searchMovie.searchforMovies(movieKeyword);
      final results = getSearchedMoviesEntities
          .map((e) => MovieModel.fromEntity(e))
          .toList();
      if (results.isEmpty) {
        return Error(Failure(message: 'No movies found'));
      }
      return Success(results);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }
}
