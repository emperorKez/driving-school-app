import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class InstructorsList extends StatelessWidget {
  const InstructorsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? const NeverScrollableScrollPhysics()
          : null,
      scrollDirection:
          getPreferedOrientation(context) == PreferedOrientation.landscape
              ? Axis.vertical
              : Axis.horizontal,
      children: [
        const _InstructorCard(),
        if (getPreferedOrientation(context) == PreferedOrientation.landscape)
          const SizedBox(height: 8)
        else
          Container(),
        const _InstructorCard(),
        if (getPreferedOrientation(context) == PreferedOrientation.landscape)
          const SizedBox(height: 8)
        else
          Container(),
        const _InstructorCard(),
        if (getPreferedOrientation(context) == PreferedOrientation.landscape)
          const SizedBox(height: 8)
        else
          Container(),
        const _InstructorCard(),
        if (getPreferedOrientation(context) == PreferedOrientation.landscape)
          const SizedBox(height: 8)
        else
          Container(),
        const _InstructorCard(),
        if (getPreferedOrientation(context) == PreferedOrientation.landscape)
          const SizedBox(height: 8)
        else
          Container(),
        const _InstructorCard(),
        const SizedBox(width: 25),
      ],
    );
  }
}

class _InstructorCard extends StatelessWidget {
  const _InstructorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 25),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: KorbilTheme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(12),
            color: KorbilTheme.of(context).primaryColor.withOpacity(0.25),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 12),
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/imgs/ins/lessons/avatar1.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Default Instructor',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Isaiah Richardson',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
