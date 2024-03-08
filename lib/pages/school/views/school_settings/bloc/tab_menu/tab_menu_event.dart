part of 'tab_menu_bloc.dart';

@immutable
sealed class TabMenuEvent {}

final class ChangeMenuItem extends TabMenuEvent {
  ChangeMenuItem(this.item);
  final TabMenuState item;
}
