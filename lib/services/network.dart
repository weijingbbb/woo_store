import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:woo_store/models/index.dart';
import 'package:woo_store/services/index.dart';
import 'package:woo_store/utils/index.dart';
import 'package:woo_store/values/index.dart';

class NetworkService extends GetxService {
  static NetworkService get to => Get.find();

  late final Dio _dio;
  // final CancelToken _cancelToken = CancelToken(); // 默认去掉

  @override
  void onInit() {
    super.onInit();

    // 初始 dio
    var options = BaseOptions(
      baseUrl: Constants.netWorkApiBaseUrl,
      connectTimeout: const Duration(seconds: 10), // 10000, // 10秒
      receiveTimeout: const Duration(seconds: 5), // 5000, // 5秒
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    _dio = Dio(options);

    // 拦截器
    _dio.interceptors.add(RequestInterceptors());
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Options requestOptions = options ?? Options();
      final response = await _dio.get(
        url,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response;
      // return ResponseModel.fromJson(response.data);
    } catch (error) {
      if (error is! DioException) Loading.error(error.toString());
      Loading.dismiss();
      rethrow;
    }
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var requestOptions = options ?? Options();
      // Console.log('请求链接：$url, 请求方法: post-----');
      final response = await _dio.post(
        url,
        data: data ?? {},
        options: requestOptions,
        cancelToken: cancelToken,
      );
      // Console.log('请求结果：$response');
      return response;
      // return ResponseModel.fromJson(response.data);
    } catch (error) {
      if (error is! DioException) Loading.error(error.toString());
      Loading.dismiss();
      rethrow;
    }
  }

  Future<ResponseModel> put(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var requestOptions = options ?? Options();
      final response = await _dio.put(
        url,
        data: data ?? {},
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return ResponseModel.fromJson(response.data);
    } catch (error) {
      // if (error is! DioException) Loading.error(error.toString());
      rethrow;
    }
  }

  Future<ResponseModel> delete(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var requestOptions = options ?? Options();
      final response = await _dio.delete(
        url,
        data: data ?? {},
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return ResponseModel.fromJson(response.data);
    } catch (e) {
      // if (error is! DioException) Loading.error(error.toString());
      rethrow;
    }
  }
}

/// 拦截
class RequestInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // super.onRequest(options, handler);

    // http header 头加入 Authorization
    if (UserService.to.token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer ${UserService.to.token}';
    }

    return handler.next(options);
    // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
    // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    //
    // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 200 请求成功, 201 添加成功
    if (response.statusCode != 200 && response.statusCode != 201) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ),
        true,
      );
    } else {
      handler.next(response);
    }
  }

  // 退出并重新登录
  Future<void> _errorNoAuthLogout() async {
    UserService.to.logout();
    // Get.toNamed(RouteNames.systemLogin);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final exception = HttpException(err.message ?? "error message");
    switch (err.type) {
      case DioExceptionType.badResponse: // 服务端自定义错误体处理
        {
          final response = err.response;
          final errorMessage = ErrorMessageModel.fromJson(response?.data);
          switch (errorMessage.statusCode) {
            // 401 未登录
            case 401:
              // 注销 并跳转到登录页面
              _errorNoAuthLogout();
              break;
            case 404:
              break;
            case 500:
              break;
            case 502:
              break;
            default:
              break;
          }
          Loading.error(errorMessage.message);
        }
        break;
      case DioExceptionType.unknown:
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionTimeout:
        break;
      default:
        break;
    }
    DioException errNext = err.copyWith(
      error: exception,
    );
    handler.next(errNext);
  }
}
