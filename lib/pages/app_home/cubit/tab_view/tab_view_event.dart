part of 'tab_view_bloc.dart';

abstract class TabViewEvent {
  TabViewEvent(this.index);
  final int index;
}

class ChangeTab extends TabViewEvent {
  ChangeTab(super.index);
}
