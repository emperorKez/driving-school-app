import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/students/bloc/profile_cubit/profile_cubit.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    required this.studentId,
    super.key,
  });
  final int studentId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          context.read<ProfileCubit>().getProfile(studentId);
          return state is! ProfileLoaded
              ? kLoadingWidget(context)
              : CustomScreenPadding(
                  child: getPreferedOrientation(context) ==
                          PreferedOrientation.landscape
                      ? _buildLandscape(context, state: state)
                      : _buildPortrait(context, state: state),
                );
        },
      ),
    );
  }

  Widget _buildLandscape(BuildContext context, {required ProfileState state}) {
    return Column(
      children: [
        Container(
          width: 78,
          height: 78,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/imgs/ins/lessons/avatar2.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${state.student!.profile.firstName} ${state.student!.profile.lastName}',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              state.student!.profile.phoneNumber,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              state.student!.profile.email,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryBtn(
                  ontap: () {
                    //todo there is no api to send message to student
                  },
                  text: 'Message',
                  fontSize: 14,
                  hm: 0,
                  pvm: 8,
                  phm: 30,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Row _buildPortrait(BuildContext context, {required ProfileState state}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 78,
          height: 78,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/imgs/ins/lessons/avatar2.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${state.student!.profile.firstName} ${state.student!.profile.lastName}',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                state.student!.profile.phoneNumber,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                state.student!.profile.email,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  PrimaryBtn(
                    ontap: () {
                      //todo no api to send message to student right now
                    },
                    text: 'Message',
                    fontSize: 14,
                    hm: 0,
                    pvm: 8,
                    phm: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
