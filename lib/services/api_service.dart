import 'package:dio/dio.dart';
import '../models/user_model.dart';
import '../utils/constants.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  late Dio _dio;

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );

    // 添加拦截器用于调试
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 开发环境下输出调试信息
          // print('请求 [${options.method}] => ${options.uri}');
          // print('请求数据: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // 开发环境下输出调试信息
          // print('响应 [${response.statusCode}] => ${response.requestOptions.uri}');
          // print('响应数据: ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) {
          // 开发环境下输出调试信息
          // print('错误 [${error.response?.statusCode}] => ${error.requestOptions.uri}');
          // print('错误信息: ${error.message}');
          return handler.next(error);
        },
      ),
    );
  }

  // 登录
  Future<ApiResponse<User>> login(String name, String password) async {
    try {
      final response = await _dio.post(
        ApiConstants.loginEndpoint,
        data: {
          'name': name,
          'password': password,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final code = data['code'] as int?;
        
        if (code == 0) {
          // 登录成功
          final userData = data['data'] as Map<String, dynamic>;
          final user = User.fromJson(userData);
          return ApiResponse.success(
            data: user,
            message: data['message'] as String? ?? '登录成功',
          );
        } else {
          // 业务错误
          return ApiResponse.error(
            message: data['error'] as String? ?? '登录失败',
          );
        }
      } else {
        return ApiResponse.error(message: '服务器错误');
      }
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ApiResponse.error(message: '未知错误: $e');
    }
  }

  // 注册
  Future<ApiResponse<User>> register({
    required String name,
    required String password,
    required String phone,
    required String email,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.registerEndpoint,
        data: {
          'name': name,
          'password': password,
          'phone': phone,
          'email': email,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final code = data['code'] as int?;
        
        if (code == 0) {
          // 注册成功
          final userData = data['data'] as Map<String, dynamic>;
          final user = User.fromJson(userData);
          return ApiResponse.success(
            data: user,
            message: data['message'] as String? ?? '注册成功',
          );
        } else {
          // 业务错误
          return ApiResponse.error(
            message: data['error'] as String? ?? '注册失败',
          );
        }
      } else {
        return ApiResponse.error(message: '服务器错误');
      }
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ApiResponse.error(message: '未知错误: $e');
    }
  }

  // 处理 Dio 错误
  ApiResponse<T> _handleDioError<T>(DioException e) {
    String errorMessage;
    
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMessage = '连接超时，请检查网络';
        break;
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 400) {
          // 尝试获取后端错误信息
          final data = e.response?.data;
          if (data is Map<String, dynamic> && data.containsKey('error')) {
            errorMessage = data['error'] as String;
          } else {
            errorMessage = '请求参数错误';
          }
        } else if (statusCode == 401) {
          errorMessage = '用户名或密码错误';
        } else if (statusCode == 404) {
          errorMessage = '用户不存在';
        } else if (statusCode == 500) {
          errorMessage = '服务器内部错误';
        } else {
          errorMessage = '请求失败 ($statusCode)';
        }
        break;
      case DioExceptionType.cancel:
        errorMessage = '请求已取消';
        break;
      case DioExceptionType.connectionError:
        errorMessage = '无法连接到服务器，请检查网络或服务器地址';
        break;
      default:
        errorMessage = '网络错误: ${e.message}';
    }
    
    return ApiResponse.error(message: errorMessage);
  }
}

// API 响应封装类
class ApiResponse<T> {
  final bool success;
  final T? data;
  final String message;

  ApiResponse({
    required this.success,
    this.data,
    required this.message,
  });

  factory ApiResponse.success({T? data, String message = '操作成功'}) {
    return ApiResponse(
      success: true,
      data: data,
      message: message,
    );
  }

  factory ApiResponse.error({required String message}) {
    return ApiResponse(
      success: false,
      data: null,
      message: message,
    );
  }
}

