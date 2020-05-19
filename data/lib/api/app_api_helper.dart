import 'package:data/api/api_helper.dart';
import 'package:dio/dio.dart';

class AppApiHelper implements ApiHelper {

  Dio _dio;
  AppApiHelper(Dio dio){
    _dio=dio;
  }

  @override
  bool login(String email, String pass) {
    throw UnimplementedError();
  }
}
