import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

class AddStudentButon extends StatelessWidget {
  const AddStudentButon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute<dynamic>(
        //     builder: (cxt) => const InstAddNewCourse(),
        //   ),
        // );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: KorbilTheme.of(context).secondaryColor,
        ),
        child: Center(
          child: Text(
            '+ Add Student',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
