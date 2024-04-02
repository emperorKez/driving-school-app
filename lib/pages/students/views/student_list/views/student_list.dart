import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/students/bloc/search/search_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/student/student_bloc.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/add_new_user_alert.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/all_student_list.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/approve_user_alert.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/invited_student_list.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/my_student_list.dart';
import 'package:korbil_mobile/repository/student/models/student.dart';
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

  Future<void> _showApproveUserAlert(Student student) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Dialog Title'),
          content: ApproveUserAlertContent(
            student: student,
          ),
        );
      },
    );
  }

  Future<void> _addNewUserAlert() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          // title: Text('Dialog Title'),
          content: AddNewUserlertContent(),
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
      body: BlocProvider(
        create: (context) => SearchBloc(),
        child: _renderMobileBody(),
      ),
    );
  }

  Container _renderMobileBody() {
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
              child: BlocBuilder<StudentBloc, StudentState>(
                builder: (context, state) {
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
                            context.read<SearchBloc>().add(KeywordChanged(
                                keyword: value, students: state.studentList!,),);
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
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: state.searchResult!.isEmpty
                ? const Center(
                    child: Text('No Student Found!'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: state.searchResult!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(
                          state.searchResult![index].student.profile.avatar,
                        ),
                        title: Text(
                          '${state.searchResult![index].student.profile.firstName} ${state.searchResult![index].student.profile.lastName}',
                        ),
                        subtitle: Text(
                            state.searchResult![index].student.profile.email,),
                      );
                    },
                  ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
