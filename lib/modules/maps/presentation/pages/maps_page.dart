import 'package:buracometro/di/injection.dart';
import 'package:buracometro/modules/maps/presentation/bloc/maps_bloc.dart';
import 'package:buracometro/modules/maps/presentation/bloc/maps_event.dart';
import 'package:buracometro/modules/maps/presentation/bloc/maps_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final MapsBloc _mapsBloc = getIt<MapsBloc>()
    ..add(const MapsEventRequestLocation());

  late GoogleMapController mapsController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _mapsBloc,
      child: BlocConsumer<MapsBloc, MapsState>(
          listener: _handleMapStates,
          builder: (context, state) {
            if (state is MapsStateLoaded) {
              return GoogleMap(
                onMapCreated: (controller) {
                  mapsController = controller;
                  mapsController.animateCamera(
                    CameraUpdate.newLatLng(
                      LatLng(state.userLocation.latitude, state.userLocation.longitude,),
                    ),
                  );
                },
                indoorViewEnabled: true,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    state.userLocation.latitude,
                    state.userLocation.longitude,
                  ),
                  zoom: 13
                ),
              );
            }

            return const SizedBox.shrink();
          }),
    );
  }

  void _handleMapStates(BuildContext context, MapsState state) async {
    if (state is MapsStateLoaded) {

    }
  }
}
