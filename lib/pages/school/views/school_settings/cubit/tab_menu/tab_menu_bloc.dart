import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_menu_event.dart';
part 'tab_menu_state.dart';

class TabMenuBloc extends Bloc<TabMenuEvent, TabMenuState> {
  TabMenuBloc() : super(TabMenuState.personalInfo) {
    on<ChangeMenuItem>(_changeMenuItem);
  }

  void _changeMenuItem(ChangeMenuItem event, Emitter<TabMenuState> emit) {
    emit(event.item);
  }
}
