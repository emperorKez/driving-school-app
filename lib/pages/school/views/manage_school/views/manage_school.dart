import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/pages/school/views/add_new_vehicle/views/add_new_vehicle.dart';
import 'package:korbil_mobile/pages/school/views/configuration_view/views/configuration_view.dart';
import 'package:korbil_mobile/pages/school/views/manage_pickup_location/views/manage_pickup_location.dart';
import 'package:korbil_mobile/pages/school/views/manage_school/views/package_section.dart';
import 'package:korbil_mobile/pages/school/views/manage_school/views/school_info_card.dart';
import 'package:korbil_mobile/pages/school/views/manage_school/views/users_feedback_section.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class ManageSchoolView extends StatelessWidget {
  const ManageSchoolView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const _ManageSchool();
  }
}

class _ManageSchool extends StatefulWidget {
  const _ManageSchool();

  @override
  State<_ManageSchool> createState() => _ManageSchoolViewState();
}

class _ManageSchoolViewState extends State<_ManageSchool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                'Manage School',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              leading: const InstAppBarBackBtn(),
            ),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          const SchoolInfoCard(),
          const SizedBox(height: 30),
          const PackageSection(),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: _buildItem(
              'assets/imgs/ins/school/calendar_green.png',
              'Set Available Dates',
              () {},
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: _buildItem(
              'assets/imgs/ins/school/marker_green.png',
              'Manage Pickup Locations',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (cxt) => const ManagePickupLocationView(),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: _buildItem(
              'assets/imgs/ins/school/car_green.png',
              'Manage Vehicles',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (cxt) => const AddNewVehicleView(),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: _buildItem(
              'assets/imgs/ins/school/gear_green.png',
              'Configurations',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (cxt) => const ConfigurationView(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          const UsersFeedbackSection(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  GestureDetector _buildItem(String icon, String title, Function ontap) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 24,
            ),
            const SizedBox(
              width: 25,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
