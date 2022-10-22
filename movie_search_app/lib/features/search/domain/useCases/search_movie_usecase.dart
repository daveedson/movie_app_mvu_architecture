// ignore_for_file: unused_catch_clause

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_search_app/core/failure.dart';
import 'package:movie_search_app/features/search/domain/search_movie_model.dart';
import 'package:movie_search_app/features/search/domain/search_movie_repository_impl.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class SearchMovieUseCase {
  Future<Result<Failure, List<MovieModel>>> getSearchedMovies(movieKeyword);
}

class SearchMovieUseCaseIml implements SearchMovieUseCase {
  final Ref ref;

  SearchMovieUseCaseIml({required this.ref});
  @override
  Future<Result<Failure, List<MovieModel>>> getSearchedMovies(
      movieKeyword) async {
    try {
      final getSearchedMoviesEntities = await ref
          .read(searchMovieRepositoryProvider)
          .searchforMovies(movieKeyword);
      final results = getSearchedMoviesEntities
          ?.map((e) => MovieModel.fromEntity(e))
          .toList();
      return Success(results!);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }
}
