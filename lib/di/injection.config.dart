// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../modules/home/domain/use_case/menu_use_case.dart' as _i5;
import '../modules/home/presentation/bloc/home_bloc.dart' as _i6;
import '../modules/maps/domain/use_casse/map_location_use_case.dart' as _i3;
import '../modules/maps/domain/use_casse/markers_map_use_case.dart' as _i4;
import '../modules/maps/presentation/bloc/maps_bloc.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.MapLocationUseCase>(() => _i3.MapLocationUseCase());
  gh.factory<_i4.MarkersMapUseCase>(() => _i4.MarkersMapUseCase());
  gh.factory<_i5.MenuUseCase>(() => _i5.MenuUseCase());
  gh.factory<_i6.HomeBloc>(() => _i6.HomeBloc(get<_i5.MenuUseCase>()));
  gh.factory<_i7.MapsBloc>(() => _i7.MapsBloc(
      get<_i3.MapLocationUseCase>(), get<_i4.MarkersMapUseCase>()));
  return get;
}
