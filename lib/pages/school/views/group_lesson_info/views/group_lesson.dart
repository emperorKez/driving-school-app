import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/school/bloc/group_lesson/group_lesson_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/views/group_lesson_info/views/group_lesson_info.dart';

class GroupLessonView extends StatelessWidget {
  const GroupLessonView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body(context),
      ),
    );
  }

  Widget body(BuildContext context) {
    return BlocConsumer<GroupLessonBloc, GroupLessonState>(
      listener: (context, state) {
        if (state is GroupLessonError) {
          errorSnackbar(context, error: state.error);
        }
      },
      builder: (context, state) {
        if (state is GroupLessonInitial) {
          context.read<GroupLessonBloc>().add(GetAllGroupLesson(
              schoolId: context.read<SchoolBloc>().state.schoolInfo!.id,),);
        }
        if (state is! GroupLessonLoaded) {
          return kLoadingWidget(context);
        } else {
          return state.groupLessons!.isEmpty
              ? const Center(child: Text('No Group Lesson'))
              : ListView.builder(
                  itemCount: state.groupLessons!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (_) => GroupLessonInfo(
                                    lesson:
                                        state.groupLessons![index].lessons[0],
                                  ),),),
                      title: Text(state.groupLessons![index].template.title),
                      subtitle:
                          Text(state.groupLessons![index].template.description),
                      trailing:
                          Text('${state.groupLessons![index].template.price}'),
                    );
                  },);
        }
      },
    );
  }
}
