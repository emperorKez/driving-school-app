import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/school/bloc/course/course_bloc.dart';
import 'package:korbil_mobile/pages/school/views/add_new_course/views/add_new_course.dart';
import 'package:korbil_mobile/repository/course/model/course.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstManageCourse extends StatefulWidget {
  const InstManageCourse({super.key});

  @override
  State<InstManageCourse> createState() => _ManageCourseState();
}

class _ManageCourseState extends State<InstManageCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Add Course',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
        actions: const [_AppBarAction()],
      ),
      body: BlocConsumer<CourseBloc, CourseState>(
        listener: (context, state) {
          if (state is CourseError) {
            errorSnackbar(context, error: state.error);
          }
        },
        builder: (context, state) {
          return state is! CourseLoaded
              ? kLoadingWidget(context)
              : ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    if (state.courses == null || state.courses!.isEmpty)
                      const Center(
                        child: SizedBox(
                          height: 100,
                          child: Center(
                            child: Text('You do not have any Course'),
                          ),
                        ),
                      )
                    else
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          state.courses!.length,
                          (index) => InstLessonCard(
                            course: state.courses![index],
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              // margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                              padding: const EdgeInsets.symmetric(vertical: 13),
                              decoration: BoxDecoration(
                                color: KorbilTheme.of(context).white,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: KorbilTheme.of(context).secondaryColor,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Close',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color:
                                        KorbilTheme.of(context).secondaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: PrimaryBtn(
                            text: 'Add',
                            vm: 0,
                            hm: 0,
                            fontSize: 14,
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<dynamic>(
                                  builder: (cxt) => const InstAddNewCourse(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                );
        },
      ),
    );
  }
}

class InstLessonCard extends StatelessWidget {
  const InstLessonCard({
    required this.course,
    super.key,
  });
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: KorbilTheme.of(context).white,
        boxShadow: [
          BoxShadow(
            color: KorbilTheme.of(context).alternate2,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: KorbilTheme.of(context).primaryColor)
              // color: KorbilTheme.of(context).primaryColor,
            ),
            child: Center(
              child: Image.asset(
                getCategoryIcon(course.courseCategory.id),
                width: 24,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.course.title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).secondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      course.courseCategory.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Duration : ${course.course.timeDuration}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getCategoryIcon(int categoryId) {
    var categoryIcon = 'assets/imgs/ins/lessons/eco_friendly_green.png';
    switch (categoryId) {
      case 1:
        categoryIcon = 'assets/imgs/ins/lessons/eco_friendly_green.png';
      case 2:
        categoryIcon = 'assets/imgs/ins/lessons/maneuvering_green.png';
      case 3:
        categoryIcon = 'assets/imgs/ins/lessons/car.png';
      case 4:
        categoryIcon = 'assets/imgs/ins/lessons/road_rules_green.png';
      default:
        categoryIcon = 'assets/imgs/ins/lessons/eco_friendly_green.png';
    }
    return categoryIcon;
  }
}

class _AppBarAction extends StatelessWidget {
  const _AppBarAction();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (cxt) => const InstAddNewCourse(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: KorbilTheme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            '+ Add new course',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
