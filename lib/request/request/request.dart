import 'package:dio/dio.dart';
import 'package:flutter_im/constant/cache_key.dart';
import 'package:flutter_im/request/request/request_interceptor.dart';
import 'package:flutter_im/request/config.dart';
import 'package:flutter_im/utils/manager/request_manager.dart';

import '../../utils/storage/storage_shared.dart';

class Request {
  static const int CONNECT_TIMEOUT = 300000;
  static const int RECEIVE_TIMEOUT = 30000;
  static const int SEND_TIMEOUT = 300000;

  static Request instance = Request._internal();
  factory Request() => instance;

  Dio dio = Dio();

  CancelToken _cancelToken = new CancelToken();

  Request._internal() {
    // 获取当前的Host信息
    BaseOptions options = BaseOptions(
        baseUrl:
            API().requestHost.length > 0 ? API().requestHost : API.SEARCH_HOST,
        connectTimeout: Duration(milliseconds: CONNECT_TIMEOUT),
        receiveTimeout: Duration(milliseconds: RECEIVE_TIMEOUT),
        sendTimeout: Duration(milliseconds: SEND_TIMEOUT),
        contentType: Headers.formUrlEncodedContentType,
        responseType: ResponseType.json,
        validateStatus: (int? status) {
          return status != null && status > 0;
        });
    dio = Dio(options);
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
    dio.options = dio.options.copyWith(
      baseUrl:
          API().requestHost.length > 0 ? API().requestHost : API.SEARCH_HOST,
      connectTimeout: Duration(milliseconds: CONNECT_TIMEOUT),
      receiveTimeout: Duration(milliseconds: RECEIVE_TIMEOUT),
    );
    RequestManager().init();
  }

  void reloadNetBaseUrl() {
    dio.options
      ..baseUrl =
          API().requestHost.length > 0 ? API().requestHost : API.SEARCH_HOST;
  }

  void setHeader(Map<String, dynamic> map) {
    dio.options.headers.addAll(map);
  }

  void removeAllHeader() {
    dio.options.headers = {};
  }

  void cancelRequest({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool refresh = false,
    bool noCache = true,
    String? cacheKey,
    bool cacheDisk = false,
  }) async {
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
