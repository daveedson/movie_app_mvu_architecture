// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_search_app/core/environment_variables.dart';
import 'package:movie_search_app/core/failure.dart';
import 'package:movie_search_app/features/search/data/entities.dart';
import 'package:movie_search_app/features/search/data/search_movie_repository.dart';
import 'package:movie_search_app/main.dart';

final searchMovieRepositoryProvider = Provider<SearchMovieRepository>((ref) {
  return SearchMovieRepositoryImpl(dio: ref.watch(dioProvider));
});

class SearchMovieRepositoryImpl implements SearchMovieRepository {
  final Dio dio;

  SearchMovieRepositoryImpl({required this.dio});
  @override
  Future<List<MovieEntity>> searchforMovies(value) async {
    try {
      log(value.toString());
      final response = await dio.get(
        'search/movie/',
        queryParameters: {
          'api_key': api,
          'language': 'en-US',
          'page': 1,
          'query':value
        },
        
      );
      log(response.toString());
      final results = List<Map<String, dynamic>>.from(response.data['results']);
      final searchMovie = results.map((e) => MovieEntity.fromJson(e)).toList();
      return searchMovie;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw Failure(
          message: 'No internet connection',
          exception: e,
        );
      }

      throw Failure(
        message: e.response?.data["errors"],
        code: e.response?.statusCode,
      );
    }
  }
}
