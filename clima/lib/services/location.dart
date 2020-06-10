import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  //Low accuracy will reduce battery usage.
  Future<void> getLocation() async {
    try {
      Position _position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      latitude = _position.latitude;
      longitude = _position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
