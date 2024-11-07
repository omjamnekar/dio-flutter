import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  Dio _dio = Dio();

  Dio get sendRequest => _dio;

  API() {
    _dio.options.baseUrl = "https://jsonplaceholder.org";
    _dio.interceptors.add(PrettyDioLogger());
  }

  void checkout() {
    print("dsfds");
  }
}
