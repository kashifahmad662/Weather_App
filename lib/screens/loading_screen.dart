import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/utils/location_helper.dart';
import 'package:weather_app/utils/weather_helper.dart';
import 'package:get/get.dart';

class loadingScreen extends StatefulWidget {
  const loadingScreen({Key? key}) : super(key: key);

  @override
  _loadingScreenState createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {

  locationHelper _helper = new locationHelper();

  Future<void> getLocation() async {
    await _helper.getCurrentLocation();
    if(_helper.longitude == null || _helper.longitude == null){
      print("Location Not Fetch");
    }
    else{
      print(_helper.latitude);
    }
  }

  void getWeatherData() async{
    await getLocation();
    WeatherData weatherData = new WeatherData(LocationData: _helper);
    await weatherData.getCurrentTemperature();
    if(weatherData.currentTemp == null||weatherData.currentCondtion == null){
      print("data not fetched");
    }
    Get.to(WeatherScreen(weatherData: weatherData));
  }


  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          colors: [
            Colors.purpleAccent,Colors.blueAccent
          ],
        )
      ),
      child: SpinKitRipple(
        color: Colors.white,
        size: 150.0,
        duration: Duration(milliseconds: 1200),

      ),
    );
  }
}
