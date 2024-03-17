import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/pages/school/bloc/group_lesson/group_lesson_bloc.dart';
import 'package:korbil_mobile/pages/school/views/feedback_view/views/feedback_view.dart';
import 'package:korbil_mobile/pages/school/views/get_help/views/get_help_view.dart';
import 'package:korbil_mobile/pages/school/views/group_lesson_info/views/group_lesson_info.dart';
import 'package:korbil_mobile/pages/school/views/manage_course/views/manage_course_view.dart';
import 'package:korbil_mobile/pages/school/views/manage_promotions/views/manage_promotions.dart';
import 'package:korbil_mobile/pages/school/views/manage_school/views/manage_school.dart';
import 'package:korbil_mobile/pages/school/views/manage_users/views/manage_users.dart';
import 'package:korbil_mobile/pages/school/views/message_view/views/messages_view.dart';
import 'package:korbil_mobile/pages/school/views/payments_view/views/inst_payments_view.dart';
import 'package:korbil_mobile/pages/school/views/privacy/views/privacy.dart';
import 'package:korbil_mobile/pages/school/views/school_settings/bloc/tab_menu/tab_menu_bloc.dart';
import 'package:korbil_mobile/pages/school/views/school_settings/views/profile_section.dart';
import 'package:korbil_mobile/pages/school/views/settings/views/settings_view.dart';
import 'package:korbil_mobile/pages/school/views/subscription/views/subscription.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 30),
        const ProfileSection(),
        const SizedBox(height: 20),
        _buildMenuItem(
          'assets/imgs/ins/school/menu1.png',
          'Personal Info',
          () {
            if (getPreferedOrientation(context) ==
                PreferedOrientation.landscape) {
              context.read<TabMenuBloc>().add(
                    ChangeMenuItem(TabMenuState.personalInfo),
                  );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (cxt) => const InstManageCourseView(),
              ),
            );
          },
        ),
        _buildMenuItem(
          'assets/imgs/ins/school/menu2.png',
          'Manage School',
          () {
            if (getPreferedOrientation(context) ==
                PreferedOrientation.landscape) {
              context.read<TabMenuBloc>().add(
                    ChangeMenuItem(TabMenuState.manageSchool),
                  );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (cxt) => const ManageSchoolView(),
              ),
            );
          },
        ),
        BlocBuilder<GroupLessonBloc, GroupLessonState>(
          builder: (context, state) {
            return state is! GroupLessonLoaded? kLoadingWidget(context): _buildMenuItem(
              'assets/imgs/ins/school/menu3.png',
              'Manage Course',
              () {
                if (getPreferedOrientation(context) ==
                    PreferedOrientation.landscape) {
                  context.read<TabMenuBloc>().add(
                        ChangeMenuItem(TabMenuState.manageCourse),
                      );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (cxt) =>  GroupLessonInfo(lesson: state.groupLessons![0].lessons[0],),
                  ),
                );
              },
            );
          },
        ),
        _buildMenuItem(
          'assets/imgs/ins/school/menu4.png',
          'Manage Users',
          () {
            if (getPreferedOrientation(context) ==
                PreferedOrientation.landscape) {
              context.read<TabMenuBloc>().add(
                    ChangeMenuItem(TabMenuState.manageUsers),
                  );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (cxt) => const InstManageUsers(),
              ),
            );
          },
        ),
        _buildMenuItem(
          'assets/imgs/ins/school/menu5.png',
          'Subscription',
          () {
            if (getPreferedOrientation(context) ==
                PreferedOrientation.landscape) {
              context.read<TabMenuBloc>().add(
                    ChangeMenuItem(TabMenuState.subscription),
                  );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (cxt) => const SubscriptionView(),
              ),
            );
          },
        ),
        _buildMenuItem(
          'assets/imgs/ins/school/menu6.png',
          'Messages',
          () {
            if (getPreferedOrientation(context) ==
                PreferedOrientation.landscape) {
              context.read<TabMenuBloc>().add(
                    ChangeMenuItem(TabMenuState.messages),
                  );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (cxt) => const MessagesView(),
              ),
            );
          },
        ),
        _buildMenuItem(
          'assets/imgs/ins/school/menu7.png',
          'Payments',
          () {
            if (getPreferedOrientation(context) ==
                PreferedOrientation.landscape) {
              context.read<TabMenuBloc>().add(
                    ChangeMenuItem(TabMenuState.payments),
                  );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (cxt) => const InstPaymentsView(),
              ),
            );
          },
        ),
        _buildMenuItem(
          'assets/imgs/ins/school/menu8.png',
          'Promote',
          () {
            if (getPreferedOrientation(context) ==
                PreferedOrientation.landscape) {
              context.read<TabMenuBloc>().add(
                    ChangeMenuItem(TabMenuState.promote),
                  );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (cxt) => const InstManagePromotions(),
              ),
            );
          },
        ),
        _buildMenuItem(
          'assets/imgs/ins/school/menu9.png',
          'Settings',
          () {
            if (getPreferedOrientation(context) ==
                PreferedOrientation.landscape) {
              context.read<TabMenuBloc>().add(
                    ChangeMenuItem(TabMenuState.settings),
                  );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (cxt) => const InstAppSettingsView(),
              ),
            );
          },
        ),
        _buildMenuItem(
          'assets/imgs/ins/school/menu10.png',
          'Get Help',
          () {
            if (getPreferedOrientation(context) ==
                PreferedOrientation.landscape) {
              context.read<TabMenuBloc>().add(
                    ChangeMenuItem(TabMenuState.getHelp),
                  );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (cxt) => const GetHelpView(),
              ),
            );
          },
        ),
        _buildMenuItem(
          'assets/imgs/ins/school/menu12.png',
          'Feedback',
          () {
            if (getPreferedOrientation(context) ==
                PreferedOrientation.landscape) {
              context.read<TabMenuBloc>().add(
                    ChangeMenuItem(TabMenuState.feedback),
                  );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (cxt) => const FeedBackView(),
              ),
            );
          },
        ),
        _buildMenuItem(
          'assets/imgs/ins/school/menu13.png',
          'Privacy',
          () {
            if (getPreferedOrientation(context) ==
                PreferedOrientation.landscape) {
              context.read<TabMenuBloc>().add(
                    ChangeMenuItem(TabMenuState.privacy),
                  );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (cxt) => const InstPrivacyView(),
              ),
            );
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  bool _isSelectedTab(String title, TabMenuState state) {
    switch (title) {
      case 'Personal Info':
        return state == TabMenuState.personalInfo;
      case 'Manage School':
        return state == TabMenuState.manageSchool;
      case 'Manage Course':
        return state == TabMenuState.manageCourse;
      case 'Manage Users':
        return state == TabMenuState.manageUsers;
      case 'Subscription':
        return state == TabMenuState.subscription;
      case 'Messages':
        return state == TabMenuState.messages;
      case 'Payments':
        return state == TabMenuState.payments;
      case 'Promote':
        return state == TabMenuState.promote;
      case 'Settings':
        return state == TabMenuState.settings;
      case 'Feedback':
        return state == TabMenuState.feedback;
      case 'Get Help':
        return state == TabMenuState.getHelp;
      case 'Privacy':
        return state == TabMenuState.privacy;
      default:
        return false;
    }
  }

  Widget _buildMenuItem(String icon, String title, Function ontap) {
    return BlocBuilder<TabMenuBloc, TabMenuState>(
      builder: (context, state) {
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
                    color: _isSelectedTab(title, state)
                        ? KorbilTheme.of(context).primaryColor
                        : KorbilTheme.of(context).secondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
