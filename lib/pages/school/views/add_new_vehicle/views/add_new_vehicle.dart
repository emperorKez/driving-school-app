import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/theme/theme.dart';

class AddNewVehicleView extends StatefulWidget {
  const AddNewVehicleView({super.key});

  @override
  State<AddNewVehicleView> createState() => _AddNewVehicleViewState();
}

class _AddNewVehicleViewState extends State<AddNewVehicleView> {
  @override
  Widget build(BuildContext context) {
    // final s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Add Vehicle',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
      ),
      body: _renderAddNewVehicleMobileBody(),
    );
  }

  Container _renderAddNewVehicleMobileBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Add a New Vehicle',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: KorbilTheme.of(context).secondaryColor,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Vehicle Name',
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
          TextFormField(
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
                top: 5,
                bottom: 5,
              ),
              hintText: 'Location Name',
              hintStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: KorbilTheme.of(context).alternate1,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transmission',
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
                    _buildDropDown('Select'),
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
                    Text(
                      'Year',
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
                    _buildDropDown('Select'),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Description',
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
          TextFormField(
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
                top: 5,
                bottom: 5,
              ),
              hintText: 'Description',
              hintStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: KorbilTheme.of(context).alternate1,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Images',
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
          DottedBorder(
            color: KorbilTheme.of(context).alternate1,
            strokeWidth: 2,
            dashPattern: [8],
            padding: const EdgeInsets.all(20),
            strokeCap: StrokeCap.round,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '+ Upload Images',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: KorbilTheme.of(context).secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Current Vehicles',
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: KorbilTheme.of(context).white,
              border: Border.all(color: KorbilTheme.of(context).alternate1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  width: 120,
                  height: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/imgs/ins/school/car.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Toyota Yaris Hybrid',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        KorbilTheme.of(context).secondaryColor,
                                  ),
                                ),
                                Text(
                                  'Transmission : Auto',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        KorbilTheme.of(context).secondaryColor,
                                  ),
                                ),
                                Text(
                                  ' Year : 2018',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        KorbilTheme.of(context).secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Image.asset(
                              'assets/imgs/ins/school/note_add.png',
                              width: 16,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Image.asset(
                              'assets/imgs/ins/school/delete_icon.png',
                              width: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam.',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: KorbilTheme.of(context).secondaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
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
              const Expanded(
                child: PrimaryBtn(
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
          Text(
            'Bergmansgatan 20, 431 30 Mölndal',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: KorbilTheme.of(context).secondaryColor,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.delete_outlined,
              color: KorbilTheme.of(context).secondaryColor,
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
        border: Border.all(color: KorbilTheme.of(context).alternate1),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: Container(),
        iconSize: 25,
        hint: Text(
          hint,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: KorbilTheme.of(context).alternate1,
          ),
        ),
        iconDisabledColor: KorbilTheme.of(context).secondaryColor,
        iconEnabledColor: KorbilTheme.of(context).secondaryColor,
        items: [
          DropdownMenuItem<String>(
            value: 'item1',
            child: Text(
              'Item 1',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: KorbilTheme.of(context).secondaryColor,
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
                color: KorbilTheme.of(context).secondaryColor,
              ),
            ),
          )
        ],
        onChanged: (val) {},
      ),
    );
  }
}

class _SelectedLangCard extends StatelessWidget {
  const _SelectedLangCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: AppColors.grey2,
      ),
      child: Row(
        children: [
          const Text(
            'English',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/imgs/ins/school/bin_green.png',
              width: 20,
            ),
          )
        ],
      ),
    );
  }
}
