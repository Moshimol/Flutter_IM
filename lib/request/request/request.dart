import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_im/request/request/request_interceptor.dart';
import 'package:flutter_im/request/config.dart';

class Request {
  static const int CONNECT_TIMEOUT = 300000;
  static const int RECEIVE_TIMEOUT = 30000;
  static const int SEND_TIMEOUT = 300000;

  static Request instance = Request._internal();

  factory Request() => instance;


  Dio dio = Dio();
  CancelToken _cancelToken = new CancelToken();

  Request._internal() {
    dio.options
        ..baseUrl = API.SEARCH_HOST.length > 0 ? API.SEARCH_HOST : API().requestHost!
        ..connectTimeout = Duration(milliseconds: CONNECT_TIMEOUT)
        ..receiveTimeout = Duration(milliseconds: RECEIVE_TIMEOUT)
      ..sendTimeout = Duration(milliseconds: SEND_TIMEOUT)
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      }
      ..headers = {};

    // 做一些其他相关设置
    // 请求处理
    dio.interceptors.add(RequestInterceptor());
    // 日志
    dio.interceptors.add(DioLogInterceptor());
    // 链接处理
    dio.interceptors.add(ConnectsInterceptor());
    // 缓存相关设置
    dio.interceptors.add(NetCacheInterceptor());
  }

  // 初始化网络请求库
  void init() {

  }

  void setHeader(Map<String, dynamic> map) {
    dio.options.headers.addAll(map);
  }

  void cancelRequest({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  Future get(String path,{
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool refresh = false,
    bool noCache = true,
    String? cacheKey,
    bool cacheDisk = false,}) async{
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.copyWith(extra: {
      "refresh": refresh,
      "noCache": noCache,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    Response response;
    response = await dio.get(path,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  Future post(
      String path, {
        Map<String, dynamic>? params,
        data,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    Options requestOptions = options ?? Options();
    var response = await dio.post(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }



}