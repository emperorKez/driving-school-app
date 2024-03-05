import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_view_event.dart';
part 'tab_view_state.dart';

class TabViewBloc extends Bloc<TabViewEvent, TabViewState> {
  TabViewBloc() : super(LessonTabViewState()) {
    on<TabViewEvent>(_changeTab);
  }

  void _changeTab(TabViewEvent event, Emitter<TabViewState> emit) {
    final index = event.index;
    emit(getTabFromIndex(index));
  }

  TabViewState getTabFromIndex(int index) {
    switch (index) {
      case 0:
        return LessonTabViewState();
      case 1:
        return StudentTabViewState();
      case 2:
        return NotificationTabViewState();
      case 3:
        return SchoolTabViewState();
      default:
        return LessonTabViewState();
    }
  }
}
