import 'package:dio/dio.dart';
import 'package:dio_config/core/config/dio_config.dart';

class CurrencyService {
  static Future<dynamic> getCurrency() async {
    try {
      Response response = await DioConfig.createRequest()
          .get("https://nbu.uz/uz/exchange-rates/json/");
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else if (response.statusCode == 401) {
        print('${response.statusCode} ${response.statusMessage}');
        return '${response.statusCode} ${response.statusMessage}';
      } else {
        print(response.statusMessage);
        return response.statusMessage;
      }
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectionTimeout:
          print("Connection timeout");
          break;
        case DioErrorType.receiveTimeout:
          print("Receive timeout");
          break;
        case DioErrorType.sendTimeout:
          print("Send timeout");
          break;
        default:
          print("Unknown error");
      }
    }
  }
}
