import 'dart:async';

import 'package:buracometro/modules/maps/domain/entity/user_location.dart';
import 'package:geocode/geocode.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAddressUseCase {
  final GeoCode _geoCode = GeoCode();

  FutureOr<Response<Address>> execute(Location location) async {

    final result = await _geoCode.reverseGeocoding(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    return Response(
      body: result,
    );
  }
}
