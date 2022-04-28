import 'package:buracometro/modules/home/domain/entity/menu_item.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class HomeEventInit extends HomeEvent {
  const HomeEventInit();
}

class HomeEventChangeTab extends HomeEvent {
  final int tabIndex;

  const HomeEventChangeTab({
    required this.tabIndex,
  });
}
