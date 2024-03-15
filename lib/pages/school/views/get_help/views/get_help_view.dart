import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/school/bloc/help_bloc/help_topic_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/metadata/metadata_cubit.dart';
import 'package:korbil_mobile/pages/school/views/get_help/views/faq.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class GetHelpView extends StatefulWidget {
  const GetHelpView({super.key});

  @override
  State<GetHelpView> createState() => _GetHelpViewState();
}

class _GetHelpViewState extends State<GetHelpView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final helpTopics= context.read<MetadataCubit>().state.helpTopics ?? [];

    return Scaffold(
      appBar: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                'Get Help',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              leading: const InstAppBarBackBtn(),
            ),
      body: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    for (final element in helpTopics)
                      FaqCard(
                        helpTopic: element,
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Contact Us',
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
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'First Name',
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
                              _entryField(
                                  controller: firstnameController,
                                  hintText: 'Enter First Name',),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Last Name',
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
                              _entryField(
                                  controller: lastnameController,
                                  hintText: 'Enter Last Name',),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Email',
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
                    _entryField(
                        controller: emailController,
                        hintText: 'Enter Your Email',),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Mobile No',
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
                    _entryField(
                        controller: phoneController,
                        hintText: 'Enter your Moble Number',),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Comments',
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
                    _entryWideField(
                      controller: commentController,
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
                                    color:
                                        KorbilTheme.of(context).secondaryColor,
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
                                  //todo contact us payload
                                };
                                context
                                    .read<HelpTopicBloc>()
                                    .add(ContactUs(payload: payload));
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
                ),
              ));
          
       
  }

  Widget _entryField({
    required TextEditingController controller,
    required String hintText,
    TextInputType inputType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: KorbilTheme.of(context).secondaryColor,
      ),
      scrollPadding: const EdgeInsets.all(8),
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
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: KorbilTheme.of(context).alternate1,
        ),
      ),
    );
  }

  Widget _entryWideField({
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      minLines: 5,
      maxLines: null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter your comment';
        }
        return null;
      },
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: KorbilTheme.of(context).secondaryColor,
      ),
      scrollPadding: const EdgeInsets.all(8),
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
        hintText: 'Enter Comment',
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: KorbilTheme.of(context).alternate1,
        ),
      ),
    );
  }
}
