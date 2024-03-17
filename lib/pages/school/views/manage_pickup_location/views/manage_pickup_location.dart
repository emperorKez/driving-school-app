import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/school/bloc/school_location/school_location_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';

class ManagePickupLocationView extends StatefulWidget {
  const ManagePickupLocationView({super.key});

  @override
  State<ManagePickupLocationView> createState() =>
      _ManagePickupLocationViewState();
}

class _ManagePickupLocationViewState extends State<ManagePickupLocationView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Add Pick Up Locations',
          style: TextStyle(
            fontFamily: 'Lato',
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
      ),
      body: BlocListener<SchoolLocationBloc, SchoolLocationState>(
        listener: (context, state) {
          if (state is SchoolLocationError) {
            errorSnackbar(context, error: state.error);
          }
        },
        child: _renderAddNewLocationMobileBody(),
      ),
    );
  }

  Widget _renderAddNewLocationMobileBody() {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Add a New Location',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Location Name',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _entryField(controller: nameController, hintText: 'Location Name'),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Address',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _entryField(
              controller: addressController,
              hintText: 'Enter Location Address'),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'City',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // _buildDropDown('Select City'),
                    _entryField(
                        controller: cityController, hintText: 'Enter City'),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Postal Code',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _entryField(
                        controller: postalCodeController,
                        hintText: 'Enter Postal code',
                        inputType: TextInputType.number),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Set Location',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _entryField(
              controller: searchController,
              hintText: 'Search Location',
              suffixIcon: GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Image.asset(
                    'assets/imgs/ins/school/loc_icon.png',
                    width: 24,
                  ),
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Predefined Locations',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          // BlocBuilder<SchoolLocationBloc, SchoolLocationState>(builder: (context, state){
          //   if (state is SchoolLocationLoaded) {
          //     return state.schoolLocations!.isEmpty? SizedBox(): Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: List.generate(state.schoolLocations!.length, (index) => _buildPredefinedLocation(true)),
          //     );
              
          //   }else{ return kLoadingWidget(context);}

          // }),
          _buildPredefinedLocation(false),
          _buildPredefinedLocation(true),
          _buildPredefinedLocation(true),
          _buildPredefinedLocation(true),
          const SizedBox(
            height: 45,
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
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: AppColors.black,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Close',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColors.black,
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
                child: BlocBuilder<SchoolLocationBloc, SchoolLocationState>(
                  builder: (context, state) {
                    return PrimaryBtn(
                      ontap: () {
                        final schoolId = context
                            .read<StaffBloc>()
                            .state
                            .staff!
                            .staffData
                            .schoolId;
                        if (_formKey.currentState!.validate()) {
                          final payload = {
                            'name': nameController.text,
                            'address': addressController.text,
                            'city': cityController.text,
                            'postalCode': postalCodeController.text,
                            'locationType': 0,
                            'landmark': 'string',
                            'schoolId': schoolId
                          };

                          context.read<SchoolLocationBloc>().add(AddLocation(
                              payload: payload, schoolId: schoolId));
                        }
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
      ),
    );
  }

  Container _buildPredefinedLocation(bool selected) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: selected
                ? Image.asset(
                    'assets/imgs/ins/school/tick_on.png',
                    width: 16,
                  )
                : Image.asset(
                    'assets/imgs/ins/school/tick_off.png',
                    width: 16,
                  ),
          ),
          const Text(
            'Bergmansgatan 20, 431 30 Mölndal',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(
              Icons.delete_outlined,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDropDown(String hint) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey1),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: Container(),
        iconSize: 25,
        hint: Text(
          hint,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey1,
          ),
        ),
        iconDisabledColor: AppColors.black,
        iconEnabledColor: AppColors.black,
        items: const [
          DropdownMenuItem<String>(
            value: 'item1',
            child: Text(
              'Item 1',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
          ),
          DropdownMenuItem<String>(
            value: 'item2',
            child: Text(
              'Item 2',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
          ),
        ],
        onChanged: (val) {},
      ),
    );
  }

  Widget _entryField({
    required TextEditingController controller,
    required String hintText,
    TextInputType inputType = TextInputType.text,
    bool isMultiline = false,
    Widget? suffixIcon,
    void Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      minLines: isMultiline ? 6 : null,
      maxLines: isMultiline ? null : 1,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter $hintText';
        }
        return null;
      },
      onChanged: onChanged,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 48,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.grey1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.green,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.red,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 15,
          right: 10,
          top: 5,
          bottom: 5,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.grey1,
        ),
      ),
    );
  }
}
