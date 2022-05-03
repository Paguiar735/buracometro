import 'package:buracometro/modules/maps/domain/entity/user_location.dart';

abstract class MapsEvent {
  const MapsEvent();
}

class MapsEventRequestLocation extends MapsEvent {
  const MapsEventRequestLocation();
}

class MapsEventShowLocation extends MapsEvent {
  final Location location;

  MapsEventShowLocation({
    required this.location,
  });
}

class MapsEventAddMarker extends MapsEvent {
  final Location markerLocation;

  MapsEventAddMarker({required this.markerLocation});
}
