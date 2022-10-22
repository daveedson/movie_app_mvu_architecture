// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_search_app/core/failure.dart';
import 'package:movie_search_app/features/search/data/entities.dart';
import 'package:movie_search_app/features/search/data/search_movie_repository.dart';
import 'package:movie_search_app/main.dart';


final searchMovieRepositoryProvider = Provider<SearchMovieRepositoryImpl>((ref) {
  return SearchMovieRepositoryImpl(dio: ref.watch(dioProvider));
});

class SearchMovieRepositoryImpl implements SearchMovieRepository {
  final Dio dio;
  var API_KEY = "921c74ae";

  SearchMovieRepositoryImpl({required this.dio});
  @override
  Future<List<MovieEntity>?> searchforMovies(value) async {
    try {
      final response = await dio.get("$API_KEY&s=$value");
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.data);
        if (data['Response'] == "True") {
          var list = (data['Search'] as List)
              .map((item) => MovieEntity.fromJson(item))
              .toList();
          return list;
        } else {
          throw Exception(data['Error']);
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw Failure(
          message: 'No internet connection',
          exception: e,
        );
      }

      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        code: e.response?.statusCode,
      );
    }
    return null;
  }
}
