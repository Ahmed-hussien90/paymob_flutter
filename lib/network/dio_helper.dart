import 'package:dio/dio.dart';
import 'package:paymob/utils/constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: {"Content-Type": "application/json"},
        receiveDataWhenStatusError: true));
  }

  static Future<Response> postDataDio({required String url,Map<String,dynamic>? data}) async {
    return await dio.post(url,data: data);
  }
}
