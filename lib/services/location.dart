import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

const apikey = 'edfce781ae50d9fcd9a60d6800eb06ea';

class Location {
  late double latitude;
  late double longitude;

  Future getscurrentlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

class Weathergetdata {
  void getweatherlocation() async {
    Location location = Location();
    await location.getscurrentlocation();
    //longitude = location.longitude;
    //latitude = location.latitude;
    var url = Uri.parse(
        // 'https://api.openweathermap.org/data/2.5/weather?q=gandhinagar&appid=edfce781ae50d9fcd9a60d6800eb06ea&units=metric');
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
