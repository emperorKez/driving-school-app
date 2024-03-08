import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';

class JoinDrivingSchoolView extends StatefulWidget {
  const JoinDrivingSchoolView({super.key});

  @override
  State<JoinDrivingSchoolView> createState() => _JoinDrivingSchoolViewState();
}

class _JoinDrivingSchoolViewState extends State<JoinDrivingSchoolView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _renderMobileBody(context),
      ),
    );
  }

  ListView _renderMobileBody(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: s.height * 0.1,
        ),
        Center(
          child: Column(
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: AppColors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'körbil',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'We found your driving school. Join now?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
          child: _renderSchoolCard(), 
        ),
        const SizedBox(
          height: 30,
        ),
        PrimaryBtn(
          text: 'Join',
          ontap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute<dynamic>(
            //     builder: (cxt) => const InstHome(),
            //   ),
            // );
          },
          hm: 23,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 23,
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColors.black,
              ),
            ),
            child: const Center(
              child: Text(
                'Maybe later',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.black,
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Container _renderSchoolCard() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 12,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey1,
              offset: Offset(0.2, 0.2),
              blurRadius: 2,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/imgs/ins/auth/sample_school_logo.png',
            width: 100,
          ),
          const Text(
            'My Driving Academy',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          LayoutBuilder(
            builder: (ctx, ctr) {
              return Container(
                width: ctr.maxWidth,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/imgs/ins/auth/marker_green.png',
                      width: 10,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Bergmansgatan 20, 431 30 Mölndal',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 5,
          ),
          LayoutBuilder(
            builder: (ctx, ctr) {
              return Container(
                width: ctr.maxWidth,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/imgs/ins/auth/star.png',
                      width: 16,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Reviews',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '(56)',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 5,
          ),
          LayoutBuilder(
            builder: (ctx, ctr) {
              return Container(
                width: ctr.maxWidth,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/imgs/ins/auth/call_outline.png',
                      width: 16,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '+94 71 41 87 921',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  Container _renderUploadBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.green),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/ins/auth/upload2.png',
              width: 24,
              height: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('Upload',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
    );
  }
}
