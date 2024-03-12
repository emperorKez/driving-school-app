import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/assignment_detail_section.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/bad_at_section.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/good_at_section.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/map_section.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class InstCompletedLessonDetails extends StatefulWidget {
  const InstCompletedLessonDetails({super.key});

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
                ),),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              if (getPreferedOrientation(context) ==
                  PreferedOrientation.landscape)
                Row(
                  children: [
                    const Expanded(child: AssignementDetailSection()),
                    Expanded(child: MapSection(s: s)),
                  ],
                )
              else
                Column(
                  children: [
                    const AssignementDetailSection(),
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
                        needToPracticeAssesment: _needToPracticeAssesment,
                      ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    GoodAtSection(
                        selectedGoodAssesment: _selectedGoodAssesment,),
                    const SizedBox(height: 25),
                    BadAtSection(
                        needToPracticeAssesment: _needToPracticeAssesment,),
                  ],
                ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
