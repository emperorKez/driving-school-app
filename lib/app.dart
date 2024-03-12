import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:korbil_mobile/localization/app_localization.dart';
import 'package:korbil_mobile/locator.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/school/all_school_bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/views/school_settings/bloc/profile/profile_bloc.dart';
import 'package:korbil_mobile/pages/school/views/school_settings/views/school_setting_view.dart';

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
              SchoolBloc()..add(const GetSchoolInfo(schoolId: 1)),
          lazy: false,
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc()..add(GetProfile()), lazy: false,
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
        home: const SchoolSettingsView(),
        // initialRoute: AppRouter.getStarted,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
