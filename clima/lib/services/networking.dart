import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:clima/utils/secret_loader.dart';
import 'package:http/http.dart' as http;

const apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class Network {
  Future getData(Location location) async {
    String apiKey;
    //Probably I'm doing this wrong!
    await SecretLoader(secretPath: "secrets.json")
        .load()
        .then((value) => apiKey = value.apiKey);

    double latitude = location.latitude;
    double longitude = location.longitude;

    http.Response response =
        await http.get('$apiUrl?lat=$latitude&lon=$longitude&appid=$apiKey');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
}
