import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/theme/theme.dart';

import 'add_new_user_alert.dart';
import 'all_student_list.dart';
import 'approve_user_alert.dart';
import 'invited_student_list.dart';
import 'my_student_list.dart';

class InstStudentListView extends StatefulWidget {
  const InstStudentListView({super.key});

  @override
  State<InstStudentListView> createState() => _InstStudentListViewState();
}

class _InstStudentListViewState extends State<InstStudentListView> {
  String _selectedType = 'All';

  Future<void> _showApproveUserAlert() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          // title: Text('Dialog Title'),
          content: ApproveUserAlertContent(),
        );
      },
    );
  }

  Future<void> _addNewUserAlert() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          // title: Text('Dialog Title'),
          content: AddNewUserlertContent(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Student List',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          _AppBarAction(ontap: _addNewUserAlert),
        ],
      ),
      body: _renderMobileBody(),
    );
  }

  Container _renderMobileBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: KorbilTheme.of(context).white,
              boxShadow: [defaultBoxShadow()],
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextFormField(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: KorbilTheme.of(context).secondaryColor,
              ),
              scrollPadding: const EdgeInsets.all(8),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 15,
                  bottom: 15,
                ),
                hintText: 'Search students',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: KorbilTheme.of(context).alternate1,
                ),
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/imgs/ins/school/search.png',
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTypeCard('All'),
              _buildTypeCard('My Students', flex: 2),
              _buildTypeCard('Invited Students', flex: 2),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          _buildList(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    if (_selectedType == 'My Students') {
      return const MyStudentsList();
    } else if (_selectedType == 'Invited Students') {
      return const InvitedStudentList();
    } else {
      return AllStudentsList(
        onApprove: _showApproveUserAlert,
      );
    }
  }

  Widget _buildTypeCard(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedType = text;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color:
                      _selectedType == text ? AppColors.green : AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              if (_selectedType == text)
                const Divider(
                  height: 3,
                  thickness: 3,
                  color: AppColors.green,
                )
              else
                Container(
                  height: 3,
                  width: 10,
                  color: Colors.transparent,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBarAction extends StatelessWidget {
  const _AppBarAction({
    required this.ontap,
    super.key,
  });

  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: KorbilTheme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            '+ New Student',
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
