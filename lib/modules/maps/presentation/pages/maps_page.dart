import 'package:buracometro/di/injection.dart';
import 'package:buracometro/modules/maps/presentation/bloc/maps_bloc.dart';
import 'package:buracometro/modules/maps/presentation/bloc/maps_event.dart';
import 'package:buracometro/modules/maps/presentation/bloc/maps_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';

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
      child: BlocBuilder<MapsBloc, MapsState>(builder: (context, state) {
        if (state is MapsStateLoading) {
          return buildLoadingState();
        }
        if (state is MapsStateLoaded) {
          return buildGoogleMapPage(state);
        }

        return const SizedBox.shrink();
      }),
    );
  }

  Widget buildLoadingState() {
    return Shimmer.fromColors(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
      ),
      baseColor: Colors.grey,
      highlightColor: Colors.white,
    );
  }

  Widget buildGoogleMapPage(MapsStateLoaded state) {
    return GoogleMap(
      onMapCreated: (controller) {
        setState(() {});
        mapsController = controller;
      },
      markers: state.markersList.toSet(),
      padding: const EdgeInsets.only(bottom: 60),
      mapType: MapType.normal,
      onTap: (position) {
        _mapsBloc.add(MapsEventAddMarker(
          latitude: position.latitude,
          longitude: position.longitude,
        ));
      },
      mapToolbarEnabled: false,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      tiltGesturesEnabled: true,
      zoomControlsEnabled: false,
      initialCameraPosition: CameraPosition(
        target: LatLng(
          state.userLocation?.latitude ?? state.markersList.first.position.latitude,
          state.userLocation?.longitude ?? state.markersList.first.position.longitude,
        ),
        zoom: 18,
      ),
    );
  }
}
