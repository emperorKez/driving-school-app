import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/theme/theme.dart';

class ManageLessonAddLessonView extends StatefulWidget {
  const ManageLessonAddLessonView({super.key});

  @override
  State<ManageLessonAddLessonView> createState() =>
      _ManageLessonAddLessonViewState();
}

class _ManageLessonAddLessonViewState extends State<ManageLessonAddLessonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Add Lessons',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
      ),
      body: CustomScreenPadding(
        child: ListView(
          children: const [
            SizedBox(
              height: 10,
            ),
            _LessonDataCard(),
            _LessonDataCard(),
            _LessonDataCard(),
            _LessonDataCard(),
            _LessonDataCard(),
            _LessonDataCard(),
          ],
        ),
      ),
    );
  }
}

class _LessonDataCard extends StatefulWidget {
  const _LessonDataCard({
    super.key,
  });

  @override
  State<_LessonDataCard> createState() => _LessonDataCardState();
}

class _LessonDataCardState extends State<_LessonDataCard> {
  int _number = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: KorbilTheme.of(context).alternate1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 12, top: 5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: KorbilTheme.of(context).primaryColor,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/imgs/ins/lessons/traffic_lights.png',
                    width: 35,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Traffic Light Drive',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: KorbilTheme.of(context).secondaryColor,
                      ),
                    ),
                    Text(
                      'Duration : 60 min',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: KorbilTheme.of(context).secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _number += 1;
                        });
                      },
                      child: Text(
                        '+',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                          fontSize: 28,
                          color: KorbilTheme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: KorbilTheme.of(context).secondaryColor),
                      ),
                      child: Center(
                        child: Text(
                          _number.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: KorbilTheme.of(context).secondaryColor,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_number != 0) {
                          setState(() {
                            _number -= 1;
                          });
                        }
                      },
                      child: Text(
                        '-',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                          fontSize: 28,
                          color: KorbilTheme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
