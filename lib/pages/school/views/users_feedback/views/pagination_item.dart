import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/pages/school/views/users_feedback/cubit/all_feedbacks/all_feedbacks_bloc.dart';
import 'package:korbil_mobile/theme/theme.dart';

class PaginationItem extends StatelessWidget {
  const PaginationItem({
    required this.page,
    super.key,
  });
  final int page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AllFeedbacksBloc>().add(SelectPage(page));
      },
      child: BlocBuilder<AllFeedbacksBloc, AllFeedbacksState>(
        builder: (context, state) {
          return Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: state.page == page
                  ? KorbilTheme.of(context).primaryColor
                  : KorbilTheme.of(context).white,
              border: Border.all(
                  color: state.page == page
                      ? KorbilTheme.of(context).primaryColor
                      : KorbilTheme.of(context).secondaryColor),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Text(
                page == 6 ? '...' : page.toString(),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: state.page == page
                      ? KorbilTheme.of(context).white
                      : KorbilTheme.of(context).secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
