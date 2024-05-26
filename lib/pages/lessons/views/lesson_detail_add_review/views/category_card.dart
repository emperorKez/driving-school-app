import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/metadata/models/skill_category.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    required this.ontap,
    super.key,
  });

  final SkillCategory category;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap(category.code);
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
                getIcon(category.code),
                width: 24,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  category.name,
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
  
  String getIcon(String code) {
    var icon = 'assets/imgs/ins/lessons/maneuvering_green.png';
    switch (code) {
      case 'MANEUVERING':
      icon = 'assets/imgs/ins/lessons/maneuvering_green.png';
        
      case 'ECO_FRIENDLY':
      icon = 'assets/imgs/ins/lessons/eco_friendly_green.png';
        
      case 'VEHICLE_KNOWLEDGE':
      icon = 'assets/imgs/ins/lessons/shield_green.png';
        
      case 'ROAD_RULES':
      icon = 'assets/imgs/ins/lessons/road_rules_green.png';
        
      case 'ROAD_SAFETY':
      icon = 'assets/imgs/ins/lessons/road_safety_green.png';
      
    }
    return icon;
  }
}

// class AssesmentCategoryDetails {
//   const AssesmentCategoryDetails({
//     required this.id,
//     required this.type,
//     required this.status,
//     required this.img,
//     required this.subTypes,
//   });

//   final String id;
//   final String type;
//   final int status;
//   final String img;
//   final List<AssesmentSubCategoryDetails> subTypes;
// }

// class AssesmentSubCategoryDetails {
//   const AssesmentSubCategoryDetails({
//     required this.type,
//     required this.status,
//   });

//   final String type;
//   final int status;
// }
