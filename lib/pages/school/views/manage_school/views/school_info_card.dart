import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/pages/school/views/manage_school/cubit/school_info/school_info_bloc.dart';
import 'package:korbil_mobile/theme/theme.dart';

class SchoolInfoCard extends StatelessWidget {
  const SchoolInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolInfoBloc, SchoolInfoState>(
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
                  child: _buildLogo(state.info?.logo as String?),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSchoolName(state, context),
                      const SizedBox(height: 2),
                      _buildSchoolPhone(state, context),
                      const SizedBox(height: 2),
                      _buildSchoolEmail(state, context),
                      const SizedBox(height: 2),
                      _buildAboutUs(state, context),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Container _buildAboutUs(SchoolInfoState state, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (state.info?.description == null)
            Container()
          else
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
            state is SchoolInfoFetching ? '...' : state.info?.description ?? '',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Text _buildSchoolEmail(SchoolInfoState state, BuildContext context) {
    return Text(
      state is SchoolInfoFetching ? '...' : state.info?.email ?? '',
      style: TextStyle(
        fontFamily: 'Poppins',
        color: KorbilTheme.of(context).secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Text _buildSchoolPhone(SchoolInfoState state, BuildContext context) {
    return Text(
      state is SchoolInfoFetching
          ? '...'
          : state.info?.phoneNumber ?? '...phone..',
      style: TextStyle(
        fontFamily: 'Poppins',
        color: KorbilTheme.of(context).secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Text _buildSchoolName(SchoolInfoState state, BuildContext context) {
    return Text(
      state is SchoolInfoFetching ? '...' : state.info?.name ?? 'School name',
      style: TextStyle(
        fontFamily: 'Poppins',
        color: KorbilTheme.of(context).secondaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Image _buildLogo(String? path) {
    if (path == null) {
      return Image.asset(
        'assets/imgs/ins/school/sample_logo.png',
        width: 40,
      );
    } else {
      return Image.network(
        path,
        width: 40,
      );
    }
  }
}
