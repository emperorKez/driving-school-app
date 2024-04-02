import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/lessons/bloc/cubit/calender_cubit.dart';
import 'package:korbil_mobile/pages/lessons/views/home/views/inst_home_mainbody.dart';
import 'package:korbil_mobile/pages/lessons/views/home/views/slide_up_panel.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LessonsHomeView extends StatefulWidget {
  const LessonsHomeView({super.key});

  @override
  State<LessonsHomeView> createState() => _InstHomeState();
}

class _InstHomeState extends State<LessonsHomeView> {
  bool _showMainCalendar = false;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: BlocConsumer<CalenderCubit, CalenderState>(
        listener: (context, state) {
          if (state is CalenderError) {
            errorSnackbar(context, error: state.error);
          }
        },
        builder: (context, state) {
          // if (state is! CalenderLoaded) {
          //   return kLoadingWidget(context);
          // } else {
          return getPreferedOrientation(context) ==
                  PreferedOrientation.landscape
              ? _buildLandscape(s: s, state: state)
              : _buildPortrait(s: s, state: state);
          // }
        },
      )),
    );
  }

  Widget _buildLandscape({required Size s, required CalenderState state}) {
    return ListView(
      children: [
        InstHomeMainBody(
          showMainCal: _showMainCalendar,
        ),
        const HomeSlideUpPanel(),
      ],
    );
  }

  SlidingUpPanel _buildPortrait(
      {required Size s, required CalenderState state}) {
    return SlidingUpPanel(
      onPanelOpened: () {
        setState(() {
          _showMainCalendar = false;
        });
      },
      onPanelClosed: () {
        setState(() {
          _showMainCalendar = true;
        });
      },
      maxHeight: s.height * 0.62,
      minHeight: s.height * 0.15,
      parallaxEnabled: true,
      parallaxOffset: 0.55,
      panelBuilder: (sctrl) => HomeSlideUpPanel(
        scrollController: sctrl,
      ),
      body: InstHomeMainBody(
        showMainCal: _showMainCalendar,
      ),
    );
  }
}
