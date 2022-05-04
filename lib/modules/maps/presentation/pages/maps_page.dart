import 'package:buracometro/di/injection.dart';
import 'package:buracometro/modules/maps/domain/entity/user_location.dart';
import 'package:buracometro/modules/maps/presentation/bloc/maps_bloc.dart';
import 'package:buracometro/modules/maps/presentation/bloc/maps_event.dart';
import 'package:buracometro/modules/maps/presentation/bloc/maps_state.dart';
import 'package:buracometro/modules/maps/presentation/bloc/zip_code_bloc.dart';
import 'package:buracometro/modules/maps/presentation/bloc/zip_code_event.dart';
import 'package:buracometro/modules/maps/presentation/widgets/zip_code_text_input.dart';
import 'package:flutter/cupertino.dart';
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
    var cameraPos = const CameraPosition(target: LatLng(0, 0));
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: (controller) {
            setState(() {});
            mapsController = controller;
          },
          onTap: (position) {
            _mapsBloc.add(
              MapsEventAddMarker(
                markerLocation: Location.fromLatLng(position),
              ),
            );
          },
          onCameraIdle: () {
            BlocProvider.of<ZipCodeBloc>(context).add(
              ZipCodeEventShowZipCode(
                location: Location.fromLatLng(
                  cameraPos.target,
                ),
              ),
            );
          },
          onCameraMove: (cameraPosition) {
            cameraPos = cameraPosition;
          },
          padding: const EdgeInsets.only(bottom: 60),
          markers: state.markersList.toSet(),
          mapType: MapType.normal,
          mapToolbarEnabled: false,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          tiltGesturesEnabled: true,
          zoomControlsEnabled: false,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              state.location.latitude,
              state.location.longitude,
            ),
            zoom: 18,
          ),
        ),
        const ZipCodeTextInput(),
        const Align(
          alignment: Alignment.center,
          child: Icon(
            CupertinoIcons.location_solid,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
