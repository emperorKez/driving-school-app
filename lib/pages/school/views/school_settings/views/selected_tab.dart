import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:korbil_mobile/pages/school/views/settings/views/settings_view.dart';
import 'package:korbil_mobile/pages/school/views/subscription/views/subscription.dart';

class SelectedTab extends StatelessWidget {
  const SelectedTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabMenuBloc, TabMenuState>(
      builder: (context, state) {
        switch (state) {
          case TabMenuState.personalInfo:
            return const InstManageCourseView();
          case TabMenuState.manageSchool:
            return const ManageSchoolView();
          case TabMenuState.manageCourse:
            return const GroupLessonInfo();
          case TabMenuState.manageUsers:
            return const InstManageUsers();
          case TabMenuState.subscription:
            return const SubscriptionView();
          case TabMenuState.messages:
            return const MessagesView(); //todo
          case TabMenuState.payments:
            return const InstPaymentsView(); //todo
          case TabMenuState.promote:
            return const InstManagePromotions();
          case TabMenuState.settings:
            return const InstAppSettingsView(); //todo
          case TabMenuState.getHelp:
            return const GetHelpView();
          case TabMenuState.feedback:
            return const FeedBackView();
          case TabMenuState.privacy:
            return const InstPrivacyView();
          // ignore: no_default_cases
          default:
            return const InstManageCourseView();
        }
      },
    );
  }
}
