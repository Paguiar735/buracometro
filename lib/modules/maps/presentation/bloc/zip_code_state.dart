import 'package:geocode/geocode.dart';

abstract class ZipCodeState {
  const ZipCodeState();
}

class ZipCodeStateLoading extends ZipCodeState {
  const ZipCodeStateLoading();
}

class ZipCodeStateLoaded extends ZipCodeState {
  final Address address;
  const ZipCodeStateLoaded({required this.address});
}
