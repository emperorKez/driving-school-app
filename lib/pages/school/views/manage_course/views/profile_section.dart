import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/pages/school/views/school_settings/bloc/profile/profile_bloc.dart';
import 'package:korbil_mobile/theme/theme.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 84,
          height: 84,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/imgs/ins/lessons/avatar3.png'),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Expanded(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return state is ProfileLoaded ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${state.profile!.firstName} ${state.profile!.lastName}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: KorbilTheme.of(context).secondaryColor,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: KorbilTheme.of(context).primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            'Admin',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: KorbilTheme.of(context).white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    state.profile!.phoneNumber!,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: KorbilTheme.of(context).secondaryColor,
                    ),
                  ),
                  Text(
                    state.profile!.email!,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: KorbilTheme.of(context).secondaryColor,
                    ),
                  ),
                ],
              ): kLoadingWidget(context);
            },
          ),
        ),
      ],
    );
  }
}
