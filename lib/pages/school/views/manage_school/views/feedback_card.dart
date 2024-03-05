import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/feedback.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstFeedBackCard extends StatelessWidget {
  const InstFeedBackCard({
    required this.review,
    super.key,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        // border: Border.all(color: AppColors.grey1),
        color: KorbilTheme.of(context).white,
        boxShadow: [defaultBoxShadow()],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                review.student.toString(),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/imgs/ins/school/star_green.png',
                    width: 10,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    review.stars.toString(),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            review.comment ?? '',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Feedback Approval',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: KorbilTheme.of(context).primaryColor,
                ),
                child: Center(
                  // ignore: use_if_null_to_convert_nulls_to_bools
                  child: review.feedbackApproval == true
                      ? Icon(
                          Icons.done,
                          color: KorbilTheme.of(context).white,
                          size: 20,
                        )
                      : Container(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
