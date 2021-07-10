import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/utils/global.dart';

class getDetailedWeather extends StatefulWidget {
  int temparature;
  int humidity;
  double windSpeed;
  int clouds;
  String LocationName;

  getDetailedWeather(
      {Key? key,
        required this.LocationName,
      required this.temparature,
      required this.humidity,
      required this.windSpeed,
      required this.clouds,
      })
      : super(key: key);

  @override
  _getDetailedWeatherState createState() => _getDetailedWeatherState();
}

class _getDetailedWeatherState extends State<getDetailedWeather> {
  late IconData icon;
  var hour = DateTime.now().hour;
  String st= "default";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100, left: 15, right: 15, bottom: 10),
            child: Container(
              height: 150.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Colors.white.withOpacity(0.5)),
              child: Row(
                children: [

                  (hour<18)?(
                  (widget.clouds > 99)
                      ? Padding(padding: EdgeInsets.only(left: 30,right: 10),
                        child: Icon(FontAwesomeIcons.cloudSunRain,
                            size: 50.0, color: Colors.black.withOpacity(0.7)),
                      )
                      : (widget.clouds < 99 && widget.clouds > 50)
                          ? Padding(
                      padding: EdgeInsets.only(left: 30,right: 10),
                            child: Icon(FontAwesomeIcons.cloudSun,
                                size: 50.0, color: Colors.black.withOpacity(0.7)),
                          )
                          : Padding(padding: EdgeInsets.only(left: 30,right: 10),
                            child: Icon(FontAwesomeIcons.solidSun,
                                size: 50.0, color: Colors.black.withOpacity(0.7)),
                          )):(hour>18)?(
                      (widget.clouds > 99)
                          ? Padding(padding: EdgeInsets.only(left: 30,right: 10),
                            child: Icon(FontAwesomeIcons.cloudMoonRain,
                            size: 50.0, color: Colors.black.withOpacity(0.7)),
                          )
                          : (widget.clouds < 99 && widget.clouds > 50)
                          ? Padding(padding: EdgeInsets.only(left: 30,right: 10),
                            child: Icon(FontAwesomeIcons.cloudMoon,
                            size: 50.0, color: Colors.black.withOpacity(0.7)),
                          )
                          : Padding(padding: EdgeInsets.only(left: 30,right: 10),
                            child: Icon(FontAwesomeIcons.moon,
                            size: 50.0, color: Colors.black.withOpacity(0.7)),
                          )
                  ):(hour>18)?(
                      (widget.clouds > 99)
                          ? Padding(padding: EdgeInsets.only(left: 30,right: 10),
                        child: Icon(FontAwesomeIcons.cloudMoonRain,
                            size: 50.0, color: Colors.black.withOpacity(0.7)),
                      )
                          : (widget.clouds < 99 && widget.clouds > 50)
                          ? Padding(padding: EdgeInsets.only(left: 30,right: 10),
                        child: Icon(FontAwesomeIcons.cloudMoon,
                            size: 50.0, color: Colors.black.withOpacity(0.7)),
                      )
                          : Padding(padding: EdgeInsets.only(left: 30,right: 10),
                        child: Icon(FontAwesomeIcons.moon,
                            size: 50.0, color: Colors.black.withOpacity(0.7)),
                      )
                  ):Icon(Icons.ac_unit),
                  (widget.clouds > 99)
                      ? Padding(padding: EdgeInsets.only(left: 30,right: 10),
                    child: Container(width: 150.0,
                        child: Text("Its raining in "+widget.LocationName,style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 18.0),)),
                  )
                      : (widget.clouds < 99 && widget.clouds > 50)
                      ? Padding(padding: EdgeInsets.only(left: 30,right: 10),
                    child: Container(width:150.0,child: Text("Partly cloudy in "+widget.LocationName,style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize:18.0))),
                  )
                      : Padding(padding: EdgeInsets.only(left: 30,right: 10),
                    child: Container(width:150.0,child: Text("Clear weather in "+widget.LocationName,style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 18.0))),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
            child: Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Colors.white.withOpacity(0.5)),
              child: Center(
                  child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Icon(
                            FontAwesomeIcons.temperatureHigh,
                            size: 30.0,
                            color: Colors.black.withOpacity(0.7),
                          ))),
                  Center(
                      child: Text(
                    (widget.temparature).toString() + '\u2103',
                    style: TextStyle(
                        fontSize: 80, color: Colors.black.withOpacity(0.7)),
                  )),
                ],
              )),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(top: 10.0, right: 7.0, left: 15.0),
                child: Container(
                    height: 170.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Colors.white.withOpacity(0.5)),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 20, bottom: 20.0),
                                child: Icon(
                                  FontAwesomeIcons.wind,
                                  size: 30.0,
                                  color: Colors.black.withOpacity(0.7),
                                ))),
                        Center(
                            child: Text(
                          (widget.windSpeed).toString(),
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.black.withOpacity(0.7)),
                        )),
                        Center(
                          child: Text(
                            'km/hr',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.7)),
                          ),
                        )
                      ],
                    )),
              )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(top: 10.0, right: 15.0, left: 7.0),
                child: Container(
                  height: 170.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      color: Colors.white.withOpacity(0.5)),
                  child: Center(
                      child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: 20, left: 20, bottom: 20.0),
                              child: Icon(
                                FontAwesomeIcons.water,
                                size: 30.0,
                                color: Colors.black.withOpacity(0.7),
                              ))),
                      Text(
                        (widget.humidity).toString(),
                        style: TextStyle(
                            fontSize: 50, color: Colors.black.withOpacity(0.7)),
                      ),
                      Center(
                        child: Text(
                          'percent',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      )
                    ],
                  )),
                ),
              ))
            ],
          ),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "               Made By Kashif Ahmad \n Data Provided By Openweathermap.org",
                      style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    ))),
          )
        ],
      ),
    );
  }
}
