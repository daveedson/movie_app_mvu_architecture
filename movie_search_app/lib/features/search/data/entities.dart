// ignore_for_file: empty_constructor_bodies

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class MovieEntity extends Equatable {
  final String movieTitle;
  final dynamic voteAverage;
  final String overView;
  final String? posterPath;
  final String? backdropPath;

  const MovieEntity({
    required this.voteAverage,
    required this.overView,
    this.posterPath,
    this.backdropPath,
    required this.movieTitle,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      movieTitle: json['title'],
      voteAverage: json["vote_average"],
      overView: json["overview"],
      backdropPath: json["backdrop_path"],
      posterPath: json["poster_path"],
    );
  }

  @override
  List<Object?> get props =>  [movieTitle,voteAverage,overView,posterPath,backdropPath];
}
