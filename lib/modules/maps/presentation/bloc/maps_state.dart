import 'package:buracometro/modules/maps/domain/entity/user_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapsState {
  const MapsState();
}

class MapsStateLoading extends MapsState {
  const MapsStateLoading();
}

class MapsStateLoaded extends MapsState {
  final UserLocation? userLocation;
  final List<Marker> markersList;

  const MapsStateLoaded({
    this.userLocation,
    required this.markersList,
  });
}
