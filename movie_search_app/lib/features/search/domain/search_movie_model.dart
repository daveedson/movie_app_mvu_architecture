// ignore_for_file: empty_constructor_bodies

import 'package:movie_search_app/features/search/data/entities.dart';

class MovieModel {
  final String movieTitle;
  final dynamic voteAverage;
  final String overView;
  final String? posterPath;
  final String? backdropPath;

  MovieModel(
      {required this.voteAverage,
      required this.overView,
      this.posterPath,
      this.backdropPath,
      required this.movieTitle});
  factory MovieModel.fromEntity(MovieEntity movies) {
    return MovieModel(
        movieTitle: movies.movieTitle,
        overView: movies.overView,
        voteAverage: movies.voteAverage,
        backdropPath: movies.backdropPath,
        posterPath: movies.posterPath);
  }
}
