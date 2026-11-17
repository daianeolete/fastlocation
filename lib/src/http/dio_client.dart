
import 'package:dio/dio.dart';

class DioClient {
  static Dio create() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://viacep.com.br/ws',
        connectTimeout: 10000,
        receiveTimeout: 10000,
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
  }
}
