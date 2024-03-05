import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class TypeCategoryCard extends StatelessWidget {
  const TypeCategoryCard({
    required this.type,
    required this.ontap,
    super.key,
  });

  final AssesmentCategoryDetails type;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap(type.type);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          // horizontal: 12,
          vertical: 2,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: KorbilTheme.of(context).primaryBg,
          borderRadius: BorderRadius.circular(12),
          border:
              Border.all(color: KorbilTheme.of(context).alternate2, width: 2)
          // boxShadow: const [
          //   BoxShadow(
          //     color: AppColors.grey2,
          //     blurRadius: 2,
          //     spreadRadius: 2,
          //     offset: Offset(2, 3),
          //   )
          // ],
          ,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 5,
          ),
          child: Row(
            children: [
              Image.asset(
                type.img,
                width: 24,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  type.type,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).secondaryColor,
                    fontSize: getPreferedOrientation(context) ==
                            PreferedOrientation.landscape
                        ? 12
                        : 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (getPreferedOrientation(context) ==
                  PreferedOrientation.landscape)
                Container()
              else
                const Spacer(),
              Image.asset(
                'assets/imgs/ins/lessons/right_arrow_green.png',
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AssesmentCategoryDetails {
  const AssesmentCategoryDetails({
    required this.id,
    required this.type,
    required this.status,
    required this.img,
    required this.subTypes,
  });

  final String id;
  final String type;
  final int status;
  final String img;
  final List<AssesmentSubCategoryDetails> subTypes;
}

class AssesmentSubCategoryDetails {
  const AssesmentSubCategoryDetails({
    required this.type,
    required this.status,
  });

  final String type;
  final int status;
}
