import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/locator.dart';
import 'package:korbil_mobile/nav/nav_service.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/repository/school_info/models/school_info.dart';

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
        body: _renderMobileBody(),
      ),
    );
  }

  Widget _renderMobileBody() {
    final s = MediaQuery.of(context).size;
    return BlocConsumer<SchoolBloc, SchoolState>(
      listener: (context, state) {
        if (state is SchoolError){
          errorSnackbar(context, error: state.error);
        }
        if (state is SchoolLoaded && state.schoolInfo != null){
          lc<NavigationService>()
                      .navigateTo(rootNavKey, AppRouter.appHome);
        }
      },
      builder: (context, state) {
        context.read<SchoolBloc>().add(GetAllSchool());
        if (state is! SchoolLoaded){return kLoadingWidget(context);}else{
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
                   Text( state.schoolList!.isEmpty ? 'No School Found' :
                    'We found your driving school. Join now?',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
           if (state.schoolList!.isNotEmpty)
            Center(
              child: _renderSchoolCard(state.schoolList![0]),
            ),
            const SizedBox(
              height: 30,
            ),
            if (state.schoolList!.isNotEmpty)
            PrimaryBtn(
              text: 'Join',
              ontap: () {
                //todo Api to join a school
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
              onTap: () => Navigator.pop(context),
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
        );}
      },
    );
  }

  Container _renderSchoolCard(SchoolInfo school) {
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
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(school.logo, errorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/imgs/ins/auth/sample_school_logo.png');
          },),
           Text(
            school.name,
            style: const TextStyle(
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
                     Text(
                      school.address,
                      style: const TextStyle(
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
                     Text(
                      school.phoneNumber,
                      style: const TextStyle(
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
            const Text(
              'Upload',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.green,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
