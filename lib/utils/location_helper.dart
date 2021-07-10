import 'package:geolocator/geolocator.dart';

class locationHelper{
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async{
    await Geolocator.getCurrentPosition().then((Position position){
      latitude = position.latitude;
      longitude= position.longitude;
    }).catchError((e){
      print(e);
    });
  }

}