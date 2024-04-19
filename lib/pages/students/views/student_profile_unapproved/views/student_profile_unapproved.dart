import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/secondary_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/school/bloc/package/package_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/student/student_bloc.dart';
import 'package:korbil_mobile/pages/students/views/profile_package_history/views/profile_package_history.dart';
import 'package:korbil_mobile/repository/student/models/student.dart';

class StudentProfileUnApproved extends StatefulWidget {
  const StudentProfileUnApproved({required this.student, super.key});
  final Student student;

  @override
  State<StudentProfileUnApproved> createState() =>
      _StudentProfileUnApprovedState();
}

class _StudentProfileUnApprovedState extends State<StudentProfileUnApproved> {
  Future<void> _showDeclineUserAlert() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          // title: Text('Dialog Title'),
          content: _DeclineAlertContent(),
        );
      },
    );
  }

  Future<void> _showApproveUserAlert() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Dialog Title'),
          content: _ApproveUserAlertContent(widget.student),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Lato',
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
        actions: const [_AppBarAction()],
      ),
      body: _renderMobileBody(),
    );
  }

  Container _renderMobileBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 30,
          ),
           _ProfileDetails(widget.student),
           _PaymentDetailsCard(widget.student),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: PrimaryBtn(
                  text: 'Approve',
                  fontSize: 16,
                  hm: 0,
                  vm: 8,
                  ontap: _showApproveUserAlert,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SecondaryBtn(
                  text: 'Decline',
                  hm: 0,
                  fontSize: 16,
                  borderColor: AppColors.black,
                  textColor: AppColors.black,
                  vm: 8,
                  ontap: _showDeclineUserAlert,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class _ApproveUserAlertContent extends StatelessWidget {
  const _ApproveUserAlertContent(this.student);
  final Student student;

  @override
  Widget build(BuildContext context) {
    final schoolId = context.read<StaffBloc>().state.staff!.staffData.schoolId;
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Pending Approval',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Are you sure you want Approval',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '“${student.profile.firstName} ${student.profile.lastName}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: SecondaryBtn(
                  text: 'No',
                  borderColor: AppColors.black,
                  textColor: AppColors.black,
                  ontap: () {
                    Navigator.pop(context);
                  },
                  vm: 5,
                  hm: 0,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: PrimaryBtn(
                  text: 'Yes, Approve',
                  ontap: () {
                    context.read<StudentBloc>().add(ApproveStudent(
                        schoolId: schoolId, studentId: student.profile.id,),);
                    Navigator.pop(context);
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DeclineAlertContent extends StatelessWidget {
  const _DeclineAlertContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              'assets/imgs/ins/profile/warning_red.png',
              width: 60,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Reason for decline',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.grey1),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: Container(),
              iconSize: 25,
              hint: const Text(
                'Select the decline reason',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              iconDisabledColor: AppColors.black,
              iconEnabledColor: AppColors.black,
              items: const [
                DropdownMenuItem<String>(
                  value: 'item1',
                  child: Text(
                    'Item 1',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'item2',
                  child: Text(
                    'Item 2',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
              onChanged: (val) {},
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          PrimaryBtn(
            text: 'Decline',
            bgColor: AppColors.red,
            ontap: () {
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<dynamic>(
              //     builder: (cxt) => const CreateDrivingSchoolView(),
              //   ),
              // );
            },
            vm: 10,
            hm: 0,
          ),
          SecondaryBtn(
            text: 'Back',
            ontap: () {
              Navigator.pop(context);
            },
            vm: 5,
            hm: 0,
          ),
        ],
      ),
    );
  }
}

class _PaymentDetailsCard extends StatelessWidget {
  const _PaymentDetailsCard(this.student);
  final Student student;

  @override
  Widget build(BuildContext context) {
    // final package = context
    //     .read<PackageBloc>()
    //     .state
    //     .packages![context.read<PackageBloc>().state.packages!.indexWhere((e) =>
    //         student.studentData. .schoolPackageRefs!
    //             .contains(e.schoolPackage.id))].schoolPackage;
    final package = context
        .read<PackageBloc>()
        .state
        .packages![0].schoolPackage;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.green),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 12,
            ),
            child: Column(
              children: [
                 Text(
                  package.title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child:  Text(
                    '€ ${package.price}',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Text(
                       'Payment Date: ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(DateFormat.yMMMMd().format(package.createdAt),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Completed? : ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                     Text(
                      '${package.isActive}',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Image.asset(
                      'assets/imgs/ins/profile/verified_tick.png',
                      width: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/imgs/ins/profile/download_reciept.png',
                  width: 24,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Payment details',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileDetails extends StatelessWidget {
  const _ProfileDetails(this.student);
  final Student student;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            width: 120,
            height: 120,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(student.profile.avatar),
                onError: (exception, stackTrace) => AssetImage('assets/imgs/ins/lessons/avatar2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
           Text(
            '${student.profile.firstName} ${student.profile.lastName}',
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
           Text(
            student.profile.phoneNumber,
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
           Text(
           student.profile.email,
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarAction extends StatelessWidget {
  const _AppBarAction();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (_) => const ProfilePackageHistory(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Image.asset(
          'assets/imgs/ins/profile/gear.png',
          width: 22,
        ),
      ),
    );
  }
}
