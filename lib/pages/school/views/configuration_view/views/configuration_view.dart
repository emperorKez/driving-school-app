import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/school/bloc/metadata/metadata_cubit.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/repository/metadata_repo/models/instructor_type.dart';
import 'package:korbil_mobile/repository/metadata_repo/models/language.dart';
import 'package:korbil_mobile/repository/metadata_repo/models/schedule_flow.dart';
import 'package:korbil_mobile/theme/theme.dart';


class ConfigurationView extends StatefulWidget {
  const ConfigurationView({super.key});

  @override
  State<ConfigurationView> createState() => _ConfigurationViewState();
}

class _ConfigurationViewState extends State<ConfigurationView> {
  final List<int> selectedLanguageIds = [];
  int selectedInstructorType = 0;
  int selectedScheduleFlow = 0;

  @override
  void initState() {
    selectedLanguageIds.addAll(
      context.read<SchoolBloc>().state.school!.schoolInfo!.languages ?? [],
    );
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
          if (state is SchoolError){
            errorSnackbar(context, error: state.error);
          }
        },
        child: _renderMobileBody(context),
      ),
    );
  }

  Widget _renderMobileBody(BuildContext context) {
    final availableLanguages =
        context.read<MetadataCubit>().state.languages ?? [];

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
          context.read<MetadataCubit>().state.scheduleFlows ?? [],
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
          context.read<MetadataCubit>().state.instructorTypes ?? [],
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
        _languageSelection(availableLanguages),
        const SizedBox(
          height: 10,
        ),
        for (final element in selectedLanguageIds)
          _selectedLangCard(
            language: availableLanguages[
                availableLanguages.indexWhere((e) => e.id == element)],
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
              child: PrimaryBtn(
                ontap: () {
                  final payload = {
                    'scheduleFlowId': selectedScheduleFlow,
                    'instructorSelectionId': selectedInstructorType,
                    'languageIds': [
                      for (final element in selectedLanguageIds) element,
                    ],
                  };
                  context.read<SchoolBloc>().add(
                        UpdateSchoolConfig(
                          schoolId: context
                              .read<SchoolBloc>()
                              .state
                              .school!
                              .schoolInfo!
                              .id,
                          payload: payload,
                        ),
                      );
                },
                text: 'Add',
                vm: 0,
                hm: 0,
                fontSize: 14,
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
            selectedLanguageIds.add(val as int);
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
            value: e.id,
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
                selectedLanguageIds.remove(language.id);
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
