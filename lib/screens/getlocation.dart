//import 'dart:js';
import 'package:mausam_jaano/services/networking.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:mausam_jaano/screens/mainpage.dart';
import 'package:mausam_jaano/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = 'edfce781ae50d9fcd9a60d6800eb06ea';

class Getlocation extends StatefulWidget {
  @override
  _GetlocationState createState() => _GetlocationState();
}

class _GetlocationState extends State<Getlocation> {
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getscurrentlocation();

    Networkhelper networkhelper = Networkhelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var weatherdata = await networkhelper.getdata();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Main_page(weatherdata);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
