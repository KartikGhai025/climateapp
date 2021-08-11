import 'dart:ui';
import '/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:mausam_jaano/services/location.dart';
import 'package:mausam_jaano/utilities/condition.dart';
import 'package:velocity_x/velocity_x.dart';
import '../utilities/constants.dart';
import 'getlocation.dart';

const apikey = 'edfce781ae50d9fcd9a60d6800eb06ea';
var newcity;

class Main_page extends StatefulWidget {
  Main_page(this.weatherdata);
  final weatherdata;
  @override
  _Main_pageState createState() => _Main_pageState();
}

class _Main_pageState extends State<Main_page> {
  @override
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    Condition flag = Condition(widget.weatherdata);
    flag.setimagedata();
    flag.setpngdata();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                //  color: Colors.white.withOpacity(0.5),
                image: DecorationImage(
                  image: NetworkImage(flag.bgimage),
                  //drizzle),
                  //  "https://www.imagesource.com/wp-content/uploads/2019/06/Rio.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.all(20),
                color: Colors.white.withOpacity(0.2),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 10,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  //  border: BoxBorder(),
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                child: Text(
                                  flag.city,
                                  style: TextStyle(
                                    //   shadows: Shadow.lerpList(2, , 4),
                                    color: Colors.white,
                                    fontSize: 45.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '🌡️ ${flag.temp} °C',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                    backgroundColor:
                                        Colors.white.withOpacity(0.2),
                                    radius: 30,
                                    child: Image.network(
                                        'http://openweathermap.org/img/wn/${flag.icon}@2x.png'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(flag.main,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25)),
                              SizedBox(
                                width: 10,
                              ),
                              Text(', ${flag.description}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 10,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    //  border: BoxBorder(),
                                    color: Colors.red[50]!.withOpacity(0.6),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(' ${flag.pressure} hPa',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Text('Pressure',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 10,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    //  border: BoxBorder(),
                                    color: Colors.blue[100]!.withOpacity(0.6),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(' ${flag.humidity} %',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Text('Humidity',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                    ],
                                  ),
                                ),
                              ]),
                          SizedBox(height: 40),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 10,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    //  border: BoxBorder(),
                                    color: Colors.green[100]!.withOpacity(0.6),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(' ${flag.visibility} Km',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Text('Visibility',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 10,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    //  border: BoxBorder(),
                                    color: Colors.yellow[100]!.withOpacity(0.6),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(' ${flag.wind} m/s',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Text('Wind',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                    ],
                                  ),
                                ),
                              ]),
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 40),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.5),
                            hintText: 'Enter City Name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (value) {
                            newcity = value;
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          //   Location location = Location();
                          Networkhelper networkhelper = Networkhelper(
                              'https://api.openweathermap.org/data/2.5/weather?q=$newcity&appid=edfce781ae50d9fcd9a60d6800eb06ea&units=metric');
                          //  'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
                          var weatherdata = await networkhelper.getdata();
                          // print(weatherdata);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Main_page(weatherdata);
                          }));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                            width: 6,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          //  border: BoxBorder(),
                          color: Colors.black.withOpacity(0.6),
                        ),
                        child: TextButton(
                          child: Text(
                            'Current Location',
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () async {
                            Location location = Location();
                            await location.getscurrentlocation();

                            Networkhelper networkhelper = Networkhelper(
                                'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
                            var weatherdata = await networkhelper.getdata();
                            //  print(weatherdata);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Main_page(weatherdata);
                            }));
                          },
                          // icon: Icon(Icons.arrow_back),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            //  border: BoxBorder(),
                            color: Colors.white.withOpacity(0.6),
                          ),
                          child: SelectableText(
                            '@kartik_ghaii',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
