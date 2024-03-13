import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:korbil_mobile/localization/app_localization.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/auth/view/create_acc/bloc/create_account_bloc.dart';
import 'package:korbil_mobile/pages/auth/view/create_driving_school/bloc/create_school_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/views/get_help/bloc/help_topic_bloc.dart';
import 'package:korbil_mobile/pages/school/views/manage_course/bloc/course_bloc.dart';
import 'package:korbil_mobile/pages/school/views/manage_promotions/bloc/promotion_bloc.dart';
import 'package:korbil_mobile/pages/school/views/school_settings/bloc/profile/profile_bloc.dart';
import 'package:korbil_mobile/pages/school/views/settings/bloc/bloc/settings_bloc.dart';

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
          create: (context) =>
              SchoolBloc()..add(const GetDrivingSchool(schoolId: 1)),
          lazy: false,
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc()..add(GetProfile()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => CreateAccountBloc()..add(GetMetadata()),
          lazy: false,
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
          create: (context) => HelpTopicBloc()..add(GetAllHelpTopic()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => SettingsBloc()..add(GetAllLanguage()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => CreateSchoolBloc(),
        )
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
        initialRoute: AppRouter.getStarted,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
