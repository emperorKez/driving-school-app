import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/lessons/bloc/lesson_detail/lesson_detail_cubit.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/assignment_detail_section.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/bad_at_section.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/good_at_section.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/map_section.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class InstCompletedLessonDetails extends StatefulWidget {
  const InstCompletedLessonDetails({required this.lessonId, super.key});
  final int lessonId;

  @override
  State<InstCompletedLessonDetails> createState() =>
      _InstCompletedLessonDetailsState();
}

class _InstCompletedLessonDetailsState
    extends State<InstCompletedLessonDetails> {
  final String _selectedGoodAssesment = 'Maneuvering';
  final String _needToPracticeAssesment = 'Vehicle knowledge';

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: KorbilTheme.of(context).primaryBg,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Lesson Details',
            style: TextStyle(
              fontFamily: 'Lato',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          leading: const InstAppBarBackBtn(),
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 12),
              onPressed: null,
              icon: Icon(
                Icons.share,
                color: KorbilTheme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        body: BlocProvider(
          create: (context) => LessonDetailCubit()..getDetail(widget.lessonId),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: BlocConsumer<LessonDetailCubit, LessonDetailState>(
              listener: (context, state) {
                if (state is LessonDetailError){
                  errorSnackbar(context, error: state.error);
                }
              },
              builder: (context, state) {
                return state is! LessonDetailLoaded? kLoadingWidget(context): ListView(
                  children: [
                    if (getPreferedOrientation(context) ==
                        PreferedOrientation.landscape)
                      Row(
                        children: [
                           Expanded(child: AssignementDetailSection(detail: state.lessonDetail,)),
                          Expanded(child: MapSection(s: s)),
                        ],
                      )
                    else
                      Column(
                        children: [
                           AssignementDetailSection(detail: state.lessonDetail,),
                          MapSection(s: s),
                        ],
                      ),
                    const SizedBox(height: 25),
                    if (getPreferedOrientation(context) ==
                        PreferedOrientation.landscape)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GoodAtSection(
                              selectedGoodAssesment: _selectedGoodAssesment,
                            ),
                          ),
                          const SizedBox(width: 25),
                          Expanded(
                            child: BadAtSection(
                              needToPracticeAssesment: _needToPracticeAssesment, detail: state.lessonDetail,
                            ),
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          GoodAtSection(
                            selectedGoodAssesment: _selectedGoodAssesment,
                          ),
                          const SizedBox(height: 25),
                          BadAtSection(
                            needToPracticeAssesment: _needToPracticeAssesment, detail: state.lessonDetail,
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
