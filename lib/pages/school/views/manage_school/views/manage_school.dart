import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/auth/bloc/auth/auth_bloc.dart';
import 'package:korbil_mobile/pages/lessons/views/edit_time_schedule/views/edit_time_schedule.dart';
import 'package:korbil_mobile/pages/school/bloc/availability/availabilty_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_location/school_location_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/vehicle/vehicle_bloc.dart';
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
    return const _ManageSchool();
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
    print('manage School: ${context.read<AuthBloc>().state.token}');
    print('auth state: ${context.read<AuthBloc>().state}');
    print('auth status: ${context.read<AuthBloc>().state.status}');
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
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (cxt) => const EditTimeSchedule(),
                  ),
                );
              },
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
          publishSchool(),
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

  Widget publishSchool() {
    return BlocConsumer<SchoolBloc, SchoolState>(
      listener: (context, state) {
        if (state is SchoolLoaded) {
          Navigator.pop(context);
        }
        if (state is SchoolError) {
          errorSnackbar(context, error: state.error);
        }
      },
      builder: (context, state) {
        if (state is! SchoolLoaded) {
          return kLoadingWidget(context);
        } else {
          return state.schoolInfo!.schoolStatus == 5
              ? const SizedBox()
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: PrimaryBtn(
                    ontap: () {
                      final schoolLocation = context
                          .read<SchoolLocationBloc>()
                          .state
                          .schoolLocations;
                      final vehicles =
                          context.read<VehicleBloc>().state.vehicles;
                      final availableTime =
                          context.read<AvailabiltyBloc>().state.availableDates;
                      if (schoolLocation == null || schoolLocation.isEmpty) {
                        errorSnackbar(
                          context,
                          error: 'Configure School Pickup Locations',
                        );
                      } else if (vehicles == null || vehicles.isEmpty) {
                        errorSnackbar(
                          context,
                          error: 'Configure School Vehicles',
                        );
                      } else if (availableTime == null ||
                          availableTime.isEmpty) {
                        errorSnackbar(
                          context,
                          error: 'Configure School Available Dates',
                        );
                      } else {
                        context
                            .read<SchoolBloc>()
                            .add(PublishSchool(schoolId: state.schoolInfo!.id));
                      }
                    },
                    text: 'Publish School',
                    vm: 0,
                    hm: 0,
                    fontSize: 14,
                  ),
                );
        }
      },
    );
  }
}
