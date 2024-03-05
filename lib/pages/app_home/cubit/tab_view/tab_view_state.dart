part of 'tab_view_bloc.dart';

@immutable
sealed class TabViewState {
  final int index = 0;
}

final class LessonTabViewState extends TabViewState {
  @override
  final int index = 0;
}

final class StudentTabViewState extends TabViewState {
  @override
  final int index = 1;
}

final class NotificationTabViewState extends TabViewState {
  @override
  final int index = 2;
}

final class SchoolTabViewState extends TabViewState {
  @override
  final int index = 3;
}
