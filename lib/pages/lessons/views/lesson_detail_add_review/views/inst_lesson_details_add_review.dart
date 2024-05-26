// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/pages/lessons/bloc/assessment/assessment_bloc.dart';
import 'package:korbil_mobile/pages/lessons/views/lesson_detail_add_review/views/bottom_sheet_details.dart';
import 'package:korbil_mobile/pages/lessons/views/lesson_detail_add_review/views/category_card.dart';
import 'package:korbil_mobile/pages/school/bloc/metadata/metadata_cubit.dart';
import 'package:korbil_mobile/repository/metadata/models/skill_category.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class InstLessonDetailAddReviewView extends StatefulWidget {
  const InstLessonDetailAddReviewView({
    required this.lessonId,
    required this.duration,
    super.key,
  });
  final int lessonId;
  final dynamic duration;

  @override
  State<InstLessonDetailAddReviewView> createState() =>
      _InstLessonDetailAddReviewViewState();
}

class _InstLessonDetailAddReviewViewState
    extends State<InstLessonDetailAddReviewView> {
  // final List<AssesmentCategoryDetails> _types = const [
  //   AssesmentCategoryDetails(
  //     id: 'maneuvering',
  //     type: 'Maneuvering',
  //     status: 0,
  //     img: 'assets/imgs/ins/lessons/maneuvering_green.png',
  //     subTypes: [
  //       AssesmentSubCategoryDetails(
  //         type: 'Pulling up on the right',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Forward parking into a bay',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Reverse parking into a bay',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Entering and leaving traffic',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Lorem ipsum dolor sit amet consectetur',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Sit tempor adipiscing sed at',
  //         status: 0,
  //       ),
  //     ],
  //   ),
  //   AssesmentCategoryDetails(
  //     id: 'eco',
  //     type: 'Eco-friendly driving',
  //     status: 0,
  //     img: 'assets/imgs/ins/lessons/eco_friendly_green.png',
  //     subTypes: [
  //       AssesmentSubCategoryDetails(
  //         type: 'Pulling up on the right',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Forward parking into a bay',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Reverse parking into a bay',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Entering and leaving traffic',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Lorem ipsum dolor sit amet consectetur',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Sit tempor adipiscing sed at',
  //         status: 0,
  //       ),
  //     ],
  //   ),
  //   AssesmentCategoryDetails(
  //     id: 'rules',
  //     type: 'Rules of the road',
  //     status: 0,
  //     img: 'assets/imgs/ins/lessons/road_rules_green.png',
  //     subTypes: [
  //       AssesmentSubCategoryDetails(
  //         type: 'Pulling up on the right',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Forward parking into a bay',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Reverse parking into a bay',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Entering and leaving traffic',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Lorem ipsum dolor sit amet consectetur',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Sit tempor adipiscing sed at',
  //         status: 0,
  //       ),
  //     ],
  //   ),
  //   AssesmentCategoryDetails(
  //     id: 'vehicle',
  //     type: 'Vehicle knowledge',
  //     status: 0,
  //     img: 'assets/imgs/ins/lessons/shield_green.png',
  //     subTypes: [
  //       AssesmentSubCategoryDetails(
  //         type: 'Pulling up on the right',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Forward parking into a bay',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Reverse parking into a bay',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Entering and leaving traffic',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Lorem ipsum dolor sit amet consectetur',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Sit tempor adipiscing sed at',
  //         status: 0,
  //       ),
  //     ],
  //   ),
  //   AssesmentCategoryDetails(
  //     id: 'safety',
  //     type: 'Road safety and behavior',
  //     status: 0,
  //     img: 'assets/imgs/ins/lessons/road_safety_green.png',
  //     subTypes: [
  //       AssesmentSubCategoryDetails(
  //         type: 'Pulling up on the right',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Forward parking into a bay',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Reverse parking into a bay',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Entering and leaving traffic',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Lorem ipsum dolor sit amet consectetur',
  //         status: 0,
  //       ),
  //       AssesmentSubCategoryDetails(
  //         type: 'Sit tempor adipiscing sed at',
  //         status: 0,
  //       ),
  //     ],
  //   ),
  // ];

  String _exapnded = '';

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: KorbilTheme.of(context).primaryBg,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Instructor Reviews',
            style: TextStyle(
              fontFamily: 'Lato',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          leading: const InstAppBarBackBtn(),
        ),
        body: getPreferedOrientation(context) == PreferedOrientation.landscape
            ? _renderTabletBody(s)
            : _renderMobileBody(s),
      ),
    );
  }

  Widget _renderTabletBody(Size s) {
    return Stack(
      children: [
        SizedBox(
          width: s.width,
          height: s.height,
          child: Image.asset(
            'assets/imgs/ins/lessons/sample_map.png',
            width: s.width,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: ListView(
            children: [
              BottomSheetDetails(
                s: s,
                lessonId: widget.lessonId,
                duration: widget.duration,
              ),
              const SizedBox(height: 35),
              _buildReviewSection(),
            ],
          ),
        ),
      ],
    );
  }

  ListView _renderMobileBody(Size s) {
    return ListView(
      children: [
        _buildReviewSection(),
        const SizedBox(height: 35),
        BottomSheetDetails(
          s: s,
          lessonId: widget.lessonId,
          duration: widget.duration,
        ),
      ],
    );
  }

  Container _buildReviewSection() {
    return Container(
      padding: const EdgeInsets.symmetric(
        // horizontal: 0,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              // vertical: 2,
            ),
            child: BlocBuilder<MetadataCubit, MetadataState>(
              builder: (context, state) {
                if (state is MetadataInitial) {
                  context.read<MetadataCubit>().getMetadata();
                }
                return state is! MetadataLoaded
                    ? kLoadingWidget(context)
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.skillCategories?.length ?? 0,
                        itemBuilder: (cxt, index) {
                          final category = state.skillCategories![index];
                          return Column(
                            children: [
                              Slidable(
                                key: const ValueKey(0),
                                startActionPane: ActionPane(
                                  dragDismissible: false,
                                  motion: const ScrollMotion(),
                                  children: [
                                    // A SlidableAction can have an icon and/or a label.
                                    SlidableAction(
                                      onPressed: null,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 5,
                                      ),
                                      backgroundColor:
                                          KorbilTheme.of(context).primaryColor,
                                      foregroundColor: Colors.white,
                                      icon: Icons.thumb_up,
                                      spacing: 8,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12),
                                      ),
                                      label: 'Good At',
                                    ),
                                  ],
                                ),
                                endActionPane: ActionPane(
                                  dragDismissible: false,
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: null,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 5,
                                      ),
                                      backgroundColor: KorbilTheme.of(context)
                                          .secondaryColor,
                                      foregroundColor: Colors.white,
                                      icon: Icons.thumb_down,
                                      spacing: 8,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                      ),
                                      label: 'Bad At',
                                    ),
                                  ],
                                ),
                                child: CategoryCard(
                                  category: category,
                                  ontap: (String val) {
                                    if (_exapnded == val) {
                                      setState(() {
                                        _exapnded = '';
                                      });
                                    } else {
                                      setState(() {
                                        _exapnded = val;
                                      });
                                    }
                                  },
                                ),
                              ),
                              if (_exapnded == category.code)
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: category.subCategories.length,
                                  itemBuilder: (cxt, index) {
                                    final subCategory =
                                        category.subCategories[index];
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 3,
                                      ),
                                      child: Slidable(
                                        key: const ValueKey(0),
                                        startActionPane: ActionPane(
                                          dragDismissible: false,
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              onPressed: (context) {
                                                addAssessment(
                                                  category: category,
                                                  subCat: subCategory,
                                                  good: true,
                                                );
                                              },
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                                // vertical: 0,
                                              ),
                                              backgroundColor:
                                                  KorbilTheme.of(context)
                                                      .primaryColor,
                                              foregroundColor: Colors.white,
                                              icon: Icons.thumb_up,
                                              spacing: 8,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                bottomLeft: Radius.circular(12),
                                              ),
                                              label: 'Good At',
                                            ),
                                          ],
                                        ),
                                        endActionPane: ActionPane(
                                          dragDismissible: false,
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              onPressed: (context) {
                                                addAssessment(
                                                  category: category,
                                                  subCat: subCategory,
                                                  good: false,
                                                );
                                              },
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                                // vertical: 5,
                                              ),
                                              backgroundColor:
                                                  KorbilTheme.of(context)
                                                      .secondaryColor,
                                              foregroundColor: Colors.white,
                                              icon: Icons.thumb_down,
                                              spacing: 8,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                              ),
                                              label: 'Bad At',
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: subCategoryCard(
                                                subCategory: subCategory,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                              else
                                Container(),
                            ],
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addAssessment({
    required SkillCategory category,
    required SubCategory subCat,
    required bool good,
  }) {
    switch (category.code) {
      case 'MANEUVERING':
        context.read<AssessmentBloc>().add(AddManeuvering(
            subCategory: subCat, goodAt: good, categoryId: category.id));
      case 'ECO_FRIENDLY':
        context.read<AssessmentBloc>().add(AddEcoFriendly(
            subCategory: subCat, goodAt: good, categoryId: category.id));
      case 'ROAD_RULES':
        context.read<AssessmentBloc>().add(AddRoadRules(
            subCategory: subCat, goodAt: good, categoryId: category.id));
      case 'VEHICLE_KNOWLEDGE':
        context.read<AssessmentBloc>().add(
              AddVehicleKnowledge(
                  subCategory: subCat, goodAt: good, categoryId: category.id),
            );
      case 'ROAD_SAFETY':
        context.read<AssessmentBloc>().add(AddRoadSafety(
            subCategory: subCat, goodAt: good, categoryId: category.id));
    }
  }

  Widget subCategoryCard({required SubCategory subCategory}) {
    final theme = KorbilTheme.of(context);
    final defaultColor = theme.alternate2;
    // if (checkIsGoodAt(subCat: type, review: subType.type) == true) {
    //   setState(() => defaultColor = theme.primaryColor);
    // }
    // if (checkIsGoodAt(subCat: type, review: subType.type) == false) {
    //   setState(() => defaultColor = Colors.redAccent);
    // }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: defaultColor,
        //  checkIsGoodAt(subCat: type, review: subType.type) == true
        //     ? theme.primaryColor
        //     : checkIsGoodAt(subCat: type, review: subType.type) == false
        //         ? Colors.redAccent
        //         : theme.alternate2,
      ),
      child: Text(
        subCategory.name,
        style: TextStyle(
          fontFamily: 'Poppins',
          color: theme.secondaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  bool? checkIsGoodAt({required String subCat, required String review}) {
    bool? isGoodAt;
    final state = context.read<AssessmentBloc>().state;
    switch (subCat) {
      case 'maneuvering':
        setState(() {
          isGoodAt = state.goodAtManeuvering.contains(review)
              ? true
              : state.badAtManeuvering.contains(review)
                  ? false
                  : null;
        });

      case 'eco':
        setState(() {
          isGoodAt = state.goodAtEcoFriendly.contains(review)
              ? true
              : state.badAtEcoFriendly.contains(review)
                  ? false
                  : null;
        });

      case 'rules':
        setState(() {
          isGoodAt = state.goodAtRoadRules.contains(review)
              ? true
              : state.badAtRoadRules.contains(review)
                  ? false
                  : null;
        });

      case 'vehicle':
        setState(() {
          isGoodAt = state.goodAtVehicleKnowledge.contains(review)
              ? true
              : state.badAtVehicleKnowledge.contains(review)
                  ? false
                  : null;
        });

      case 'safety':
        setState(() {
          isGoodAt = state.goodAtRoadSafety.contains(review)
              ? true
              : state.badAtRoadSafety.contains(review)
                  ? false
                  : null;
        });
    }
    return isGoodAt;
  }
}
