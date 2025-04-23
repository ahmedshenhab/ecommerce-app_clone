// ignore_for_file: avoid_redundant_argument_values

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  DioHelper._();
  static Dio? _dio;

  static Dio get init {
    {
      if (_dio == null) {
        _dio = Dio(
          BaseOptions(
            receiveDataWhenStatusError: true,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            headers: {
              'Content-Type': 'application/json',

              // 'Authorization':
              //     'Bearer ${  SecureStorage.instance.read( SecureConstant.keyUserToken)}',

              // 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzQxNjk5ODY5LCJleHAiOjE3NDE3ODYyNjksIm5iZiI6MTc0MTY5OTg2OSwianRpIjoiSktOTUdUTDhkM1NjMW9QRSIsInN1YiI6IjMzNjUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0._tX8uRHcE5UUvlLhwku8GPRIM5S8V_72ipSquQdh12Y',
            },

            // baseUrl: ApiEndpoint.baseUrl,
          ),
        );

        _dio?.interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: true,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        );

        log('Dio initialized successfully');

        return _dio!;
      }

      return _dio!;
    }
  }
}
