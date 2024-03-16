import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/repository/school_info/models/driving_school.dart';
import 'package:korbil_mobile/theme/theme.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({
    required this.size, required this.package, super.key,
  });

  final Size size;
  final Package package;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: KorbilTheme.of(context).white,
        // border: Border.all(color: AppColors.grey1),
        boxShadow: [
          BoxShadow(
            color: KorbilTheme.of(context).alternate1,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              SizedBox(
                height: size.height * 0.3 - 12,
              ),
              Image.asset(
                'assets/imgs/ins/school/elp_left.png',
                height: 32,
              ),
            ],
          ),
          // middle
          Container(
            width: size.width * 0.6,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(
                  color: KorbilTheme.of(context).alternate1,
                ),
              ),
            ),
            child: Column(
              children: [
                //package 10 hours
                SizedBox(
                  height: size.height * 0.3,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Package',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color:
                                        KorbilTheme.of(context).secondaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '${package.schoolPackage.timeDuration} Hours',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color:
                                        KorbilTheme.of(context).secondaryColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                              color: KorbilTheme.of(context).primaryColor,
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 12),
                                Text(
                                  'Offer',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: KorbilTheme.of(context).white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '50%',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: KorbilTheme.of(context).white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //lesson count
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              package.schoolPackage.packageCourseSyllabus!.length.toString(),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: KorbilTheme.of(context).primaryColor,
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // SizedBox(
                            //   height: 2,
                            // ),
                            Text(
                              'Total Lessons',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: KorbilTheme.of(context).secondaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
                DottedLine(
                  dashColor: KorbilTheme.of(context).alternate1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  r'$' '${package.schoolPackage.price}.00',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).secondaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const PrimaryBtn(
                  text: 'Edit',
                  fontSize: 14,
                  pvm: 8,
                  hm: 45,
                ),

                const SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.3 - 12,
              ),
              Image.asset(
                'assets/imgs/ins/school/elp_right.png',
                height: 32,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
