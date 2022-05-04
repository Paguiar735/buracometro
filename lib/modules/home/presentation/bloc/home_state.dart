import '../../domain/entity/menu_item.dart';

abstract class HomeState {
  const HomeState();
}

class HomeStateInit extends HomeState {
  const HomeStateInit() : super();
}

class HomeStateLoaded extends HomeState {
  final int tabIndex;
  final List<MenuItem> rightMenuItems;
  final List<MenuItem> leftMenuItems;

  const HomeStateLoaded({
    required this.tabIndex,
    required this.rightMenuItems,
    required this.leftMenuItems,
  });
}

class HomeStateSwitchTab extends HomeStateLoaded {
  HomeStateSwitchTab({
    required List<MenuItem> rightMenuItems,
    required List<MenuItem> leftMenuItems,
    required int tabIndex,
  }) : super(
          rightMenuItems: rightMenuItems,
          leftMenuItems: leftMenuItems,
          tabIndex: tabIndex,
        );
}
