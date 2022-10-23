import 'package:dio/dio.dart';

class Failure implements Exception {
  final dynamic message;
  final int? code;
  final Exception? exception;

  Failure({required this.message, this.code, this.exception});

  @override
  String toString() => 'Failure(message: $message, code: $code, exception: $exception)';
}
