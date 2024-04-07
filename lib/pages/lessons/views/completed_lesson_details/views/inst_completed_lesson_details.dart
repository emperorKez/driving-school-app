import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/lessons/bloc/lesson_detail/lesson_detail_cubit.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/assesment_type_icon.dart';

import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/assignment_detail_section.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/bad_at_section.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/map_section.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/selected_bad_assesment_card.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/selected_good_assesment_card.dart';
import 'package:korbil_mobile/pages/lessons/views/inst_lesson_details/views/inst_lesson_details.dart';
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
  String _selectedGoodAssesment = 'Maneuvering';
  String _needToPracticeAssesment = 'Vehicle knowledge';

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
                if (state is LessonDetailError) {
                  errorSnackbar(context, error: state.error);
                }
              },
              builder: (context, state) {
                return state is! LessonDetailLoaded
                    ? kLoadingWidget(context)
                    : 
                    ListView(
                        children: [
                          if (getPreferedOrientation(context) ==
                              PreferedOrientation.landscape)
                            Row(
                              children: [
                                Expanded(
                                    child: AssignementDetailSection( 
                                  detail: state.lessonDetail,
                                ),),
                                Expanded(child: MapSection(s: s)),
                              ],
                            )
                          else
                            Column(
                              children: [
                                AssignementDetailSection(
                                  detail: state.lessonDetail,
                                ),
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
                                  child: goodAtSection(
                                  ),
                                ),
                                const SizedBox(width: 25),
                                Expanded(
                                  child: BadAtSection(
                                    needToPracticeAssesment:
                                        _needToPracticeAssesment,
                                    detail: state.lessonDetail,
                                  ),
                                ),
                              ],
                            )
                          else
                            Column(
                              children: [
                                goodAtSection(
                                ),
                                const SizedBox(height: 25),
                                BadAtSection(
                                  needToPracticeAssesment:
                                      _needToPracticeAssesment,
                                  detail: state.lessonDetail,
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


  Widget goodAtSection(
  ) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Good At',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: KorbilTheme.of(context).secondaryColor,
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.thumb_up,
              color: KorbilTheme.of(context).primaryColor,
              size: 18,
            ),
          ],
        ),
        const SizedBox(height: 25),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AssestmentTypeIcon(
                  type: 'Maneuvering',
                  selected: _selectedGoodAssesment == 'Maneuvering',
                  ontap: (String val) {
                    setState(() {
                      _selectedGoodAssesment = val;
                    });
                  },
                ),
              ),
              Expanded(
                child: AssestmentTypeIcon(
                  type: 'Eco-friendly driving',
                  selected: _selectedGoodAssesment == 'Eco-friendly driving',
                  ontap: (String val) {
                    setState(() {
                      _selectedGoodAssesment = val;
                    });
                  },
                ),
              ),
              Expanded(
                child: AssestmentTypeIcon(
                  type: 'Rules of the road',
                  selected: _selectedGoodAssesment == 'Rules of the road',
                  ontap: (String val) {
                    setState(() {
                      _selectedGoodAssesment = val;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        // assessment details
        SelectedGoodAssementDetailCard(
          selectedGoodAssesment: _selectedGoodAssesment,
        ),
      ],
    );
}



Widget badAtSection(
  ) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Bad At',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: KorbilTheme.of(context).secondaryColor,
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.thumb_down,
              color: KorbilTheme.of(context).secondaryColor,
              size: 18,
            ),
          ],
        ),
        const SizedBox(height: 25),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child:  BadAssestmentTypeIcon(
                  type: 'Vehicle knowledge',
                  selected: _needToPracticeAssesment == 'Vehicle knowledge',
                  ontap: (String val) {
                    setState(() {
                      _needToPracticeAssesment = val;
                    });
                  },
                ),
              ),
              Expanded(
                child: BadAssestmentTypeIcon(
                  type: 'Road safety and behavior',
                  selected:
                      _needToPracticeAssesment == 'Road safety and behavior',
                  ontap: (String val) {
                    setState(() {
                      _needToPracticeAssesment = val;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        // assessment details
        SelectedBadAssementDetailCard(
          selectedBadAssesment: _needToPracticeAssesment,
        ),
      ],
    );
  }



}
