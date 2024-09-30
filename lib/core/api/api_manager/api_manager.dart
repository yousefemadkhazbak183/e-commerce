import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constant/constant_manager.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(baseUrl: ConstantManager.baseUrl));
  }

  Future<Response> getRequest(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get(endPoint, queryParameters: queryParameters);
    return response;
  }

  Future<Response> postRequest(
      {required String endPoint, Map<String, dynamic>? data}) async {
    var response = await dio.post(endPoint, data: data);
    return response;
  }
}
