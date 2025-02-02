import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/school/bloc/metadata/metadata_cubit.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/repository/metadata/models/instructor_type.dart';
import 'package:korbil_mobile/repository/metadata/models/language.dart';
import 'package:korbil_mobile/repository/metadata/models/schedule_flow.dart';
import 'package:korbil_mobile/theme/theme.dart';

class ConfigurationView extends StatefulWidget {
  const ConfigurationView({super.key});

  @override
  State<ConfigurationView> createState() => _ConfigurationViewState();
}

class _ConfigurationViewState extends State<ConfigurationView> {
  List<int> selectedLanguages = [1];
  int selectedInstructorType = 1;
  int selectedScheduleFlow = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Configurations',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
      ),
      body: BlocListener<SchoolBloc, SchoolState>(
        listener: (context, state) {
          if (state is SchoolLoaded) {
            Navigator.pop(context);
          }
          if (state is SchoolError) {
            errorSnackbar(context, error: state.error);
          }
        },
        child: BlocBuilder<MetadataCubit, MetadataState>(
          builder: (context, state) {
            return state is! MetadataLoaded
                ? kLoadingWidget(context)
                : _renderMobileBody(context, state);
          },
        ),
      ),
    );
  }

  Widget _renderMobileBody(BuildContext context, MetadataState state) {
    // final availableLanguages =
    //     context.read<MetadataCubit>().state.languages ?? [];

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          'Schedule flow',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KorbilTheme.of(context).secondaryColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _selectScheduleflow(
          state.scheduleFlows!,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Instructor selection',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KorbilTheme.of(context).secondaryColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _instructorSelection(
          state.instructorTypes!,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Add /modify driving school languages',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KorbilTheme.of(context).secondaryColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _languageSelection(state.languages!),
        const SizedBox(
          height: 10,
        ),
        for (final element in selectedLanguages)
          _selectedLangCard(
            language: state.languages![
                state.languages!.indexWhere((e) => e.id == element)],
          ),
        const SizedBox(
          height: 60,
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  decoration: BoxDecoration(
                    color: KorbilTheme.of(context).white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: KorbilTheme.of(context).secondaryColor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Close',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: BlocBuilder<SchoolBloc, SchoolState>(
                builder: (context, state) {
                  return state is! SchoolLoaded
                      ? kLoadingWidget(context)
                      : PrimaryBtn(
                          ontap: () {
                            final payload = {
                              'scheduleFlowId': selectedScheduleFlow,
                              'instructorSelectionId': selectedInstructorType,
                              'languageIds': [
                                for (final element in selectedLanguages)
                                  element,
                              ],
                            };
                            context.read<SchoolBloc>().add(
                                  UpdateSchoolConfig(
                                    schoolId: context
                                        .read<StaffBloc>()
                                        .state
                                        .staff!
                                        .staffData
                                        .schoolId,
                                    payload: payload,
                                  ),
                                );
                          },
                          text: 'Add',
                          vm: 0,
                          hm: 0,
                          fontSize: 14,
                        );
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Container _selectScheduleflow(List<ScheduleFlow> scheduleFlows) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: KorbilTheme.of(context).alternate1),
      ),
      child: DropdownButton<dynamic>(
        isExpanded: true,
        underline: Container(),
        value: selectedScheduleFlow,
        iconSize: 25,
        hint: Text(
          'Select the Schedule flow',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: KorbilTheme.of(context).secondaryColor,
          ),
        ),
        iconDisabledColor: KorbilTheme.of(context).secondaryColor,
        iconEnabledColor: KorbilTheme.of(context).secondaryColor,
        items: scheduleFlows.map<DropdownMenuItem<dynamic>>((e) {
          return DropdownMenuItem<dynamic>(
            value: e.id,
            child: Text(e.name),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            selectedScheduleFlow = val as int;
          });
        },
      ),
    );
  }

  Container _languageSelection(List<Language> languages) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: KorbilTheme.of(context).alternate1),
      ),
      child: DropdownButton<dynamic>(
        isExpanded: true,
        underline: Container(),
        value: selectedLanguages.last,
        iconSize: 25,
        hint: Text(
          'Add languages',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: KorbilTheme.of(context).secondaryColor,
          ),
        ),
        iconDisabledColor: KorbilTheme.of(context).secondaryColor,
        iconEnabledColor: KorbilTheme.of(context).secondaryColor,
        items: languages.map<DropdownMenuItem<dynamic>>((e) {
          return DropdownMenuItem<dynamic>(
            value: e.id,
            child: Text(e.name),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            selectedLanguages.add(val as int);
          });
        },
      ),
    );
  }

  Container _instructorSelection(List<InstructorType> instructorTypes) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: KorbilTheme.of(context).alternate1),
      ),
      child: DropdownButton<dynamic>(
        isExpanded: true,
        underline: Container(),
        value: selectedInstructorType,
        iconSize: 25,
        hint: Text(
          'Select the Instructor selection',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: KorbilTheme.of(context).secondaryColor,
          ),
        ),
        iconDisabledColor: KorbilTheme.of(context).secondaryColor,
        iconEnabledColor: KorbilTheme.of(context).secondaryColor,
        items: instructorTypes.map<DropdownMenuItem<dynamic>>((e) {
          return DropdownMenuItem<dynamic>(
            value: e.value,
            child: Text(e.name),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            selectedInstructorType = val as int;
          });
        },
      ),
    );
  }

  Widget _selectedLangCard({required Language language}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: KorbilTheme.of(context).alternate2,
      ),
      child: Row(
        children: [
          Text(
            language.name,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: KorbilTheme.of(context).secondaryColor,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedLanguages.remove(language.id);
              });
            },
            child: Image.asset(
              'assets/imgs/ins/school/bin_green.png',
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}
