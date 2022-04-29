import 'package:buracometro/modules/maps/domain/entity/user_location.dart';

abstract class MapsState {
  const MapsState();
}

class MapsStateLoading extends MapsState {
  const MapsStateLoading();
}

class MapsStateLoaded extends MapsState {
  final UserLocation userLocation;

  const MapsStateLoaded({required this.userLocation});
}