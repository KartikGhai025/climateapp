import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper {
  Networkhelper(this.link);
  final String link;

  Future getdata() async {
    var url = Uri.parse(link);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
    // 'https://api.openweathermap.org/data/2.5/weather?q=gandhinagar&appid=edfce781ae50d9fcd9a60d6800eb06ea&units=metric');
