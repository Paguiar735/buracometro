import 'package:buracometro/modules/core/base_app_structure.dart';
import 'package:buracometro/modules/core/utils/assets.dart';
import 'package:buracometro/modules/core/utils/strings.dart';
import 'package:buracometro/modules/home/domain/entity/menu_item.dart';
import 'package:buracometro/modules/home/domain/entity/menu_item_types.dart';
import 'package:buracometro/modules/home/presentation/bloc/home_event.dart';
import 'package:buracometro/modules/home/presentation/bloc/home_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../../../../di/injection.dart';
import '../bloc/home_bloc.dart';
import '../widgets/bottom_navigation_item.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeBloc _homeBloc = getIt<HomeBloc>()..add(const HomeEventInit());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => _homeBloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: _handleStateChanges,
        builder: (context, state) {
          if (state is HomeStateSwitchTab) {
            return _buildHomePage(
              state.rightMenuItems,
              state.leftMenuItems,
              state.tabIndex,
            );
          }

          if (state is HomeStateLoaded) {
            return _buildHomePage(
              state.rightMenuItems,
              state.leftMenuItems,
              HomeBloc.defaultTabIndex,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _handleStateChanges(BuildContext context, HomeState state) {
    if (state is HomeStateSwitchTab) {
      debugPrint(state.tabIndex.toString());
    }
  }

  Widget _buildHomePage(
    List<MenuItem> rightMenuItems,
    List<MenuItem> leftMenuItems,
    int selectedTab,
  ) {
    return BaseAppStructure(
      body: Container(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: CustomBottomNavigationBar(
            rightMenuItems: rightMenuItems,
            leftMenuItems: leftMenuItems,
            onChangeTab: _changeTab,
            selectedTab: selectedTab,
          ),
        ),
      ),
    );
  }

  void _changeTab(MenuItemType menuType) {
    _homeBloc.add(HomeEventChangeTab(tabIndex: menuType.index));
  }
}
