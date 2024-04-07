import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:korbil_mobile/repository/lesson/lesson_repo.dart';
import 'package:korbil_mobile/repository/lesson/model/calender.dart';

part 'calender_state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit({LessonRepo? lessonRepo})
      : _lessonRepo = lessonRepo ?? LessonRepo(),
        super(CalenderInitial());
  Future<void> getCalender({required List<int> staffIds}) async {
    emit(CalenderLoading());
    try {
      final calender = await _lessonRepo.getCalender(staffIds: staffIds);
      debugPrint(calender.data.toString());
      final completedCalender =
          await _lessonRepo.getCompletedCalender(staffIds: staffIds);
      emit(CalenderLoaded(
          calender: calender.data!,
          completedCalender: completedCalender.data!,),);
    } catch (e) {
      emit(CalenderError(error: e.toString()));
    }
  }

  final LessonRepo _lessonRepo;
}
