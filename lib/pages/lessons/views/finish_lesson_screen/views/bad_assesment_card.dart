import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/radio_boxes/primary_square_radio_box.dart';
import 'package:korbil_mobile/pages/lessons/bloc/assessment/assessment_bloc.dart';
import 'package:korbil_mobile/theme/theme.dart';

class SelectedBadAssementDetailCard extends StatelessWidget {
  const SelectedBadAssementDetailCard({
    required this.selectedAssesment,
    super.key,
  });

  final String selectedAssesment;

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

  Widget vehicleKnowledge(BuildContext context) {
    return BlocBuilder<AssessmentBloc, AssessmentState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selectedAssesment,
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
                        state.vehicleKnowledge.contains('Pulling up on the right') ||
                            false,
                    onTap: () => context
                        .read<AssessmentBloc>()
                        .add(VehicleKnowledge(item: 'Pulling up on the right')),
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
                    selected:
                        state.vehicleKnowledge.contains('Reverse parking into a bay') ||
                            false,
                    onTap: () => context
                        .read<AssessmentBloc>()
                        .add(VehicleKnowledge(item: 'Reverse parking into a bay')),
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
          ],
        );
      },
    );
  }

  Widget category(BuildContext context) {
    switch (selectedAssesment) {
      case 'Vehicle knowledge':
        return vehicleKnowledge(context);
      default:
        return const Center(
          child: Text('subcategories not available'),
        );
    }
  }
}
