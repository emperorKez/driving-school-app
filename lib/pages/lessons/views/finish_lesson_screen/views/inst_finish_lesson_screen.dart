import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/lessons/bloc/assessment/assessment_bloc.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/assesment_type_icon.dart';
import 'package:korbil_mobile/pages/lessons/views/finish_lesson_screen/views/bad_assesment_card.dart';
import 'package:korbil_mobile/pages/lessons/views/finish_lesson_screen/views/good_assessment_card.dart';
import 'package:korbil_mobile/pages/lessons/views/inst_finish_lesson_with_map_screen/views/inst_finish_lesson_with_map_screen.dart';
import 'package:korbil_mobile/pages/lessons/views/inst_lesson_details/views/inst_lesson_details.dart';
import 'package:korbil_mobile/pages/school/bloc/metadata/metadata_cubit.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class InstFinishLessonView extends StatefulWidget {
  const InstFinishLessonView({required this.lessonId, super.key});
  final int lessonId;

  @override
  State<InstFinishLessonView> createState() => _InstFinishLessonViewState();
}

class _InstFinishLessonViewState extends State<InstFinishLessonView> {
  final _formKey = GlobalKey<FormState>();
  final feedbackController = TextEditingController();
  String _selectedGoodAssesment = 'MANEUVERING';

  String _needToPracticeAssesment = 'VEHICLE_KNOWLEDGE';

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
                  ),
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
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: feedbackController,
                    validator: (val) {
                      if (val == null) {
                        return 'Add a review';
                      } else if (val.characters.length < 10) {
                        return 'Enter at least 10 characters';
                      } else {
                        return null;
                      }
                    },
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
              ),
              const SizedBox(height: 20),
              PrimaryBtn(
                text: 'Finish Lesson',
                hm: 0,
                ontap: () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<AssessmentBloc>()
                        .add(AddFeedback(feedback: feedbackController.text));

                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (cxt) => InstFinishLessonWithMapView(
                          lessonId: widget.lessonId,
                        ),
                      ),
                    );
                  }
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
        goodAtSection(),
        const SizedBox(height: 25),
        badAtSection(),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildStatsLandscape() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: goodAtSection(),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: badAtSection(),
        ),
      ],
    );
  }

  Widget goodAtSection() {
    return BlocBuilder<MetadataCubit, MetadataState>(
      builder: (context, state) {
        return state is! MetadataLoaded
            ? kLoadingWidget(context)
            : Column(
                mainAxisSize: MainAxisSize.min,
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
                        children: List.generate(
                            state.skillCategories?.length ?? 0,
                            (index) => Expanded(
                                  child: AssestmentTypeIcon(
                                    type: state.skillCategories![index].code,
                                    selected: _selectedGoodAssesment ==
                                        state.skillCategories![index].code,
                                    ontap: (String val) {
                                      setState(() {
                                        _selectedGoodAssesment = val;
                                      });
                                    },
                                  ),
                                ))
                        // [
                        //   Expanded(
                        //     child: AssestmentTypeIcon(
                        //       type: 'Maneuvering',
                        //       selected: _selectedGoodAssesment == 'Maneuvering',
                        //       ontap: (String val) {
                        //         setState(() {
                        //           _selectedGoodAssesment = val;
                        //         });
                        //       },
                        //     ),
                        //   ),
                        //   Expanded(
                        //     child: AssestmentTypeIcon(
                        //       type: 'Eco-friendly driving',
                        //       selected: _selectedGoodAssesment == 'Eco-friendly driving',
                        //       ontap: (String val) {
                        //         setState(() {
                        //           _selectedGoodAssesment = val;
                        //         });
                        //       },
                        //     ),
                        //   ),
                        //   Expanded(
                        //     child: AssestmentTypeIcon(
                        //       type: 'Rules of the road',
                        //       selected: _selectedGoodAssesment == 'Rules of the road',
                        //       ontap: (String val) {
                        //         setState(() {
                        //           _selectedGoodAssesment = val;
                        //         });
                        //       },
                        //     ),
                        //   ),
                        //   //todo add road safety andvehicleKnowledg assessment sections
                        // ],

                        ),
                  ),
                  const SizedBox(height: 15),
                  // assessment details
                  SelectedGoodAssementDetailCard(
                    selectedGoodAssesment: _selectedGoodAssesment,
                  ),
                ],
              );
      },
    );
  }

  Widget badAtSection() {
    return BlocBuilder<MetadataCubit, MetadataState>(
      builder: (context, state) {
        return state is! MetadataLoaded
            ? kLoadingWidget(context)
            : Column(
                mainAxisSize: MainAxisSize.min,
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
                        children: List.generate(
                            state.skillCategories?.length ?? 0,
                            (index) => Expanded(
                                  child: BadAssestmentTypeIcon(
                                    type: state.skillCategories![index].code,
                                    selected: _needToPracticeAssesment ==
                                        state.skillCategories![index].code,
                                    ontap: (String val) {
                                      setState(() {
                                        _needToPracticeAssesment = val;
                                      });
                                    },
                                  ),
                                ))
                        //  [
                        //   Expanded(
                        //     child: BadAssestmentTypeIcon(
                        //       type: 'Vehicle knowledge',
                        //       selected: _needToPracticeAssesment == 'Vehicle knowledge',
                        //       ontap: (String val) {
                        //         setState(() {
                        //           _needToPracticeAssesment = val;
                        //         });
                        //       },
                        //     ),
                        //   ),
                        //   Expanded(
                        //     child: BadAssestmentTypeIcon(
                        //       type: 'Road safety and behavior',
                        //       selected: _needToPracticeAssesment ==
                        //           'Road safety and behavior',
                        //       ontap: (String val) {
                        //         setState(() {
                        //           _needToPracticeAssesment = val;
                        //         });
                        //       },
                        //     ),
                        //   ),
                        //   Expanded(
                        //     child: Container(),
                        //   ),
                        // ],
                        ),
                  ),
                  const SizedBox(height: 15),
                  // assessment details
                  SelectedBadAssementDetailCard(
                    selectedAssesment: _needToPracticeAssesment,
                  ),
                ],
              );
      },
    );
  }
}
