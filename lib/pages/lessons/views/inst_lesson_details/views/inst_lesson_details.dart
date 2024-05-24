import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/radio_boxes/primary_square_radio_box.dart';
import 'package:korbil_mobile/pages/lessons/bloc/lesson_detail/lesson_detail_cubit.dart';
import 'package:korbil_mobile/pages/lessons/views/inst_lesson_details/views/class_assignment_detail_card.dart';
import 'package:korbil_mobile/pages/lessons/views/inst_lesson_details/views/history_item_card.dart';
import 'package:korbil_mobile/pages/lessons/views/inst_lesson_details/views/lesson_feedback_card.dart';
import 'package:korbil_mobile/pages/lessons/views/inst_lesson_details/views/profile_details.dart';
import 'package:korbil_mobile/pages/students/bloc/package_cubit/package_cubit.dart';
import 'package:korbil_mobile/repository/lesson/model/calender.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class InstLessonDetails extends StatefulWidget {
  const InstLessonDetails({required this.calender, super.key});
  final Calender calender;

  @override
  State<InstLessonDetails> createState() => _InstLessonDetailsState();
}

class _InstLessonDetailsState extends State<InstLessonDetails> {
  String _selectedLessonReviewSection = 'Maneuvering';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: KorbilTheme.of(context).white,
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
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:
              getPreferedOrientation(context) == PreferedOrientation.landscape
                  ? ListView(
                      children: [
                        ProfileDetails(
                          calender: widget.calender,
                        ),
                        const SizedBox(height: 25),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClassAssignmentDetailsCard(
                                calender: widget.calender,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(child: _buildOtherSections()),
                          ],
                        ),
                      ],
                    )
                  : ListView(
                      children: [
                        ClassAssignmentDetailsCard(
                          calender: widget.calender,
                        ),
                        const SizedBox(height: 35),
                        ProfileDetails(calender: widget.calender),
                        const SizedBox(height: 35),
                        _buildOtherSections(),
                      ],
                    ),
        ),
      ),
    );
  }

  Widget _buildOtherSections() {
    context.read<PackageCubit>().getStudentPackage(widget.calender.student.id);
    return SizedBox(
      height: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? MediaQuery.sizeOf(context).height * 0.8
          : null,
      child: BlocBuilder<PackageCubit, PackageState>(
        builder: (context, state) {
          if (state is! PackageLoaded) {
            return kLoadingWidget(context);
          } else {
            if (state.studentPackage!.pastLessons.isEmpty) {
              return const SizedBox();
            } else {
              context
                  .read<LessonDetailCubit>()
                  .getDetail(state.studentPackage!.pastLessons.last.id);
              return ListView(
                shrinkWrap: true,
                physics: getPreferedOrientation(context) ==
                        PreferedOrientation.landscape
                    ? null
                    : const NeverScrollableScrollPhysics(),
                children: [
                  Text(
                    'Previous Lesson',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AssestmentTypeIcon(
                            type: 'Maneuvering',
                            selected:
                                _selectedLessonReviewSection == 'Maneuvering',
                            ontap: (String val) {
                              setState(() {
                                _selectedLessonReviewSection = val;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: AssestmentTypeIcon(
                            type: 'Eco-friendly driving',
                            selected: _selectedLessonReviewSection ==
                                'Eco-friendly driving',
                            ontap: (String val) {
                              setState(() {
                                _selectedLessonReviewSection = val;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: AssestmentTypeIcon(
                            type: 'Rules of the road',
                            selected: _selectedLessonReviewSection ==
                                'Rules of the road',
                            ontap: (String val) {
                              setState(() {
                                _selectedLessonReviewSection = val;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  // assessment details
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: category(context),
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'Instructor Feedback',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const InstLessonFeedbackCard(),
                  const SizedBox(height: 30),
                  Text(
                    'History',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      state.studentPackage!.pastLessons.length > 5
                          ? 5
                          : state.studentPackage!.pastLessons.length,
                      (index) => InstHIstoryItemCard(
                        lesson: state.studentPackage!.pastLessons[index],
                      ),
                    ),
                  ),

                  const SizedBox(height: 80),
                ],
              );
            }
          }
        },
      ),
    );
  }

  Widget category(BuildContext context) {
    switch (_selectedLessonReviewSection) {
      case 'Maneuvering':
        return _maneuvering(context);
      case 'Eco-friendly driving':
        return const SizedBox();
      case 'Rules of the road':
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }

  Widget _maneuvering(BuildContext context) {
    return BlocBuilder<LessonDetailCubit, LessonDetailState>(
      builder: (context, state) {
        return state is! LessonDetailLoaded
            ? kLoadingWidget(context)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _selectedLessonReviewSection,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  for (final element in state
                      .lessonDetail
                      .feedback[state.lessonDetail.feedback.indexWhere(
                    (e) => e.category.name == _selectedLessonReviewSection,
                  )]
                      .category
                      .subCategories)
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          PrimarySelectedSwitch(
                            selected: true,
                            onTap: () {},
                          ),
                          Text(
                            element.name,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: KorbilTheme.of(context).secondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
      },
    );
  }
}

class AssestmentTypeIcon extends StatelessWidget {
  const AssestmentTypeIcon({
    required this.selected,
    required this.type,
    required this.ontap,
    super.key,
  });
  final bool selected;
  final String type;
  final Function ontap;

  String _getAssesmentTypeImg(String type) {
    switch (type) {
      case 'Maneuvering':
        if (selected) {
          return 'assets/imgs/ins/lessons/maneuvering_white.png';
        } else {
          return 'assets/imgs/ins/lessons/maneuvering_green.png';
        }
      case 'Eco-friendly driving':
        if (selected) {
          return 'assets/imgs/ins/lessons/eco_friendly_white.png';
        } else {
          return 'assets/imgs/ins/lessons/eco_friendly_green.png';
        }
      case 'Rules of the road':
        if (selected) {
          return 'assets/imgs/ins/lessons/road_rules_white.png';
        } else {
          return 'assets/imgs/ins/lessons/road_rules_green.png';
        }
      default:
        return 'assets/imgs/ins/lessons/road_rules_white.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap(type);
      },
      child: Column(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: KorbilTheme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(6),
              color: selected
                  ? KorbilTheme.of(context).primaryColor
                  : KorbilTheme.of(context).white,
            ),
            child: Center(
              child: Image.asset(
                _getAssesmentTypeImg(type),
                width: 28,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            type,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
