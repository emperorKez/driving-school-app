import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/radio_boxes/primary_square_radio_box.dart';
import 'package:korbil_mobile/pages/lessons/bloc/assessment/assessment_bloc.dart';
import 'package:korbil_mobile/theme/theme.dart';

class SelectedGoodAssementDetailCard extends StatelessWidget {
  const SelectedGoodAssementDetailCard({
    required this.selectedGoodAssesment,
    super.key,
  });

  final String selectedGoodAssesment;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: KorbilTheme.of(context).primaryBg,
        ),
        child: category(context),);
  }

  Widget maneuvering(BuildContext context) {
    return BlocBuilder<AssessmentBloc, AssessmentState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selectedGoodAssesment,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  PrimarySelectedSwitch(
                    selected:
                        state.maneuvering.contains('Pulling up on the right') ||
                            false,
                    onTap: () => context
                        .read<AssessmentBloc>()
                        .add(Maneuvering(item: 'Pulling up on the right')),
                  ),
                  Text(
                    'Pulling up on the right',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/imgs/ins/lessons/tasks.png',
                    width: 20,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  PrimarySelectedSwitch(
                    selected: state.maneuvering
                            .contains('Forward parking into a bay') ||
                        false,
                    onTap: () => context
                        .read<AssessmentBloc>()
                        .add(Maneuvering(item: 'Forward parking into a bay')),
                  ),
                  Text(
                    'Forward parking into a bay',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  PrimarySelectedSwitch(
                    selected: state.maneuvering
                            .contains('Reverse parking into a bay') ||
                        false,
                    onTap: () => context
                        .read<AssessmentBloc>()
                        .add(Maneuvering(item: 'Reverse parking into a bay')),
                  ),
                  Text(
                    'Reverse parking into a bay',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/imgs/ins/lessons/tasks.png',
                    width: 20,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  PrimarySelectedSwitch(
                    selected: state.maneuvering
                            .contains('Entering and leaving traffic') ||
                        false,
                    onTap: () => context
                        .read<AssessmentBloc>()
                        .add(Maneuvering(item: 'Entering and leaving traffic')),
                  ),
                  Text(
                    'Entering and leaving traffic',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget category(BuildContext context) {
    switch (selectedGoodAssesment) {
      case 'Maneuvering':
        return maneuvering(context);
      case 'Eco-friendly driving':
        return const SizedBox();
      case 'Rules of the road':
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }
}
