import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/theme/theme.dart';

class SchoolInfoCard extends StatelessWidget {
  const SchoolInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchoolBloc, SchoolState>(
      listener: (context, state) {
        if (state is SchoolError) {
          errorSnackbar(context, error: state.error);
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(color: KorbilTheme.of(context).primaryColor),
                ),
                child: Center(
                  child: _buildLogo(state.schoolInfo!.logo),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        state.schoolInfo!.name,
                        style: customStyle(context),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        state.schoolInfo!.phoneNumber,
                        style: customStyle(context),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        state.schoolInfo!.email,
                        style: customStyle(context),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: KorbilTheme.of(context).secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        state.schoolInfo!.description,
                        style: customStyle(context),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Container _buildAboutUs(SchoolState state, BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 25),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'About Us',
  //           style: TextStyle(
  //             fontFamily: 'Poppins',
  //             color: KorbilTheme.of(context).secondaryColor,
  //             fontSize: 16,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //         const SizedBox(height: 15),
  //         Text(
  //           state is SchoolLoading
  //               ? '...'
  //               : state.school!.schoolInfo!.description,
  //           style: TextStyle(
  //             fontFamily: 'Poppins',
  //             color: KorbilTheme.of(context).secondaryColor,
  //             fontSize: 12,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  TextStyle customStyle(BuildContext context) => TextStyle(
        fontFamily: 'Poppins',
        color: KorbilTheme.of(context).secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  Image _buildLogo(String? path) {
    if (path == null) {
      return Image.asset(
        'assets/imgs/ins/school/sample_logo.png',
        width: 40,
      );
    } else {
      return Image.network(
        path,
        width: 40, errorBuilder: (context, error, stackTrace) {
          return Image.asset(
        'assets/imgs/ins/school/sample_logo.png',
        width: 40,
      );
        },
      );
    }
  }
}
