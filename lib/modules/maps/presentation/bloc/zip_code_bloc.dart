import 'dart:async';

import 'package:buracometro/modules/maps/domain/use_casse/get_address_use_case.dart';
import 'package:buracometro/modules/maps/presentation/bloc/zip_code_event.dart';
import 'package:buracometro/modules/maps/presentation/bloc/zip_code_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ZipCodeBloc extends Bloc<ZipCodeEvent, ZipCodeState> {
  final GetAddressUseCase _getAddressUseCase;

  ZipCodeBloc(this._getAddressUseCase) : super(const ZipCodeStateLoading()) {
    on<ZipCodeEventShowZipCode>(_fetchAddressAndShowZipCode);
  }

  FutureOr<void> _fetchAddressAndShowZipCode(
    ZipCodeEventShowZipCode event,
    Emitter<ZipCodeState> emit,
  ) async {

    emit(const ZipCodeStateLoading());

    final response = await _getAddressUseCase.execute(event.location);
    if (response.body != null) {
      emit(
        ZipCodeStateLoaded(address: response.body!),
      );
    }
  }
}
