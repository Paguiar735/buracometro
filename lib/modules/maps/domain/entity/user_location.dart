import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends LatLng {

  const Location({
    required latitude,
    required longitude,
  }) : super(latitude, longitude);

  factory Location.fromLatLng(LatLng position) {
    return Location(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  LatLng toLatLang() {
    return LatLng(
      latitude,
      longitude,
    );
  }
}
