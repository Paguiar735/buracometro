import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class MarkersMapUseCase {
  const MarkersMapUseCase();

  FutureOr<Response<List<Marker>>> execute() async {
    final markers = [
      const Marker(
        position: LatLng(
          -3.117034,
          -60.025780,
        ),
        markerId: MarkerId('sasaksakasksaks'),
      ),
    ];

    return Response(body: markers);
  }
}
