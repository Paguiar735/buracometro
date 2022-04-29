import 'package:buracometro/modules/about/presentation/about_page.dart';
import 'package:buracometro/modules/core/base_app_structure.dart';
import 'package:buracometro/modules/help/presentation/help_page.dart';
import 'package:buracometro/modules/home/domain/entity/menu_item.dart';
import 'package:buracometro/modules/home/domain/entity/menu_item_types.dart';
import 'package:buracometro/modules/home/presentation/bloc/home_bloc.dart';
import 'package:buracometro/modules/home/presentation/bloc/home_event.dart';
import 'package:buracometro/modules/home/presentation/bloc/home_state.dart';
import 'package:buracometro/modules/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:buracometro/modules/maps/presentation/pages/maps_page.dart';
import 'package:buracometro/modules/report/presentation/reports_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buracometro/di/injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeBloc _homeBloc = getIt<HomeBloc>()..add(const HomeEventInit());
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => _homeBloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: _handleStateChanges,
        builder: (context, state) {
          debugPrint(state.toString());
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
      _pageController.jumpToPage(state.tabIndex);
    }
  }

  Widget _buildHomePage(
      List<MenuItem> rightMenuItems,
      List<MenuItem> leftMenuItems,
      int selectedTab,
      ) {
    return BaseAppStructure(
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
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ReportPage(),
          MapsPage(),
          HelpPage(),
          AboutPage()
        ],
      ),
    );
  }

  void _changeTab(MenuItemType menuType) {
    debugPrint(menuType.name);
    _homeBloc.add(HomeEventChangeTab(tabIndex: menuType.index));
  }
}
