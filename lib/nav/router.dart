import 'package:flutter/material.dart';
import 'package:korbil_mobile/pages/app_home/app_home.dart';
import 'package:korbil_mobile/pages/auth/auth.dart';
import 'package:korbil_mobile/pages/lessons/lessons.dart';
import 'package:korbil_mobile/pages/notifications/notifications.dart';
import 'package:korbil_mobile/pages/school/school.dart';
import 'package:korbil_mobile/pages/students/students.dart';

// root
final rootNavKey = GlobalKey<NavigatorState>();
// lessons tab navigator
final lessonsNavKey = GlobalKey<NavigatorState>();
// students tab navigator
final studentsNavKey = GlobalKey<NavigatorState>();
// notifications tab navigator
final notificationsNavKey = GlobalKey<NavigatorState>();
// school tab navigator
final schoolNavKey = GlobalKey<NavigatorState>();

class AppRouter {
  // auth routes
  static const splash = '/';
  static const getStarted = 'getStarted';
  static const createAcc = 'createAcc';
  static const login = 'login';
  static const createDrivingSchool = 'createDrivingSchool';
  static const joinDrivingSchool = 'joinDrivingSchool';

  // global routes
  static const appHome = 'appHome';

  // lesssons
  static const lessonHome = 'lessonHome';
  static const bookedLessons = 'bookedLessons';
  static const completedLessons = 'completedLessons';
  static const completedLessonDetails = 'completedLessonDetails';
  static const lessonDetails = 'lessonDetails';
  static const lessonDetailAddReview = 'lessonDetailAddReview';
  static const lessonDetailMapView = 'lessonDetailMapView';
  static const addException = 'addException';
  static const editTimeSchedule = 'editTimeSchedule';
  static const finishLesson = 'finishLesson';

  // students
  static const studentList = 'studentList';
  static const manageLessonAddLessonView = 'manageLessonAddLessonView';
  static const manageStudentLesson = 'manageStudentLesson';
  static const studentProfileApproved = 'studentProfileApproved';
  static const profilePackageHistory = 'profilePackageHistory';
  static const studentProfileUnapproved = 'studentProfileUnapproved';

  // notifications
  static const notifications = 'notifications';

