import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/snackBar/top_snack_bar.dart';
import 'package:korbil_mobile/pages/school/views/manage_school/cubit/school_feedback/school_feedback_bloc.dart';
import 'package:korbil_mobile/pages/school/views/manage_school/views/feedback_card.dart';
import 'package:korbil_mobile/pages/school/views/users_feedback/views/users_feedback.dart';
import 'package:korbil_mobile/theme/theme.dart';

class UsersFeedbackSection extends StatelessWidget {
  const UsersFeedbackSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SchoolFeedbackBloc, SchoolFeedbackState>(
      listener: (context, state) {
        if (state.errorMsg != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              buildTopSnackbar(context, state.errorMsg ?? 'Error fetching'),
            );
          context.read<SchoolFeedbackBloc>().add(ClearErrorMsg());
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Users Feedback',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            BlocBuilder<SchoolFeedbackBloc, SchoolFeedbackState>(
              builder: (context, state) {
                if (state is SchoolFeedbackFetching) {
                  return _loadingIndicator(context);
                }
                if (state.feedbacks.isEmpty) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: Center(
                      child: Text(
                        'No feedbacks to show',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: KorbilTheme.of(context).secondaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                }
                return Column(
                  children: state.feedbacks
                      .map((r) => InstFeedBackCard(
                            review: r,
                          ))
                      .toList(),
                );
              },
            ),
            const SizedBox(height: 25),
            BlocBuilder<SchoolFeedbackBloc, SchoolFeedbackState>(
              builder: (context, state) {
                if (state.feedbacks.isEmpty) {
                  return Container();
                }
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (ctx) => const InstUsersFeedBackView(),
                        ),
                      );
                    },
                    child: Text(
                      'SEE All',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Center _loadingIndicator(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
          color: KorbilTheme.of(context).primaryColor),
    );
  }
}
