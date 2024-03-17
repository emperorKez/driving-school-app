import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:korbil_mobile/localization/app_localization.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/auth/view/create_acc/bloc/create_account_bloc.dart';
import 'package:korbil_mobile/pages/auth/view/create_driving_school/bloc/create_school_bloc.dart';
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
import 'package:korbil_mobile/pages/school/views/add_new_course/views/add_new_course.dart';
import 'package:korbil_mobile/pages/school/views/edit_group_lesson/views/edit_group_lesson.dart';
import 'package:korbil_mobile/pages/school/views/manage_pickup_location/views/manage_pickup_location.dart';

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
        BlocProvider<SchoolBloc>(
          create: (context) => SchoolBloc()..add(GetSchool(schoolId: 1)),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => CreateAccountBloc(),
        ),
        BlocProvider(
          create: (context) => PromotionBloc()..add(GetPromotions(schoolId: 1)),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => CourseBloc()..add(GetCourses(schoolId: 1)),
          lazy: false,
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
        home: ManagePickupLocationView(),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
