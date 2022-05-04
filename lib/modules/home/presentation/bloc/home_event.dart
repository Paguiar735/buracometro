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
