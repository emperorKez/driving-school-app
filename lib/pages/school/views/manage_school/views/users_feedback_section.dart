import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/school/bloc/review/review_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/views/manage_school/views/feedback_card.dart';
import 'package:korbil_mobile/pages/school/views/users_feedback/views/users_feedback.dart';
import 'package:korbil_mobile/theme/theme.dart';

class UsersFeedbackSection extends StatelessWidget {
  const UsersFeedbackSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewBloc, ReviewState>(
      listener: (context, state) {
        if (state is ReviewError) {
          errorSnackbar(context, error: state.error);
        }
      },
      builder: (context, state) {
        if (state is ReviewInitial) {
          context.read<ReviewBloc>().add(GetReviews(
              schoolId: context.read<SchoolBloc>().state.schoolInfo!.id,),);
        }
        if (state is! ReviewLoaded) {
          return kLoadingWidget(context);
        } else {
          final feedback = state.reviews ?? [];
          return Container(
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
                if (feedback.isEmpty)
                  noFeedbackContainer(context)
                else
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      feedback.length,
                      (index) => InstFeedBackCard(
                        review: feedback[index],
                      ),
                    ),
                  ),
                if (feedback.isNotEmpty)
                  Center(
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
                  ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget noFeedbackContainer(BuildContext context) {
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

  Center _loadingIndicator(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: KorbilTheme.of(context).primaryColor,
      ),
    );
  }
}
