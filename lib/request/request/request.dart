import 'dart:io';

import 'package:dio/dio.dart';

class Request {
  static const int CONNECT_TIMEOUT = 1000;
  static const int RECEIVE_TIMEOUT = 1000;

  static Request instance = Request._internal();

  factory Request() => instance;


  Dio dio = Dio();
  CancelToken _cancelToken = new CancelToken();

  Request._internal() {
    dio.options
        ..baseUrl = ""
        ..connectTimeout = CONNECT_TIMEOUT as Duration?
        ..receiveTimeout = RECEIVE_TIMEOUT as Duration?
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      }
      ..headers = {};


    // 做一些其他相关设置

  }

}