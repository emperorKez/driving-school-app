import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
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
          width: 85,
          height: 85,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imgs/ins/lessons/avatar1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 12),
            child: BlocBuilder<StaffBloc, StaffState>(
              builder: (context, state) {
                if (state is StaffLoaded){
                final profile = state.staff!.profile;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${profile.firstName} ${profile.lastName}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      profile.phoneNumber,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      profile.email,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ); } else{ return kLoadingWidget(context);}
              },
            ),
          ),
        ),
      ],
    );
  }
}
