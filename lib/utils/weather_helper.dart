import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/utils/location_helper.dart';

const apiKey = "2915a6b145655337742918723fab1dac";

class WeatherData{

  locationHelper LocationData;
  int currentTemp = 0;
  int currentCondtion = 0;
  int humidity = 0;
  double windSpeed = 0.0;
  String currentLocation = "";
  int clouds=0;
  WeatherData({
    required this.LocationData
  });
  Future<void> getCurrentTemperature () async{
    Response response = await get(
        Uri.parse('http://api.openweathermap.org/data/2.5/weather?lat=${LocationData.latitude}&lon=${LocationData.longitude}&appid=${apiKey}&units=metric'));
  if(response.statusCode == 200){
    String data  = response.body;
    var currentWeather = jsonDecode(data);
    print(currentWeather);


    double tempTemp = currentWeather['main']['temp'];
    int tempCondition = currentWeather['weather'][0]['id'];
    int tempHumidity = currentWeather['main']['humidity'];
    double tempSpeed = currentWeather['wind']['speed'];


    print(tempHumidity);
    print(tempSpeed);




    try{
      currentTemp = tempTemp.toInt();
      currentCondtion = tempCondition;
      currentLocation=(currentWeather['name']).toString();
      humidity = tempHumidity;
      windSpeed = tempSpeed;
      clouds = currentWeather['clouds']['all'];

    }
    catch(e){
      print('this is exception $e');
    }


  }
  else{
    print("could not fetch Weather");
  }
  }
  WeatherDisplayData getWeatherDisplayData() {
    if (currentCondtion < 600) {
      var bgimage='';
      return WeatherDisplayData(
        Icon(FontAwesomeIcons.cloud,size: 100,color: Colors.white,),
        AssetImage("assets/cloudy.png"),
      );
    } else {
      var now = new DateTime.now();

      if (now.hour >= 15) {
        return WeatherDisplayData(
          Icon(FontAwesomeIcons.cloudMoon,size: 100,color: Colors.white,),
          AssetImage('assets/night.png'),
        );
      } else {
        return WeatherDisplayData(
          Icon(FontAwesomeIcons.cloudSun,size: 100,color: Colors.white,),
          AssetImage('assets/sunny.png'),
        );
      }
    }
  }
}



class WeatherDisplayData{
  Icon weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData(
      @required this.weatherIcon, @required this.weatherImage
      );
}
