abstract class MapsEvent {
  const MapsEvent();
}

class MapsEventRequestLocation extends MapsEvent {

  const MapsEventRequestLocation();
}

class MapsEventShowLocation extends MapsEvent {
  final double latitude;
  final double longitude;

  MapsEventShowLocation({
    required this.latitude,
    required this.longitude,
  });
}

class MapsEventAddMarker extends MapsEvent {
  final double latitude;
  final double longitude;

  MapsEventAddMarker({
    required this.latitude,
    required this.longitude,
  });
}