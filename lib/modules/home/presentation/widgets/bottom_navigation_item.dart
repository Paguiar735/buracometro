import 'package:buracometro/modules/core/utils/themes.dart';
import 'package:buracometro/modules/home/domain/entity/menu_item_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationItem extends StatelessWidget {
  final MenuItemType type;
  final Widget icon;
  final Widget? activeIcon;
  final String label;
  final Function(MenuItemType) onPressed;
  final bool isSelected;

  const BottomNavigationItem({
    Key? key,
    required this.type,
    required this.icon,
    this.activeIcon,
    required this.label,
    required this.onPressed,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () => onPressed(type),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            (icon is SvgPicture)
                ? isSelected
                    ? activeIcon ?? icon
                    : icon
                : Icon(
                    (icon as Icon).icon,
                    color: isSelected
                        ? AppThemes.highLightColor
                        : AppThemes.secondaryGrayColor,
                  ),
            Text(
              label,
              maxLines: 1,
              style: TextStyle(
                color: isSelected
                    ? AppThemes.highLightColor
                    : AppThemes.secondaryGrayColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
