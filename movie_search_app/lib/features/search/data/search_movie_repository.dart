import 'package:movie_search_app/features/search/data/entities.dart';

abstract class SearchMovieRepository {
  Future<List<MovieEntity>?> searchforMovies(value);
}
