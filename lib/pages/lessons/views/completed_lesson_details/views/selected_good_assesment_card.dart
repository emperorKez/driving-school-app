import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/radio_boxes/primary_square_radio_box.dart';
import 'package:korbil_mobile/pages/lessons/bloc/lesson_detail/lesson_detail_cubit.dart';
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
      child: BlocBuilder<LessonDetailCubit, LessonDetailState>(
        builder: (context, state) {
          return state is! LessonDetailLoaded
              ? kLoadingWidget(context)
              : Column(
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
                    for (final element in state
                        .lessonDetail
                        .feedback[state.lessonDetail.feedback.indexWhere(
                            (e) => e.category.name == selectedGoodAssesment,)]
                        .category
                        .subCategories)
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Row(
                          children: [
                            PrimarySelectedSwitch(
                              selected: true,
                              onTap: () {},
                            ),
                            Text(
                              element.name,
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
      ),
    );
  }
}
