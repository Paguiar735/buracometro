import 'package:buracometro/modules/core/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationItem extends StatelessWidget {
  final Widget icon;
  final Widget? activeIcon;
  final String label;
  final VoidCallback onPressed;
  bool isSelected;

  BottomNavigationItem({
    Key? key,
    required this.icon,
    this.activeIcon,
    required this.label,
    required this.onPressed,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
        isSelected = !isSelected;
      },
      child: SizedBox(
        width: 85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            (icon is SvgPicture)
                ? isSelected ? activeIcon ?? icon : icon
                : Icon(
                    (icon as Icon).icon,
                    color: isSelected ? AppThemes.highLightColor : Color(0xFF979797),
                  ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppThemes.highLightColor : Color(0xFF979797),
              ),
            )
          ],
        ),
      ),
    );
  }
}
