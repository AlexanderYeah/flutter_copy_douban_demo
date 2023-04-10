// 自定义一个拦截器
import 'package:dio/dio.dart';

class AuthInterCeptor extends Interceptor {
  AuthInterCeptor();

  // 重写其方法
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    // 这里你可以创建一个path 列表，标记处不需要access_token的路径
    final listPath = ["/login", "/resgiter", "/sendMsgCode", "/api/qq/vip"];
    // 进行判断 是否需要追加token
    if (listPath.contains(options.path)) {
      print("/api/qq/vip");
      // 不需要token 直接返回
      return handler.next(options);
    }
    // 这里从本地读取自己的token 拼接上去
    String access_token = "access_token";
    options.headers.addAll({'Authorization': access_token});
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
