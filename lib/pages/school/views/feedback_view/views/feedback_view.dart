import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/school/bloc/metadata/metadata_cubit.dart';
import 'package:korbil_mobile/pages/school/bloc/review/review_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class FeedBackView extends StatefulWidget {
  const FeedBackView({super.key});

  @override
  State<FeedBackView> createState() => _FeedBackViewState();
}

class _FeedBackViewState extends State<FeedBackView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController feedbackController = TextEditingController();
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                'Share your Feedback',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              leading: const InstAppBarBackBtn(),
            ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Thanks for sending us your ideas, issues, or appreciation. ',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "What's your feedback about?",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          selectCategory(),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Leave your Feedback',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Form(
            key: _formKey,
            child: _entryField(),
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
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
                child: BlocBuilder<ReviewBloc, ReviewState>(
                  builder: (context, state) {
                    return state is! ReviewLoaded
                        ? kLoadingWidget(context)
                        : PrimaryBtn(
                            ontap: () {
                              final schoolId = context
                                  .read<StaffBloc>()
                                  .state
                                  .staff!
                                  .staffData
                                  .schoolId;
                              if (_formKey.currentState!.validate()) {
                                final payload = <String, dynamic>{
                                  'studentId': 0,
                                  'schoolId': schoolId,
                                  'date': DateTime.now().toIso8601String(),
                                  'stars': 0, //todo get the stars
                                  'comment': feedbackController.text,
                                };
                                context.read<ReviewBloc>().add(
                                      AddReview(
                                        payload: payload,
                                        schoolId: schoolId,
                                      ),
                                    );
                              }
                            },
                            text: 'Submit',
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
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _entryField() {
    return TextFormField(
      maxLines: null,
      minLines: 6,
      scrollPadding: const EdgeInsets.all(8),
      controller: feedbackController,
      keyboardType: TextInputType.multiline,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: KorbilTheme.of(context).secondaryColor,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: KorbilTheme.of(context).alternate1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: KorbilTheme.of(context).primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: KorbilTheme.of(context).warningColor,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 15,
          right: 10,
          top: 15,
          bottom: 5,
        ),
        hintText: 'Enter Feedback',
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: KorbilTheme.of(context).alternate1,
        ),
      ),
    );
  }

  Widget selectCategory() {
    return BlocBuilder<MetadataCubit, MetadataState>(
      builder: (context, state) {
        return state is! MetadataLoaded
            ? kLoadingWidget(context)
            : Padding(
                padding: const EdgeInsets.all(10),
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButtonFormField<String>(
                    value: selectedCategory,
                    decoration: InputDecoration(
                      label: const Text('Select Feedback Category'),
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: state.feedbackCategories!
                        .map<DropdownMenuItem<String>>((e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                    hint: const Text('Select Feedback Category'),
                    menuMaxHeight: 300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
      },
    );
  }
}
