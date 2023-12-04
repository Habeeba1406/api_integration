import 'package:dio/dio.dart';

class DioService {
  Future<dynamic> getData(String Url) async {
    Dio dio = Dio();
    return await dio
        .get(Url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      return response;
    });
  }
}
