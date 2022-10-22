// ignore_for_file: empty_constructor_bodies

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class MovieEntity extends Equatable {
  final String movieType;
  final String movieTitle;
  final String year;
  final String imdbID;
  final String movieImage;

  const MovieEntity(
      {required this.movieType,
      required this.movieTitle,
      required this.year,
      required this.imdbID,
      required this.movieImage});

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
        movieType:json['Type'],
        movieTitle: json['Title'],
        year:json['Year'],
        imdbID: json['imdbID'],
        movieImage:json['Poster']);
  }

  @override
  List<Object?> get props => [movieType, movieImage, year, imdbID, movieTitle];
}
