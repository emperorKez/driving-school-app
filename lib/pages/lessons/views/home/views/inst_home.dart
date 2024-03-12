import 'package:flutter/material.dart';
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
  bool _showMainCalendar = true;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: getPreferedOrientation(context) == PreferedOrientation.landscape
            ? _buildLandscape(s)
            : _buildPortrait(s),
      ),
    );
  }

  Widget _buildLandscape(Size s) {
    return ListView(
      children: [
        InstHomeMainBody(
          showMainCal: _showMainCalendar,
        ),
        const HomeSlideUpPanel(),
      ],
    );
  }

  SlidingUpPanel _buildPortrait(Size s) {
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
