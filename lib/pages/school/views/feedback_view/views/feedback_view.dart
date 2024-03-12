import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/school/views/feedback_view/bloc/feedback_bloc.dart';
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
      body: BlocProvider(
        create: (context) => FeedbackBloc()..add(GetFeedbackCategories()),
        lazy: false,
        child: BlocConsumer<FeedbackBloc, FeedbackState>(
          listener: (context, state) {
            if (state is FeedbackError) {
              //todo show error
            }
          },
          builder: (context, state) {
            // return state is FeedbackLoaded ?
            return ListView(
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
                selectCategory(context, categories: state.feedbackCategories!),
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
                          if (_formKey.currentState!.validate()) {
                            final payload = <String, dynamic>{
                              //todo feed back payload
                            };
                            context
                                .read<FeedbackBloc>()
                                .add(AddFeedback(payload: payload));
                          }
                        },
                        text: 'Submit',
                        vm: 0,
                        hm: 0,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            );
            // : kLoadingWidget(context);
          },
        ),
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
        hintText: 'Text Here',
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: KorbilTheme.of(context).alternate1,
        ),
      ),
    );
  }

  Widget selectCategory(BuildContext context,
      {required List<String> categories,}) {
    final items = List.generate(
      categories.length,
      (index) => {'key': categories[index], 'value': categories[index]},
    );

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField<String>(
          value: selectedCategory,
          decoration: InputDecoration(
            label: const Text('Select Feedback Category'),
            contentPadding: EdgeInsets.zero,
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          items: items.map<DropdownMenuItem<String>>((e) {
            return DropdownMenuItem<String>(
              value: e['value'].toString(),
              child: Text(e['key'].toString()),
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
  }
}
