import 'dart:async';
import 'package:buracometro/modules/home/presentation/bloc/home_event.dart';
import 'package:buracometro/modules/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_case/menu_use_case.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MenuUseCase _menuUseCase;

  HomeBloc(this._menuUseCase) : super(const HomeStateInit()) {
    on<HomeEventInit>(_init);
    on<HomeEventChangeTab>(_onTabChange);
  }

  FutureOr<void> _onTabChange(
      HomeEventChangeTab event, Emitter<HomeState> emit) {
    final loadedState = state as HomeStateLoaded;
    emit(
      HomeStateSwitchTab(
        rightMenuItems: loadedState.rightMenuItems,
        leftMenuItems: loadedState.leftMenuItems,
        tabIndex: event.tabIndex,
      ),
    );
  }

  FutureOr<void> _init(HomeEventInit event, Emitter<HomeState> emit) async {
    final result = await _menuUseCase.execute();
    if (result.isNotEmpty){
      emit(
        HomeStateLoaded(
          tabIndex: defaultTabIndex,
          rightMenuItems: result.last,
          leftMenuItems: result.first,
        ),
      );
    }
  }

  static const defaultTabIndex = -1;
}
