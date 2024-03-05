import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/school/views/add_new_course/views/add_new_course.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstAddCourse extends StatefulWidget {
  const InstAddCourse({super.key});

  @override
  State<InstAddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<InstAddCourse> {
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            const InstLessonCard(),
            const InstLessonCard(),
            const InstLessonCard(),
            const InstLessonCard(),
            const InstLessonCard(),
            const InstLessonCard(),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
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
                            color: KorbilTheme.of(context).secondaryColor,
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
                const Expanded(
                  child: PrimaryBtn(
                    text: 'Add',
                    vm: 0,
                    hm: 0,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class InstLessonCard extends StatelessWidget {
  const InstLessonCard({
    super.key,
  });

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
              offset: Offset(1, 1),
            ),
          ]),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: KorbilTheme.of(context).primaryColor),
            child: Center(
              child: Image.asset(
                'assets/imgs/ins/lessons/traffic_lights.png',
                width: 24,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Traffic Light Drive',
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
                    Image.asset(
                      'assets/imgs/ins/school/group.png',
                      width: 24,
                    ),
                    Text(
                      'Group',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Duration : 60 min',
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
}

class _AppBarAction extends StatelessWidget {
  const _AppBarAction({
    super.key,
  });

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
