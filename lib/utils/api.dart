import 'package:dio/dio.dart';

final Dio dio = Dio();

class API {
  final String baseURL = 'https://dayoffapi.vercel.app/api';
  Dio client() {
    return dio;
  }
}
