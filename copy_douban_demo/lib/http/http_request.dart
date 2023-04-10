import 'package:dio/dio.dart';
import 'http_auth_interceptor.dart';
import 'http_config.dart';

class HTTPRequest {
  static final BaseOptions options = BaseOptions(
      baseUrl: HTTPConfig.baseURL,
      connectTimeout: Duration(milliseconds: HTTPConfig.timeout));
  static Dio dio = Dio(options);

  static Future<T> request<T>(String url,
      {String method = "get", Map<String, dynamic>? params}) async {
    // 1请求的单独配置
    final options = Options(method: method);
    // 2 添加一个拦截器
    Interceptor inter = InterceptorsWrapper(
      onRequest: (options, handler) {
        // 很多页面访问必须要求携带token 那么可以在这里判断是否有token
        // 权限验证：比如接口请求后端返回401未授权时可以跳到登录页，403跳到未授权页面；
        // 异常监控：可以在拦截器处理异常，并且上报到异常监控后台或者发送异常预警消息；
        // 缓存接口：可以对于某些接口将请求缓存在本地，设定一定的缓存有效时限，在时限内重复请求时直接返回本地缓存数据，而无需请求后端接口，降低后端服务器负荷。这块可以参考
        // print(options.baseUrl);
        // print(options.path);
        // print(options.uri);
        // print("拦截了请求");
        return handler.next(options);
      },
      onResponse: (e, handler) {
        // print("拦截了响应");
        return handler.next(e);
      },
      onError: (e, handler) {
        // print("拦截了错误");
        return handler.next(e);
      },
    );

    List<Interceptor> inters = [];
    // 添加自己定义的授权拦截器
    // inters.add(AuthInterCeptor());
    // 开启一个log 拦截器
    // 此拦截器将帮助您在发出 HTTP 请求和响应的同时创建所有日志。您将能够看到您请求的所有信息。
    /**
     * uri: https://api.oioweb.cn/api/qq/vip?qq=1023954998
      statusCode: 200
      headers:
      access-control-allow-headers: X-Requested-With
      connection: keep-alive
      access-control-allow-origin: *
      date: Sun, 09 Apr 2023 06:30:44 GMT
      access-control-allow-methods: GET,POST,OPTIONS
      content-encoding: gzip
      content-length: 563
      strict-transport-security: max-age=31536000
      content-type: application/json;charset=utf-8
      server: Tengine
     * 
     * */
    inters.add(LogInterceptor());

    dio.interceptors.addAll(inters);
    // 3 发起网络请求
    try {
      Response response =
          await dio.request<T>(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      print("戳错了????");
      print(e);
      return Future.error(e);
    }
  }
}
