import 'dart:async';
import 'package:buracometro/modules/maps/domain/entity/user_location.dart';
import 'package:buracometro/modules/maps/domain/use_casse/map_location_use_case.dart';
import 'package:buracometro/modules/maps/domain/use_casse/markers_map_use_case.dart';
import 'package:buracometro/modules/maps/presentation/bloc/maps_event.dart';
import 'package:buracometro/modules/maps/presentation/bloc/maps_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class MapsBloc extends Bloc<MapsEvent, MapsState> {
  final MapLocationUseCase _mapLocationUseCase;
  final MarkersMapUseCase _markersMapUseCase;

  MapsBloc(this._mapLocationUseCase, this._markersMapUseCase)
      : super(const MapsStateLoading()) {
    on<MapsEventRequestLocation>(_requestUserLocation);
    on<MapsEventAddMarker>(_addMarkerToMap);
  }

  FutureOr<void> _requestUserLocation(
    MapsEventRequestLocation event,
    Emitter<MapsState> emit,
  ) async {
    emit(const MapsStateLoading());

    final result = await _mapLocationUseCase.execute();
    final markersResult =
        await _markersMapUseCase.execute();

    if (result.statusCode == 200 && result.body != null) {
      emit(
        MapsStateLoaded(
          location: result.body!,
          markersList: markersResult.body!,
        ),
      );
    } else {
      _emitDefaultLocation(emit);
    }
  }

  void _emitDefaultLocation(Emitter<MapsState> emit) {
    emit(
      MapsStateLoaded(
        location: const Location(
          latitude: -3.117034,
          longitude: -60.025780,
        ),
        markersList: [],
      ),
    );
  }

  Future<FutureOr<void>> _addMarkerToMap(
      MapsEventAddMarker event, Emitter<MapsState> emit) async {

    emit(
      MapsStateLoaded(
        location: event.markerLocation,
        markersList: [
          Marker(
            markerId: MarkerId(event.markerLocation.toString()),
            position: event.markerLocation.toLatLang(),
          ),
        ],
      ),
    );
  }
}
