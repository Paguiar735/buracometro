import 'package:buracometro/modules/home/presentation/widgets/bottom_navigation_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/strings.dart';
import '../../domain/entity/menu_item.dart';
import '../../domain/entity/menu_item_types.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<MenuItem> leftMenuItems;
  final List<MenuItem> rightMenuItems;
  final Function(MenuItemType) onChangeTab;
  final int selectedTab;

  const CustomBottomNavigationBar({
    Key? key,
    required this.leftMenuItems,
    required this.rightMenuItems,
    required this.onChangeTab,
    required this.selectedTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationItem> navBarItem = [];
     leftMenuItems.addAll(rightMenuItems);
    for (final menu in leftMenuItems + rightMenuItems) {
      if (menu is DefaultMenuItem) {
        navBarItem.add(_getNavBarItemByType(menu.menuType));
      }
    }

    final leftItems = navBarItem.sublist(0, 2);
    final rightItems = navBarItem.sublist(2, 4).reversed.toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: leftItems,
        ),
        Row(
          children: rightItems,
        ),
      ],
    );
  }

  BottomNavigationItem _getNavBarItemByType(MenuItemType menuItem) {
    switch (menuItem) {
      case MenuItemType.reports:
        return BottomNavigationItem(
          type: MenuItemType.reports,
          icon: const Icon(Icons.assignment),
          label: AppStrings.reportsLabel,
          onPressed: onChangeTab,
          isSelected: selectedTab == reportsTabPosition,
        );
      case MenuItemType.maps:
        return BottomNavigationItem(
          type: MenuItemType.maps,
          icon: const Icon(CupertinoIcons.compass_fill),
          label: AppStrings.mapsLabel,
          onPressed: onChangeTab,
          isSelected: selectedTab == mapTabPosition,
        );
      case MenuItemType.about:
        return BottomNavigationItem(
          type: MenuItemType.help,
          icon: const Icon(Icons.help),
          label: AppStrings.helpLabel,
          onPressed: onChangeTab,
          isSelected: selectedTab == helpTabPosition,
        );
      case MenuItemType.help:
        return BottomNavigationItem(
          type: MenuItemType.about,
          icon: Assets.aboutIcon,
          activeIcon: Assets.aboutIconActivated,
          label: AppStrings.aboutLabel,
          onPressed: onChangeTab,
          isSelected: selectedTab == aboutTabPosition,
        );
    }
  }

  static const reportsTabPosition = 0;
  static const mapTabPosition = 1;
  static const helpTabPosition = 2;
  static const aboutTabPosition = 3;
}
