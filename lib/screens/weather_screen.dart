import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/screens/detailed_weather.dart';
import 'package:weather_app/utils/weather_helper.dart';

class WeatherScreen extends StatefulWidget {
  final WeatherData weatherData;

  const WeatherScreen({Key? key, required this.weatherData}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late int temperature;
  late int clouds;
  late double windSpeed;
  late int humidity;
  late Icon WeatherDisplayIcon;
  late String LocationName;
  late AssetImage backgroundImage;

  void updateDisplayInfo(WeatherData weatherData) {
//    print(weatherData.currentTemperature);
    setState(() {
      WeatherDisplayData weatherDisplayData =
      weatherData.getWeatherDisplayData();
      temperature = weatherData.currentTemp;
      print("this is $temperature");
      backgroundImage = weatherDisplayData.weatherImage;
      WeatherDisplayIcon = weatherDisplayData.weatherIcon;
      LocationName = weatherData.currentLocation;
      humidity = weatherData.humidity;
      windSpeed = weatherData.windSpeed;
      clouds = weatherData.clouds;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: TabBarView(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: backgroundImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  getDetailedWeather(LocationName: this.LocationName,
                    temparature: this.temperature,
                      windSpeed: this.windSpeed,
                      humidity: this.humidity,
                    clouds: this.clouds,


                  ),

                ],
              ),
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: backgroundImage, fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      child: WeatherDisplayIcon,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        " $temperature" + '\u00B0',
                        style: TextStyle(
                          fontSize: 80.0,
                          color: Colors.white.withOpacity(0.8),
                          letterSpacing: -5,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        LocationName,
                        style: TextStyle(color: Colors.white, fontSize: 40.0),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: backgroundImage, fit: BoxFit.cover),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50, left: 10, right: 10),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(primaryColor: Colors.redAccent),
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.location_on_rounded,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            labelText: 'Location',
                            hintText: 'Enter The Location'),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

