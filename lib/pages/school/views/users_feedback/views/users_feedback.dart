import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/school/bloc/review/review_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/views/manage_school/views/feedback_card.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstUsersFeedBackView extends StatelessWidget {
  const InstUsersFeedBackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Users Feedback',
          style: TextStyle(
            fontFamily: 'Lato',
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
      ),
      body: _renderMobileBody(),
    );
  }

  ListView _renderMobileBody() {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: BlocBuilder<ReviewBloc, ReviewState>(
            builder: (context, state) {
              if (state is! SchoolLoaded) {
                return kLoadingWidget(context);
              } else {
                final feedback = state.reviews ?? [];

                return feedback.isEmpty
                    ? noFeedbackContainer(context)
                    : Column(
                        children: List.generate(
                          feedback.length,
                          (index) => InstFeedBackCard(
                            review: feedback[index],
                          ),
                        ),
                      );
              }
            },
          ),
        ),
      ],
    );
  }

  // Row _buildPagination(AllFeedbacksState state) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: List.generate(
  //       state.pageCount,
  //       (index) {
  //         if (index < 7) {
  //           return PaginationItem(
  //             page: index + 1,
  //           );
  //         }
  //         return Container();
  //       },
  //     ),
  //   );
  // }

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
