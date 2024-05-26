import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/radio_boxes/primary_square_radio_box.dart';
import 'package:korbil_mobile/pages/lessons/bloc/assessment/assessment_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/metadata/metadata_cubit.dart';
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
      child: category(context),
    );
  }


  Widget category(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
        BlocBuilder<MetadataCubit, MetadataState>(
          builder: (context, state) {
            if (state is! MetadataLoaded) {
              return kLoadingWidget(context);
            } else {
              final category = state.skillCategories![state.skillCategories!
                  .indexWhere((e) => e.code == selectedGoodAssesment)];
              final assessment = getAssesment(context, selectedGoodAssesment);
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
        return context.read<AssessmentBloc>().state.goodAtManeuvering;
      case 'ECO_FRIENDLY':
        return context.read<AssessmentBloc>().state.goodAtEcoFriendly;
      case 'ROAD_RULES':
        return context.read<AssessmentBloc>().state.goodAtRoadRules;
      case 'ROAD_SAFETY':
        return context.read<AssessmentBloc>().state.goodAtRoadSafety;
      case 'VEHICLE_KNOWLEDGE':
        return context.read<AssessmentBloc>().state.goodAtVehicleKnowledge;
      default:
        return context.read<AssessmentBloc>().state.goodAtManeuvering;
    }
  }

}
