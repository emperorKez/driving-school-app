import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/pages/school/views/add_new_course/views/add_new_course.dart';
import 'package:korbil_mobile/pages/school/views/manage_users/views/pending_user_detail_card.dart';
import 'package:korbil_mobile/pages/school/views/manage_users/views/user_detail_card.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class InstManageUsers extends StatefulWidget {
  const InstManageUsers({super.key});

  @override
  State<InstManageUsers> createState() => _InstManageUsersState();
}

class _InstManageUsersState extends State<InstManageUsers> {
  String _selectedType = 'Approved Users';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                'Users',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              leading: const InstAppBarBackBtn(),
              actions: const [_AppBarAction()],
            ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                _buildTypeCard('Approved Users'),
                _buildTypeCard('Pending Users'),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            if (_selectedType == 'Approved Users')
              _buildUsersList()
            else
              _buildPendingUsersList(),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Column _buildPendingUsersList() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InstPendingUserDetailsCard(name: 'mikaelanders@gmail.com'),
        InstPendingUserDetailsCard(name: 'mikaelanders@gmail.com'),
        InstPendingUserDetailsCard(name: 'mikaelanders@gmail.com'),
        InstPendingUserDetailsCard(name: 'mikaelanders@gmail.com'),
        InstPendingUserDetailsCard(name: 'mikaelanders@gmail.com'),
        InstPendingUserDetailsCard(name: 'mikaelanders@gmail.com'),
      ],
    );
  }

  Column _buildUsersList() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InstUserDetailsCard(),
        InstUserDetailsCard(),
        InstUserDetailsCard(),
        InstUserDetailsCard(),
        InstUserDetailsCard(),
        InstUserDetailsCard(),
      ],
    );
  }

  Widget _buildTypeCard(String text) {
    return Expanded(
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
                  color: _selectedType == text
                      ? KorbilTheme.of(context).primaryColor
                      : KorbilTheme.of(context).secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              if (_selectedType == text)
                Divider(
                  height: 3,
                  thickness: 3,
                  color: KorbilTheme.of(context).primaryColor,
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
  const _AppBarAction();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (cxt) => const InstAddNewCourse(),
          ),
        );
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
            '+ Add User',
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
