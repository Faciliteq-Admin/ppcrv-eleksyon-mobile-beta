import 'package:dio/dio.dart';

var dio = Dio(
  BaseOptions(
    baseUrl: '',
    followRedirects: false,
    validateStatus: (status) => status! <= 500,
  ),
);

class ApiError {
  final String message;
  final String key;
  final String context;

  const ApiError({
    required this.message,
    required this.key,
    required this.context,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
    message: json['message'],
    key: json['key'],
    context: json['context'],
  );
}

class ApiResponse {
  final bool success;
  final String? context;
  final String? message;
  final List<ApiError>? errors;
  final dynamic data;

  const ApiResponse({
    required this.success,
    this.context,
    this.errors,
    this.data,
    this.message,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    success: json['success'],
    context: json['context'],
    errors:
        (json['errors'] ?? [])
            .map<ApiError>((error) => ApiError.fromJson(error))
            .toList(),
    message: json['message'],
    data: json['data'],
  );
}
