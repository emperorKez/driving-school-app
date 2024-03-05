import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/pages/school/views/school_settings/cubit/tab_menu/tab_menu_bloc.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

import 'main_widget.dart';
import 'selected_tab.dart';

class SchoolSettingsView extends StatelessWidget {
  const SchoolSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabMenuBloc(),
      child: const _SchoolSettingsView(),
    );
  }
}

class _SchoolSettingsView extends StatefulWidget {
  const _SchoolSettingsView({super.key});

  @override
  State<_SchoolSettingsView> createState() => _SchoolSettingsViewState();
}

class _SchoolSettingsViewState extends State<_SchoolSettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: getPreferedOrientation(context) == PreferedOrientation.landscape
            ? const Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: MainWidget(),
                  ),
                  Expanded(
                    flex: 3,
                    child: SelectedTab(),
                  ),
                ],
              )
            : const MainWidget(),
      ),
    );
  }
}
