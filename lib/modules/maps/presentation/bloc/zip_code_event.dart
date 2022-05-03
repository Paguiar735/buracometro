import 'package:buracometro/modules/maps/domain/entity/user_location.dart';

abstract class ZipCodeEvent {
  const ZipCodeEvent();
}

class ZipCodeEventShowZipCode extends ZipCodeEvent {
  final Location location;
  const ZipCodeEventShowZipCode({required this.location});
}