import 'package:buracometro/modules/home/domain/entity/menu_item.dart';
import 'package:buracometro/modules/home/domain/entity/menu_item_types.dart';
import 'package:injectable/injectable.dart';

@injectable
class MenuUseCase {

  Future<List<List<MenuItem>>> execute() async {
    return [
      [
        const DefaultMenuItem(menuType: MenuItemType.reports),
        const DefaultMenuItem(menuType: MenuItemType.maps),
      ],
      [
        const DefaultMenuItem(menuType: MenuItemType.about),
        const DefaultMenuItem(menuType: MenuItemType.help),
      ]
    ];
  }
}