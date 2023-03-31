// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

import 'failure.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.RECEIVE_TIMEOUT.getFailure();
    case DioErrorType.badCertificate:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.badResponse:
      switch (error.response?.statusCode) {
        case ResponseCode.BAD_REQUEST:
          return DataSource.BAD_REQUEST.getFailure();
        case ResponseCode.FORBIDDEN:
          return DataSource.FORBIDDEN.getFailure();
        case ResponseCode.UNAUTHORISED:
          return DataSource.UNAUTHORISED.getFailure();
        case ResponseCode.NOT_FOUND:
          return DataSource.NOT_FOUND.getFailure();
        case ResponseCode.INTERNAL_SERVER_ERROR:
          return DataSource.INTERNAL_SERVER_ERROR.getFailure();
        default:
          break;
      }
      return Failure(code: 0, message: 'Unknown');
    case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioErrorType.connectionError:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.unknown:
      return DataSource.DEFAULT.getFailure();
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(
            code: ResponseCode.BAD_REQUEST,
            message: ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(
            code: ResponseCode.FORBIDDEN, message: ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return Failure(
            code: ResponseCode.UNAUTHORISED,
            message: ResponseMessage.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return Failure(
            code: ResponseCode.NOT_FOUND, message: ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(
            code: ResponseCode.INTERNAL_SERVER_ERROR,
            message: ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            code: ResponseCode.CONNECT_TIMEOUT,
            message: ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(
            code: ResponseCode.CANCEL, message: ResponseMessage.CANCEL);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
            code: ResponseCode.RECEIVE_TIMEOUT,
            message: ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(
            code: ResponseCode.SEND_TIMEOUT,
            message: ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(
            code: ResponseCode.CACHE_ERROR,
            message: ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(
            code: ResponseCode.NO_INTERNET_CONNECTION,
            message: ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return Failure(
            code: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT);
      default:
        break;
    }
    return Failure(code: 0, message: 'Unknown');
  }
}

class ResponseCode {
  //* API status code
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int FORBIDDEN = 403;
  static const int UNAUTHORISED = 401;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;

  //* local status code
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  //* API status code
  static const String SUCCESS = "success";
  static const String NO_CONTENT = "success with no content";
  static const String BAD_REQUEST = "bad request,try again";
  static const String FORBIDDEN = "forbidden request";
  static const String UNAUTHORISED = "user is unauthorised";
  static const String NOT_FOUND = "url is no found, check again";
  static const String INTERNAL_SERVER_ERROR = "someting went wrong";

  //* local status code
  static const String DEFAULT = "someting went wrong";
  static const String CONNECT_TIMEOUT = "connection time out";
  static const String CANCEL = "request was cancelled";
  static const String RECEIVE_TIMEOUT = "connection time out";
  static const String SEND_TIMEOUT = "connection time out";
  static const String CACHE_ERROR = "cache error";
  static const String NO_INTERNET_CONNECTION = "check your internet connection";
}

//* status of errors
class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
