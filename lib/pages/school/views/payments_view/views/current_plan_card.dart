import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/school/bloc/subscription/subscription_bloc.dart';
import 'package:korbil_mobile/theme/theme.dart';

class CurrentPlanCard extends StatelessWidget {
  const CurrentPlanCard({
    required this.subscriptionLevel,
    super.key,
  });
  final int subscriptionLevel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubscriptionBloc, SubscriptionState>(
      listener: (context, state) {
        if (state is SubscriptionError) {
          errorSnackbar(context, error: state.error);
        }
      },
      builder: (context, state) {
        if (state is SubscriptionInitial) {
          context.read<SubscriptionBloc>().add(GetAllSubscriptionLevels());
        }
        return state is! SubscriptionLoaded
            ? kLoadingWidget(context)
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  color: KorbilTheme.of(context).primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                  border:
                      Border.all(color: KorbilTheme.of(context).primaryColor),
                ),
                child: Text(
                  state
                      .subscriptionLevels![state.subscriptionLevels!
                          .indexWhere((e) => e.id == subscriptionLevel)]
                      .name,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).secondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
      },
    );
  }
}
