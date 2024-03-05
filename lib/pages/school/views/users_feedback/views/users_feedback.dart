import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/snackBar/top_snack_bar.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/locator.dart';
import 'package:korbil_mobile/pages/school/views/users_feedback/cubit/all_feedbacks/all_feedbacks_bloc.dart';
import 'package:korbil_mobile/theme/theme.dart';

import '../../manage_school/views/feedback_card.dart';
import 'pagination_item.dart';

class InstUsersFeedBackView extends StatelessWidget {
  const InstUsersFeedBackView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllFeedbacksBloc(lc())..add(GetAllFeedbacks()),
      lazy: false,
      child: const _InstUsersFeedBackView(),
    );
  }
}

class _InstUsersFeedBackView extends StatefulWidget {
  const _InstUsersFeedBackView({super.key});

  @override
  State<_InstUsersFeedBackView> createState() => _InstUsersFeedBackViewState();
}

class _InstUsersFeedBackViewState extends State<_InstUsersFeedBackView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AllFeedbacksBloc, AllFeedbacksState>(
      listener: (context, state) {
        if (state.errorMsg != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              buildTopSnackbar(context, state.errorMsg ?? 'Error fetching'),
            );
          context.read<AllFeedbacksBloc>().add(ClearErrorMsg());
        }
      },
      child: Scaffold(
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
      ),
    );
  }

  ListView _renderMobileBody() {
    return ListView(
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: BlocBuilder<AllFeedbacksBloc, AllFeedbacksState>(
            builder: (context, state) {
              if (state is AllFeedbacksFetching) {
                return _loadingIndicator(context);
              }
              if (state.reviews.isEmpty) {
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
                children: state.reviews
                    .map((r) => InstFeedBackCard(
                          review: r,
                        ))
                    .toList(),
              );
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        BlocBuilder<AllFeedbacksBloc, AllFeedbacksState>(
          builder: (context, state) {
            if (state is AllFeedbacksFetching || state.reviews.isEmpty) {
              return Container();
            }
            return _buildPagination(state);
          },
        ),
      ],
    );
  }

  Row _buildPagination(AllFeedbacksState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        state.pageCount,
        (index) {
          if (index < 7) {
            return PaginationItem(
              page: index + 1,
            );
          }
          return Container();
        },
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
