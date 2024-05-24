import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/pages/lessons/bloc/calender/calender_cubit.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstBookedLessons extends StatefulWidget {
  const InstBookedLessons({super.key});

  @override
  State<InstBookedLessons> createState() => _InstBookedLessonsState();
}

class _InstBookedLessonsState extends State<InstBookedLessons> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: KorbilTheme.of(context).primaryBg,
        body: BlocBuilder<CalenderCubit, CalenderState>(
          builder: (context, state) {
            return state is! CalenderLoaded
                ? kLoadingWidget(context)
                : ListView.builder(
                    itemCount: state.calender.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(
                            state.calender[index].title,
                          ),
                          subtitle:
                              Text(state.calender[index].location.address),
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(state.calender[index].scheduledDate,),
                              Text(
                                  state.calender[index].scheduledTime,),
                            ],
                          ),
                        ),);
          },
        ),
      ),
    );
  }
}
