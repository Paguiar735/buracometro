import 'dart:async';

import 'package:buracometro/modules/maps/domain/entity/user_location.dart';
import 'package:buracometro/modules/maps/presentation/bloc/maps_event.dart';
import 'package:buracometro/modules/maps/presentation/bloc/maps_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_casse/map_location_use_case.dart';

@injectable
class MapsBloc extends Bloc<MapsEvent, MapsState> {
  final MapLocationUseCase _mapLocationUseCase;

  MapsBloc(this._mapLocationUseCase) : super(const MapsStateLoading()) {
    on<MapsEventRequestLocation>(_requestUserLocation);
  }


  FutureOr<void> _requestUserLocation(MapsEventRequestLocation event,
      Emitter<MapsState> emit,) async {
    emit(const MapsStateLoading());

    final result = await _mapLocationUseCase.execute();

    if (result.statusCode == 200 && result.body != null) {
      emit(
          MapsStateLoaded(userLocation: result.body!)
      );
    } else {
      _emitDefaultLocation(emit);
    }
  }

  void _emitDefaultLocation(Emitter<MapsState> emit) {
    emit(
      const MapsStateLoaded(
        userLocation: UserLocation(
          latitude: -3.117034,
          longitude: -60.025780,
        ),
      ),
    );
  }
}