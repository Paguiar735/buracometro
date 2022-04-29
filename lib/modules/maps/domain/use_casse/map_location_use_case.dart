import 'dart:async';
import 'package:buracometro/modules/maps/domain/entity/user_location.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@injectable
class MapLocationUseCase {
  final _location = Location();

  MapLocationUseCase();

  FutureOr<Response<UserLocation>> execute() async {
    final status = await _location.hasPermission();

    if (status == PermissionStatus.deniedForever) {
      return const Response(statusCode: 500);
    }

    if (_hasPermission(status)) {
      return _requestLocation();
    } else {
      final hasUserAcceptedRequestLocation = await _location.requestService();
      if (hasUserAcceptedRequestLocation) {
        return _requestLocation();
      } else {
        return const Response(statusCode: 500);
      }
    }
  }

  Future<Response<UserLocation>> _requestLocation() async {
    final result = await _location.getLocation();
    return Response(
      statusCode: 200,
      body: UserLocation(
        latitude: result.latitude ?? 0,
        longitude: result.longitude ?? 0,
      ),
    );
  }

  bool _hasPermission(PermissionStatus status) =>
      status == PermissionStatus.granted ||
      status == PermissionStatus.grantedLimited;
}