  // school
  static const schoolSettings = 'schoolSettings';
  static const addCourse = 'addCourse';
  static const addNewCourse = 'addNewCourse';
  static const addNewPromo = 'addNewPromo';
  static const addNewVehicle = 'addNewVehicle';
  static const createNewPackage = 'createNewPackage';
  static const configurations = 'configurations';
  static const editPackage = 'editPackage';
  static const feedback = 'feedback';
  static const getHelp = 'getHelp';
  static const payments = 'payments';
  static const manageCourse = 'manageCourse';
  static const managePickupLocation = 'managePickupLocation';
  static const managePromotions = 'managePromotions';
  static const manageSchool = 'manageSchool';
  static const manageUsers = 'manageUsers';
  static const messages = 'messages';
  static const privacy = 'privacy';
  static const appSettings = 'appSettings';
  static const singleChat = 'singleChat';
  static const subscription = 'subscription';
  static const usersFeedback = 'usersFeedback';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const GetStartedView());
      case getStarted:
        return MaterialPageRoute(builder: (_) => const GetStartedView());
      case createAcc:
        return MaterialPageRoute(builder: (_) => const CreateAccountView());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case createDrivingSchool:
        return MaterialPageRoute(
            builder: (_) => const CreateDrivingSchoolView(),);
      case joinDrivingSchool:
        return MaterialPageRoute(builder: (_) => const JoinDrivingSchoolView());
      case appHome:
        return MaterialPageRoute(builder: (_) => const AppHomePage());
      case lessonHome:
        return MaterialPageRoute(builder: (_) => const LessonsHomeView());
      case studentList:
        return MaterialPageRoute(builder: (_) => const InstStudentListView());
      case notifications:
        return MaterialPageRoute(builder: (_) => const InstNotificationsView());
      case schoolSettings:
        return MaterialPageRoute(builder: (_) => const SchoolSettingsView());
      //lessons screens
      case bookedLessons:
        return MaterialPageRoute(builder: (_) => const InstBookedLessons());
      case completedLessonDetails:
        return MaterialPageRoute(
            builder: (_) => const InstCompletedLessonDetails(),);
      case completedLessons:
        return MaterialPageRoute(builder: (_) => const InstCompletedLessons());
      case lessonDetails:
        return MaterialPageRoute(builder: (_) => const InstLessonDetails());
      case lessonDetailAddReview:
        return MaterialPageRoute(
            builder: (_) => const InstLessonDetailAddReviewView(),);
      case lessonDetailMapView:
        return MaterialPageRoute(
            builder: (_) => const InstLessonDetailMapView(),);
      case addException:
        return MaterialPageRoute(builder: (_) => const AddExceptionView());
      case editTimeSchedule:
        return MaterialPageRoute(builder: (_) => const EditTimeSchedule());
      case finishLesson:
        return MaterialPageRoute(builder: (_) => const InstFinishLessonView());

      // students screens
      case manageLessonAddLessonView:
        return MaterialPageRoute(
            builder: (_) => const ManageLessonAddLessonView(),);
      case manageStudentLesson:
        return MaterialPageRoute(builder: (_) => const ManageStudentLesson());
      case studentProfileApproved:
        return MaterialPageRoute(
            builder: (_) => const StudentProfileApproved(),);
      case profilePackageHistory:
        return MaterialPageRoute(builder: (_) => const ProfilePackageHistory());
      case studentProfileUnapproved:
        return MaterialPageRoute(
            builder: (_) => const StudentProfileUnApproved(),);

      //school screens
      case addCourse:
        return MaterialPageRoute(builder: (_) => const InstAddCourse());
      case addNewCourse:
        return MaterialPageRoute(builder: (_) => const InstAddNewCourse());
      case addNewPromo:
        return MaterialPageRoute(builder: (_) => const InstAddNewPromoView());
      case addNewVehicle:
        return MaterialPageRoute(builder: (_) => const AddNewVehicleView());
      case createNewPackage:
        return MaterialPageRoute(
            builder: (_) => const InstCreateNewPackageView(),);
      case configurations:
        return MaterialPageRoute(builder: (_) => const ConfigurationView());
      case editPackage:
        return MaterialPageRoute(
            builder: (_) => const InstEditNewPackageView(),);
      case feedback:
        return MaterialPageRoute(builder: (_) => const FeedBackView());
      case getHelp:
        return MaterialPageRoute(builder: (_) => const GetHelpView());
      case payments:
        return MaterialPageRoute(builder: (_) => const InstPaymentsView());
      case manageCourse:
        return MaterialPageRoute(builder: (_) => const InstManageCourseView());
      case managePickupLocation:
        return MaterialPageRoute(
            builder: (_) => const ManagePickupLocationView(),);
      case managePromotions:
        return MaterialPageRoute(builder: (_) => const InstManagePromotions());
      case manageSchool:
        return MaterialPageRoute(builder: (_) => const ManageSchoolView());
      case manageUsers:
        return MaterialPageRoute(builder: (_) => const InstManageUsers());
      case messages:
        return MaterialPageRoute(builder: (_) => const MessagesView());
      case privacy:
        return MaterialPageRoute(builder: (_) => const InstPrivacyView());
      case appSettings:
        return MaterialPageRoute(builder: (_) => const SchoolSettingsView());
      case singleChat:
        return MaterialPageRoute(builder: (_) => const InstAppSettingsView());
      case subscription:
        return MaterialPageRoute(builder: (_) => const InstSingleChatView());
      case usersFeedback:
        return MaterialPageRoute(builder: (_) => const SubscriptionView());

      default:
        return MaterialPageRoute(builder: (_) => const GetStartedView());
    }
  }
}
