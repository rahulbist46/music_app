import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

class AppError extends DioException {
  RequestOptions? options;
  String errorMessage;
  String? serverMessage;
  int? statusCode;
  String? endPoint;
  bool isOperational = true;

  AppError._(
    this.errorMessage, {
    this.options,
    this.statusCode,
    this.serverMessage,
    this.endPoint,
  }) : super(requestOptions: options ?? RequestOptions(path: 'Unknown'));

  factory AppError.createError(dynamic err) {
    if (err is DioException) {
      if (err.response?.statusCode != null ||
          err.response?.data['statusCode'] != null) {
        return _handleStatusCodeError(err);
      }
      return _handleExceptions(err);
    } else if (err is String) {
      return AppError._(err);
    } else {
      return _handleExceptions(err);
    }
  }

  static AppError _handleStatusCodeError(DioException err) {
    final int? statusCode =
        err.response?.statusCode ?? err.response?.data['statusCode'];
    String errorMessage;
    switch (statusCode) {
      case 400:
        errorMessage = 'Unable to fetch data. Bad request.';
        break;
      case 401:
        errorMessage = 'Unauthorized: need to login again';
        break;
      case 402:
        errorMessage = 'Payment is required.';
        break;
      case 403:
        errorMessage = 'Unauthorized: access is forbidden';
        break;
      case 404:
        errorMessage = 'Not found';
        break;
      case 405:
        errorMessage = 'Method is not allowed';
        break;
      case 406:
        errorMessage = 'Incorrect parameter given';
        break;
      case 409:
        errorMessage = 'Cannot connect to the server';
        break;
      case 410:
        errorMessage = 'Data does not exist anymore';
        break;
      case 415:
        errorMessage = 'Unsupported media type';
        break;
      case 426:
        errorMessage = 'Update required';
        break;
      case 500:
        errorMessage = 'Unable to fetch Data. Server is down.';
        break;
      case 502:
        errorMessage = 'Bad gateway';
        break;
      case 503:
        errorMessage = 'Server is unavailable';
        break;
      case 521:
        errorMessage = 'Server is under maintainence';
        break;
      case 525:
        errorMessage = 'SSL handshake failed';
        break;
      default:
        errorMessage = 'Unhandled status code Error: $statusCode';
    }

    AppError appError = AppError._(
      errorMessage,
      options: err.requestOptions,
      serverMessage: _serverMessageMapper(err.response?.data),
      endPoint: err.requestOptions.path,
      statusCode: statusCode,
    );

    return appError;
  }

  static AppError _handleExceptions(dynamic err) {
    String errorMessage;

    if (err is DioException) {
      switch (err.error.runtimeType) {
        case const (SocketException):
          errorMessage = 'Please check your internet connection';
          break;
        case const (TimeoutException):
          errorMessage = 'Taking too long to fetch data';
          break;
        case const (FormatException):
          errorMessage = 'Unable to process data';
          break;
        default:
          errorMessage = _misellaneousErrors(err);
      }
    } else {
      switch (err.runtimeType) {
        case const (SocketException):
          errorMessage = 'Please check your internet connection';
          break;
        case const (TimeoutException):
          errorMessage = 'Taking too long to fetch data';
          break;
        case const (FormatException):
          errorMessage = 'Unable to process data';
          break;
        default:
          errorMessage = 'Unhandled Exception: ${err.runtimeType}';
      }
    }

    AppError appError = AppError._(
      errorMessage,
      options: err.requestOptions,
      serverMessage: _serverMessageMapper(err.response?.data) ?? err.message,
      endPoint: err.requestOptions.path,
    );

    return appError;
  }

  static String _misellaneousErrors(DioException err) {
    if (err.error == 'XMLHttpRequest error.') {
      return 'Make sure the CORS is enabled for this request';
    } else {
      return 'Unhandled Exception: ${err.runtimeType}';
    }
  }

  static String? _serverMessageMapper(Map<String, dynamic>? map) {
    if (map == null) return null;
    String? message;
    if (map['error'] is Map) {
      message = map['error']['displayMessage'];
    } else {
      if (map['message'] is List) {
        message = map['message'][0];
      } else {
        message = map['message'] ?? map['err'] ?? map['error'];
      }
    }
    return message;
  }
}
