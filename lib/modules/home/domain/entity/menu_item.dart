import 'package:buracometro/modules/home/domain/entity/menu_item_types.dart';

abstract class MenuItem {
  const MenuItem();
}

class DefaultMenuItem extends MenuItem {
  final MenuItemType menuType;

  const DefaultMenuItem({required this.menuType});
}
