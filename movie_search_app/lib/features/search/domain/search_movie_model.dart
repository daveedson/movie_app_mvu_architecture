// ignore_for_file: empty_constructor_bodies

import 'package:movie_search_app/features/search/data/entities.dart';

class MovieModel {
  final String movieType;
  final String movieTitle;
  final String year;
  final String imdbID;
  final String movieImage;

  MovieModel(
      {required this.movieType,
      required this.movieTitle,
      required this.year,
      required this.imdbID,
      required this.movieImage});
  factory MovieModel.fromEntity(MovieEntity movies) {
    return MovieModel(
        movieType: movies.movieType,
        movieTitle: movies.movieTitle,
        year: movies.year,
        imdbID: movies.imdbID,
        movieImage: movies.movieImage);
  }
}
