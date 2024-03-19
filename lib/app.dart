import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:korbil_mobile/localization/app_localization.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/app_home/views/app_home.dart';
import 'package:korbil_mobile/pages/auth/bloc/auth/auth_bloc.dart';
import 'package:korbil_mobile/pages/auth/bloc/create_account/create_account_bloc.dart';
import 'package:korbil_mobile/pages/auth/bloc/create_school/create_school_bloc.dart';
import 'package:korbil_mobile/pages/auth/bloc/login/login_cubit.dart';
import 'package:korbil_mobile/pages/lessons/views/home/views/inst_home.dart';
import 'package:korbil_mobile/pages/lessons/views/home/views/inst_home_mainbody.dart';
import 'package:korbil_mobile/pages/school/bloc/course/course_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/group_lesson/group_lesson_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/help_bloc/help_topic_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/metadata/metadata_cubit.dart';
import 'package:korbil_mobile/pages/school/bloc/package/package_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/promotion/promotion_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/review/review_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_location/school_location_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/vehicle/vehicle_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/student/student_bloc.dart';
import 'package:korbil_mobile/pages/students/views/add_new_lesson/add_lesson.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/add_new_user_alert.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/all_student_list.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/approve_user_alert.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/student_list.dart';
import 'package:korbil_mobile/pages/students/views/student_profile_approved/views/student_profile_approved.dart';
import 'package:korbil_mobile/pages/students/views/student_profile_unapproved/views/student_profile_unapproved.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final ThemeMode _themeMode = ThemeMode.system;
  final Locale? _locale = AppLocalizations.getStoredLocale();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<SchoolBloc>(
          create: (context) => SchoolBloc(),
        ),
        BlocProvider(
          create: (context) => CreateAccountBloc(),
        ),
        BlocProvider(
          create: (context) => PromotionBloc(),
        ),
        BlocProvider(
          create: (context) => CourseBloc(),
        ),
        BlocProvider(
          create: (context) => HelpTopicBloc(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => StaffBloc(),
        ),
        BlocProvider(
          create: (context) => GroupLessonBloc(),
        ),
        BlocProvider(
          create: (context) => PackageBloc(),
        ),
        BlocProvider(
          create: (context) => ReviewBloc(),
        ),
        BlocProvider(
          create: (context) => SchoolLocationBloc(),
        ),
        BlocProvider(
          create: (context) => VehicleBloc(),
        ),
        BlocProvider(
          create: (context) => CreateSchoolBloc(),
        ),
        BlocProvider(
          create: (context) => MetadataCubit()..getMetadata(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => StudentBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [
          Locale('en'),
          Locale('sv'),
        ],
        theme: ThemeData(brightness: Brightness.light),
        themeMode: _themeMode,
        navigatorKey: rootNavKey,
        // initialRoute: AppRouter.getStarted,
        // home: InstHomeMainBody(showMainCal: true,),
        home: AppHomePage(),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
