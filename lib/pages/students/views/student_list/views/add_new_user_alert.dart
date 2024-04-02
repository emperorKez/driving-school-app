import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/theme/theme.dart';

class AddNewUserlertContent extends StatefulWidget {
  const AddNewUserlertContent({
    super.key,
  });

  @override
  State<AddNewUserlertContent> createState() => _AddNewUserlertContentState();
}

class _AddNewUserlertContentState extends State<AddNewUserlertContent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Add New Student',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: KorbilTheme.of(context).secondaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: emailController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Enter Student email';
                  }
                  return null;
                },
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: KorbilTheme.of(context).secondaryColor,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: KorbilTheme.of(context).alternate2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: KorbilTheme.of(context).primaryColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: KorbilTheme.of(context).warningColor,
                    ),
                  ),
                  hintText: "Enter student's email",
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: KorbilTheme.of(context).alternate1,
                  ),
                  prefixIcon: SizedBox(
                    width: 50,
                    child: Center(
                      child: Image.asset(
                        'assets/imgs/ins/profile/email_green.png',
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Assign this student to me',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: KorbilTheme.of(context).secondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryBtn(
              text: 'Submit',
              ontap: () {
                if (_formKey.currentState!.validate()) {
                  context.read<SchoolBloc>().add(InviteStudent(
                      schoolId: context
                          .read<StaffBloc>()
                          .state
                          .staff!
                          .staffData
                          .schoolId,
                      email: emailController.text,),);
                  Navigator.pop(context);
                }
                // Navigator.push(
                //   context,
                //   MaterialPageRoute<dynamic>(
                //     builder: (cxt) => const CreateDrivingSchoolView(),
                //   ),
                // );
              },
              vm: 10,
              hm: 0,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
