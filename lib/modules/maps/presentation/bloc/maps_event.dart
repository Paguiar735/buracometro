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