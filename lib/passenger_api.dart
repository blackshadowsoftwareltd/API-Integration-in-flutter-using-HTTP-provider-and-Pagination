import 'package:pagination_http_provider/passenger_model.dart';
import 'package:http/http.dart ' as http;

class PassengerApi {
  static Future<PassengerModel>? getPassenger() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.instantwebtools.net/v1/passenger?page=0&size=10'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();
      print(body);
      return PassengerModel.fromRawJson(body);
    } else {
      print(response.reasonPhrase);
      return PassengerModel();
    }
  }
}
