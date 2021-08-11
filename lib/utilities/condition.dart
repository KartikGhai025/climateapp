import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mausam_jaano/utilities/condition.dart';
import '../utilities/constants.dart';
import 'package:mausam_jaano/screens/getlocation.dart';

class Condition {
  late var city;
  late var id;
  late var description;
  late var icon;
  late var temp;
  late var main;
  late var pressure;
  late var humidity;
  late var visibility;
  late var wind;
  late var data;
  var thunderstorm =
      'https://images.pexels.com/photos/2226190/pexels-photo-2226190.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  var drizzle =
      'https://c1.wallpaperflare.com/preview/982/591/656/rain-drops-city-streets-drizzle.jpg';
  var rain =
      'https://cdn.pixabay.com/photo/2016/06/25/17/36/rain-1479303_960_720.jpg';
  var snow =
      'https://images.hdqwalls.com/download/winter-snow-nature-4k-ej-2560x1440.jpg';
  var mist =
      'https://cdn.pixabay.com/photo/2016/11/01/22/34/dirt-road-1789903_960_720.jpg';

  var clear =
      'https://media.istockphoto.com/photos/blue-sky-with-sun-picture-id491701259?k=6&m=491701259&s=612x612&w=0&h=BHGd75oXYRRBisbEX7pyjRsUUz_Hl9lRvgfTzK3gIcc=';
  var clouds =
      'https://cdn.pixabay.com/photo/2015/09/05/20/07/cabin-924958_960_720.jpg';
  var bgimage;
  Condition(this.data) {
    if (data == null) {
      city = id = description = temp = pressure =
          humidity = visibility = wind = main = bgimage = icon = null;
    }
    city = data['name'];
    id = data['weather'][0]['id'];
    description = data['weather'][0]['description'];
    temp = data['main']['temp'];
    //temp = temp.toInt();
    pressure = data['main']['pressure'];
    humidity = data['main']['humidity'];
    visibility = data['visibility'] / 100;
    wind = data['wind']['speed'];
    main = data['weather'][0]['main'];
  }
  void setimagedata() {
    if (main == 'Rain') {
      bgimage = rain;
    } else if (main == 'Thunderstorm') {
      bgimage = thunderstorm;
    } else if (main == ' Drizzle') {
      bgimage = drizzle;
    } else if (main == 'Snow') {
      bgimage = snow;
    } else if (main == 'Mist' ||
        main == 'Smoke' ||
        main == 'Dust' ||
        main == 'Haze' ||
        main == 'Fog' ||
        main == 'Sand' ||
        main == 'Ash' ||
        main == 'Squall' ||
        main == 'Tornado') {
      bgimage = mist;
    } else if (main == 'Clear') {
      bgimage = clear;
    } else if (main == 'Clouds') {
      bgimage = clouds;
    }
  }

  void setpngdata() {
    if (id < 300 || id == 521 || id == 522 || id == 531 || id == 520) {
      icon = '11d';
    } else if (id < 322) {
      icon = '09d';
    } else if (id >= 500 && id <= 504) {
      icon = '10d';
    } else if (id == 511 || (id >= 600 && id <= 622)) {
      icon = '13d';
    } else if (id >= 700 && id <= 781) {
      icon = '50d';
    } else if (id == 800) {
      icon = '01d';
    } else if (id == 801) {
      icon = '02d';
    } else if (id == 802) {
      icon = '03d';
    } else if (id == 803 || id == 804) {
      icon = '04d';
    }
  }
}
