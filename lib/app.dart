import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:korbil_mobile/localization/app_localization.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/auth/bloc/auth/auth_bloc.dart';
import 'package:korbil_mobile/pages/auth/bloc/create_account/create_account_bloc.dart';
import 'package:korbil_mobile/pages/auth/bloc/create_school/create_school_bloc.dart';
import 'package:korbil_mobile/pages/lessons/bloc/assessment/assessment_bloc.dart';
import 'package:korbil_mobile/pages/lessons/bloc/calender/calender_cubit.dart';
import 'package:korbil_mobile/pages/lessons/bloc/lesson/lesson_bloc.dart';
import 'package:korbil_mobile/pages/lessons/bloc/lesson_detail/lesson_detail_cubit.dart';
import 'package:korbil_mobile/pages/school/bloc/availability/availabilty_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/course/course_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/group_lesson/group_lesson_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/help_bloc/help_topic_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/metadata/metadata_cubit.dart';
import 'package:korbil_mobile/pages/school/bloc/package/package_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/payment/payment_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/promotion/promotion_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/review/review_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_location/school_location_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/subscription/subscription_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/vehicle/vehicle_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/package_cubit/package_cubit.dart';
import 'package:korbil_mobile/pages/students/bloc/past_lesson_cubit/past_lesson_cubit.dart';
import 'package:korbil_mobile/pages/students/bloc/profile_cubit/profile_cubit.dart';
import 'package:korbil_mobile/pages/students/bloc/search/search_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/student/student_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/upcoming_lesson/upcoming_lesson_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final ThemeMode _themeMode = ThemeMode.system;
  final Locale? _locale = AppLocalizations.getStoredLocale();

  // Future<void> initAmplify() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await AuthRepo().configureAmplify();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // initAmplify();
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(CacheSignin()),
          // lazy: false,
        ),
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
          create: (context) => StudentBloc(),
        ),
        BlocProvider(
          create: (context) => PaymentBloc(),
        ),
        BlocProvider(
          create: (context) => LessonBloc(),
        ),
        BlocProvider(create: (context) => CalenderCubit()),
        BlocProvider(create: (context) => SearchBloc()),
        BlocProvider(
          create: (context) => SubscriptionBloc(),
          //     ..add(GetAllSubscriptionLevels()),
          // lazy: false,
        ),
        BlocProvider(create: (context) => AvailabiltyBloc()),
        BlocProvider(create: (context) => PastLessonCubit()),
        BlocProvider(create: (context) => UpcomingLessonBloc()),
        BlocProvider(create: (context) => LessonDetailCubit()),
        BlocProvider(create: (context) => PackageCubit(),),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => AssessmentBloc()),
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
        initialRoute: AppRouter.appInit,
        // initialRoute: AppRouter.getStarted,
        // home: const ManageSchoolView(),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
