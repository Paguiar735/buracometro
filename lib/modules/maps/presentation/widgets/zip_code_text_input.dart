import 'package:buracometro/di/injection.dart';
import 'package:buracometro/modules/maps/presentation/bloc/zip_code_bloc.dart';
import 'package:buracometro/modules/maps/presentation/bloc/zip_code_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocode/src/model/address.dart';

class ZipCodeTextInput extends StatelessWidget {
  const ZipCodeTextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZipCodeBloc, ZipCodeState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.black,
              child: Text(
                state is ZipCodeStateLoaded
                    ? _formattedAddress(state.address)
                    : 'Loadding',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }

  String _formattedAddress(Address address) {
    return "Rua: ${address.streetAddress} \n"
        "Numero da Rua: ${address.streetNumber} \n"
        "CEP: ${address.postal} \n"
        "Região: ${address.region} \n"
        "Cidade: ${address.countryName}, \n"
        "GeoNumber: ${address.geoNumber}, \n"
        "Pais : ${address.countryName}, \n"
        "Cod Pais: ${address.countryCode}, \n"
        "Elevation: ${address.elevation}, \n"
        "Distancia: ${address.distance}, \n"
        "TimeZone: ${address.timezone} \n";
  }
}
