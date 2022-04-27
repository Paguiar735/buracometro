import 'dart:ui';

import 'package:buracometro/modules/core/utils/themes.dart';
import 'package:flutter_svg/flutter_svg.dart';

mixin Assets {
  static final aboutIcon = SvgPicture.asset('assets/images/ic_about.svg');

  static final aboutIconActivated = SvgPicture.asset(
    'assets/images/ic_about.svg',
    color: AppThemes.highLightColor,
  );
}
