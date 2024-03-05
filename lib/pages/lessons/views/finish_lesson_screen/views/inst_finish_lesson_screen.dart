import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/lessons/views/inst_finish_lesson_with_map_screen/views/inst_finish_lesson_with_map_screen.dart';

import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

import 'bad_at_section.dart';
import 'good_at_section.dart';

class InstFinishLessonView extends StatefulWidget {
  const InstFinishLessonView({super.key});

  @override
  State<InstFinishLessonView> createState() => _InstFinishLessonViewState();
}

class _InstFinishLessonViewState extends State<InstFinishLessonView> {
  String _selectedGoodAssesment = 'Maneuvering';
  String _needToPracticeAssesment = 'Vehicle knowledge';

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: KorbilTheme.of(context).primaryBg,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              SizedBox(
                height: s.height * 0.35,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/imgs/ins/lessons/sample_map.png',
                    fit: BoxFit.cover,
                    width: s.width,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              if (getPreferedOrientation(context) ==
                  PreferedOrientation.landscape)
                _buildStatsLandscape()
              else
                _buildStatsPortrait(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: KorbilTheme.of(context).secondaryColor,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: PrimaryBtn(
                      text: 'Add More',
                      pvm: 8,
                      vm: 0,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Feedback',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: KorbilTheme.of(context).secondaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: KorbilTheme.of(context).secondaryColor,
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 9,
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        color: KorbilTheme.of(context).alternate2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        color: KorbilTheme.of(context).primaryColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        color: KorbilTheme.of(context).warningColor,
                      ),
                    ),
                    hintText: 'Add a Review',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: KorbilTheme.of(context).alternate1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              PrimaryBtn(
                text: 'Finish Lesson',
                hm: 0,
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (cxt) => const InstFinishLessonWithMapView(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildStatsPortrait() {
    return Column(
      children: [
        GoodAtSection(selectedGoodAssesment: _selectedGoodAssesment),
        const SizedBox(height: 25),
        BadAtSection(needToPracticeAssesment: _needToPracticeAssesment),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildStatsLandscape() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GoodAtSection(selectedGoodAssesment: _selectedGoodAssesment),
        ),
        const SizedBox(width: 30),
        Expanded(
          child:
              BadAtSection(needToPracticeAssesment: _needToPracticeAssesment),
        ),
      ],
    );
  }
}
