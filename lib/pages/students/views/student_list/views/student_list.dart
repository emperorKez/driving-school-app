import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/search/search_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/student/student_bloc.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/add_new_user_alert.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/all_student_list.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/approve_user_alert.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/invited_student_list.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/my_student_list.dart';
import 'package:korbil_mobile/repository/student/models/student.dart';
import 'package:korbil_mobile/repository/student/models/student_package.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstStudentListView extends StatefulWidget {
  const InstStudentListView({super.key});

  @override
  State<InstStudentListView> createState() => _InstStudentListViewState();
}

class _InstStudentListViewState extends State<InstStudentListView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  String _selectedType = 'All';

  Future<void> _showApproveUserAlert(
      {required Student student, required StudentPackage studentPackage,}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Dialog Title'),
          content: ApproveUserAlertContent(
            student: student,
            studentPackage: studentPackage,
          ),
        );
      },
    );
  }

  Future<void> _addNewUserAlert() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          // title: Text('Dialog Title'),
          contentPadding: const EdgeInsets.all(10),
          content: const AddNewUserlertContent(),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Student List',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          _appBarAction(context),
        ],
      ),
      body: BlocConsumer<SchoolBloc, SchoolState>(
        listener: (context, state) {
          if (state is SchoolError) {
            errorSnackbar(context, error: state.error);
          }
        },
        builder: (context, state) {
          return state is! SchoolLoaded
              ? kLoadingWidget(context)
              : _renderMobileBody(state);
        },
      ),
    );
  }

  Container _renderMobileBody(SchoolState schoolState) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: KorbilTheme.of(context).white,
              boxShadow: [defaultBoxShadow()],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Form(
              key: _formKey,
              child: BlocConsumer<StudentBloc, StudentState>(
                listener: (context, state) {
                  if (state is StudentError) {
                    errorSnackbar(context, error: state.error);
                  }
                },
                builder: (context, state) {
                  if (state is StudentInitial) {
                    context.read<StudentBloc>().add(
                          GetAllStudent(schoolId: schoolState.schoolInfo!.id),
                        );
                  }
                  return state is! StudentLoaded
                      ? kLoadingWidget(context)
                      : TextFormField(
                          controller: searchController,
                          validator: (value) {
                            return context
                                        .read<SearchBloc>()
                                        .state
                                        .isValidKeyword ==
                                    false
                                ? 'Enter Student name or Email'
                                : null;
                          },
                          onChanged: (value) {
                            context.read<SearchBloc>().add(
                                  KeywordChanged(
                                    keyword: value,
                                    students: state.allStudent!,
                                  ),
                                );
                          },
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: KorbilTheme.of(context).secondaryColor,
                          ),
                          scrollPadding: const EdgeInsets.all(8),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                              left: 15,
                              right: 10,
                              top: 15,
                              bottom: 15,
                            ),
                            hintText: 'Search students',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: KorbilTheme.of(context).alternate1,
                            ),
                            prefixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/imgs/ins/school/search.png',
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          _searchResult(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTypeCard('All'),
              _buildTypeCard('My Students', flex: 2),
              _buildTypeCard('Invited Students', flex: 2),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          _buildList(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    if (_selectedType == 'My Students') {
      return const MyStudentsList();
    } else if (_selectedType == 'Invited Students') {
      return const InvitedStudentList();
    } else {
      return AllStudentsList(
        onApprove: _showApproveUserAlert,
      );
    }
  }

  Widget _buildTypeCard(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedType = text;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color:
                      _selectedType == text ? AppColors.green : AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              if (_selectedType == text)
                const Divider(
                  height: 3,
                  thickness: 3,
                  color: AppColors.green,
                )
              else
                Container(
                  height: 3,
                  width: 10,
                  color: Colors.transparent,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBarAction(BuildContext context) {
    return GestureDetector(
      onTap: _addNewUserAlert,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: KorbilTheme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            '+ New Student',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchResult() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return kLoadingWidget(context);
        } else if (state is SearchLoaded) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: state.searchResult!.pendingApproval.isEmpty
                    ? const SizedBox()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                            state.searchResult!.pendingApproval.length,
                            (index) => ListTile(
                                  leading: Image.network(
                                    state.searchResult!.pendingApproval[index]
                                        .avatar,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/imgs/ins/lessons/avatar3.png',
                                      );
                                    },
                                  ),
                                  title: Text(
                                    '${state.searchResult!.pendingApproval[index].firstName} ${state.searchResult!.pendingApproval[index].lastName}',
                                  ),
                                  subtitle: Text(
                                    state.searchResult!.pendingApproval[index]
                                        .packageName,
                                  ),
                                ),),
                      ),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
