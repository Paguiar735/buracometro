import 'package:buracometro/modules/core/base_app_structure.dart';
import 'package:buracometro/modules/core/utils/assets.dart';
import 'package:buracometro/modules/core/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/bottom_navigation_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final RxInt selectedItemTab = (-1).obs;

  @override
  Widget build(BuildContext context) {
    return BaseAppStructure(
      body: Container(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Obx(
          () => SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BottomNavigationItem(
                      icon: const Icon(Icons.assignment),
                      label: AppStrings.reportsLabel,
                      onPressed: () => _disableAllAndSelect(reportsTabPosition),
                      isSelected: selectedItemTab.value == reportsTabPosition,
                    ),
                    BottomNavigationItem(
                      icon: const Icon(CupertinoIcons.compass_fill),
                      label: AppStrings.mapsLabel,
                      onPressed: () => _disableAllAndSelect(mapTabPosition),
                      isSelected: selectedItemTab.value == mapTabPosition,
                    ),
                  ],
                ),
                Row(
                  children: [
                    BottomNavigationItem(
                      icon: const Icon(Icons.help),
                      label: AppStrings.helpLabel,
                      onPressed: () => _disableAllAndSelect(helpTabPosition),
                      isSelected: selectedItemTab.value == helpTabPosition,
                    ),
                    BottomNavigationItem(
                      icon: Assets.aboutIcon,
                      activeIcon: Assets.aboutIconActivated,
                      label: AppStrings.aboutLabel,
                      onPressed: () => _disableAllAndSelect(aboutTabPosition),
                      isSelected: selectedItemTab.value == aboutTabPosition,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _disableAllAndSelect(int tabPos) {
    selectedItemTab.value = tabPos;
  }

  static const reportsTabPosition = 0;
  static const mapTabPosition = 1;
  static const helpTabPosition = 2;
  static const aboutTabPosition = 3;
}
