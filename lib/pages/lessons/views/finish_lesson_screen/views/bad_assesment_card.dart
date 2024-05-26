import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/radio_boxes/primary_square_radio_box.dart';
import 'package:korbil_mobile/pages/lessons/bloc/assessment/assessment_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/metadata/metadata_cubit.dart';
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
      child: category(context),
    );
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
                    selected: state.badAtVehicleKnowledge
                            .contains('Pulling up on the right') ||
                        false,
                    onTap: () {},
                    // => context
                    //     .read<AssessmentBloc>()
                    //     .add(VehicleKnowledge(item: 'Pulling up on the right')),
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
                    selected: state.badAtVehicleKnowledge
                            .contains('Reverse parking into a bay') ||
                        false,
                    onTap: () {},
                    //  => context.read<AssessmentBloc>().add(
                    //     VehicleKnowledge(item: 'Reverse parking into a bay'),),
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
    return Column(
      mainAxisSize: MainAxisSize.min,
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
        BlocBuilder<MetadataCubit, MetadataState>(
          builder: (context, state) {
            if (state is! MetadataLoaded) {
              return kLoadingWidget(context);
            } else {
              final category = state.skillCategories![state.skillCategories!
                  .indexWhere((e) => e.code == selectedAssesment)];
              final assessment = getAssesment(context, selectedAssesment);
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                    category.subCategories.length,
                    (index) => Container(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Row(children: [
                          PrimarySelectedSwitch(
                            selected: assessment.toList().indexWhere((e) =>
                                        e.subCategory.code ==
                                        category.subCategories[index].code) >=
                                    0 ||
                                false,
                            onTap: () {},
                          ),
                          Text(
                            category.subCategories[index].name,
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
                        ]))),
              );
            }
          },
        )
      ],
    );
  }

  Set<Assessment> getAssesment(
      BuildContext context, String selectedGoodAssesment) {
    switch (selectedGoodAssesment) {
      case 'MANEUVERING':
        return context.read<AssessmentBloc>().state.badAtManeuvering;
      case 'ECO_FRIENDLY':
        return context.read<AssessmentBloc>().state.badAtEcoFriendly;
      case 'ROAD_RULES':
        return context.read<AssessmentBloc>().state.badAtRoadRules;
      case 'ROAD_SAFETY':
        return context.read<AssessmentBloc>().state.badAtRoadSafety;
      case 'VEHICLE_KNOWLEDGE':
        return context.read<AssessmentBloc>().state.badAtVehicleKnowledge;
      default:
        return context.read<AssessmentBloc>().state.goodAtManeuvering;
    }
  }
}
