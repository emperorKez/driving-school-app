import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/school/bloc/metadata/metadata_cubit.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/vehicle/vehicle_bloc.dart';
import 'package:korbil_mobile/repository/storage/storage_repo.dart';
import 'package:korbil_mobile/theme/theme.dart';

enum SelectionType { transmissionType, year }

class AddNewVehicleView extends StatefulWidget {
  const AddNewVehicleView({super.key});

  @override
  State<AddNewVehicleView> createState() => _AddNewVehicleViewState();
}

class _AddNewVehicleViewState extends State<AddNewVehicleView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<File> imageFiles = [];
  String selectedTransmissionType = 'AUTO';
  int selectedYear = 2015;

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
      body: BlocConsumer<VehicleBloc, VehicleState>(
        listener: (context, state) {
          if (state is VehicleError) {
            errorSnackbar(context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is VehicleInitial) {
            context.read<VehicleBloc>().add(
                  GetVehicles(
                    schoolId: context.read<SchoolBloc>().state.schoolInfo!.id,
                  ),
                );
          }
          if (state is! VehicleLoaded) {
            return kLoadingWidget(context);
          } else {
            return _renderAddNewVehicleMobileBody();
          }
        },
      ),
    );
  }

  Container _renderAddNewVehicleMobileBody() {
    final schoolId = context.read<StaffBloc>().state.staff!.staffData.schoolId;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: ListView(
        shrinkWrap: true,
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
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                _entryField(
                  hintText: 'Vehicle Name',
                  controller: nameController,
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
                          _selectTransmissionType(),
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
                          _selectYear(),
                        ],
                      ),
                    ),
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
                _entryField(
                  hintText: 'Description',
                  controller: descriptionController,
                ),
              ],
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
          _uploadVehicleImages(),
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
          _showCurrentVehicles(),
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
                child: BlocBuilder<VehicleBloc, VehicleState>(
                  builder: (context, state) {
                    return state is! VehicleLoaded
                        ? kLoadingWidget(context)
                        : PrimaryBtn(
                            ontap: () async {
                              if (_formKey.currentState!.validate()) {
                                if (imageFiles.isEmpty) {
                                  errorSnackbar(
                                    context,
                                    error: 'Add vehicle Images',
                                  );
                                } else {
                                  context.read<VehicleBloc>().add(
                                        AddVehicle(
                                          payload: await getPayload(),
                                          schoolId: schoolId,
                                        ),
                                      );
                                  imageFiles.clear();
                                  nameController.clear();
                                  descriptionController.clear();
                                }
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

  Future<Map<String, Object>> getPayload() async {
    final schoolId = context.read<SchoolBloc>().state.schoolInfo!.id;
    return {
      'name': nameController.text,
      'description': descriptionController.text,
      'transmission': selectedTransmissionType,
      'year': selectedYear.toString(),
      'schoolId': schoolId,
      'images': [
        for (final element in imageFiles)
          {
            'imageKey':
                (await StorageRepo().uploadDocument(element.path)).data!.key,
          },
      ],
    };
  }

  Widget _entryField({
    required String hintText,
    required TextEditingController controller,
    bool isMultiLine = false,
    TextInputType inputType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      minLines: isMultiLine ? 6 : null,
      maxLines: isMultiLine ? null : 1,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter $hintText';
        }
        return null;
      },
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

  // Container _buildPredefinedLocation(bool selected) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 7),
  //     child: Row(
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 10),
  //           child: selected
  //               ? Image.asset(
  //                   'assets/imgs/ins/school/tick_on.png',
  //                   width: 16,
  //                 )
  //               : Image.asset(
  //                   'assets/imgs/ins/school/tick_off.png',
  //                   width: 16,
  //                 ),
  //         ),
  //         Text(
  //           'Bergmansgatan 20, 431 30 Mölndal',
  //           style: TextStyle(
  //             fontFamily: 'Poppins',
  //             fontSize: 12,
  //             fontWeight: FontWeight.w400,
  //             color: KorbilTheme.of(context).secondaryColor,
  //           ),
  //         ),
  //         const Spacer(),
  //         Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 10),
  //           child: Icon(
  //             Icons.delete_outlined,
  //             color: KorbilTheme.of(context).secondaryColor,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _selectTransmissionType() {
    
    return BlocBuilder<MetadataCubit, MetadataState>(
      builder: (context, state) {
        if(state is! MetadataLoaded ){return kLoadingWidget(context);} else{
final transmissionTypes = state.transmisionTypes ?? [];
    final items = List.generate(
      transmissionTypes.length,
      (index) =>
          {'key': transmissionTypes[index], 'value': transmissionTypes[index]},
    );
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
            value: selectedTransmissionType,
            iconSize: 25,
            hint: Text(
              'Select Transmission',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: KorbilTheme.of(context).alternate1,
              ),
            ),
            iconDisabledColor: KorbilTheme.of(context).secondaryColor,
            iconEnabledColor: KorbilTheme.of(context).secondaryColor,
            items: items.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem<String>(
                value: e['value'],
                child: Text(e['key']!),
              );
            }).toList(),
            onChanged: (val) {
              setState(() {
                selectedTransmissionType = val!;
              });
            },
          ),
        );}
      },
    );
  }

  Widget _selectYear() {
    final items = List.generate(
      14,
      (index) => {'key': 2010 + index, 'value': 2010 + index},
    );
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: KorbilTheme.of(context).alternate1),
      ),
      child: DropdownButton<int>(
        isExpanded: true,
        underline: Container(),
        value: selectedYear,
        iconSize: 25,
        hint: Text(
          'Select Year',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: KorbilTheme.of(context).alternate1,
          ),
        ),
        iconDisabledColor: KorbilTheme.of(context).secondaryColor,
        iconEnabledColor: KorbilTheme.of(context).secondaryColor,
        items: items.map<DropdownMenuItem<int>>((e) {
          return DropdownMenuItem<int>(
            value: e['value'],
            child: Text('${e['key']!}'),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            selectedYear = val!;
          });
        },
      ),
    );
  }

  Widget _uploadVehicleImages() {
    return Column(
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            imageFiles.length,
            (index) => SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(
                    imageFiles[index],
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          imageFiles.removeAt(index);
                        });
                      },
                      child: Icon(
                        Icons.delete,
                        size: 24,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        DottedBorder(
          color: KorbilTheme.of(context).alternate1,
          strokeWidth: 2,
          dashPattern: const [8],
          padding: const EdgeInsets.all(20),
          strokeCap: StrokeCap.round,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () async {
                    final pickedFiles = await pickVehicleImages() ?? [];
                    setState(() {
                      imageFiles.addAll(pickedFiles);
                    });
                  },
                  child: Text(
                    '+ Upload Images',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: KorbilTheme.of(context).secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<List<File>?> pickVehicleImages() async {
    final result = await FilePicker.platform.pickFiles(
      withReadStream: true,
      allowMultiple: true,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
      type: FileType.custom,
    );
    if (result != null) {
      final files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      // User canceled the picker
      return null;
    }
  }

  Widget _showCurrentVehicles() {
    final schoolId = context.read<SchoolBloc>().state.schoolInfo!.id;
    return BlocBuilder<VehicleBloc, VehicleState>(
      builder: (context, state) {
        if (state is! VehicleLoaded) {
          return kLoadingWidget(context);
        } else {
          return state.vehicles!.isEmpty
              ? const Center(
                  child: Text('You do not have any vehicle currently'),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.vehicles!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: KorbilTheme.of(context).white,
                        border: Border.all(
                          color: KorbilTheme.of(context).alternate1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 120,
                            height: 80,
                            // child: imageFiles.isEmpty ? null : Image.file(imageFiles[0]),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  '${state.vehicles![index].images[0]}',
                                ),
                                fit: BoxFit.cover,
                                onError: (exception, stackTrace) {
                                  const AssetImage(
                                    'assets/imgs/ins/school/car.png',
                                  );
                                },
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.vehicles![index].name,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: KorbilTheme.of(context)
                                                  .secondaryColor,
                                            ),
                                          ),
                                          Text(
                                            'Transmission : ${state.vehicles![index].transmission}',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: KorbilTheme.of(context)
                                                  .secondaryColor,
                                            ),
                                          ),
                                          Text(
                                            ' Year : ${state.vehicles![index].year}',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: KorbilTheme.of(context)
                                                  .secondaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        //todo Navigate to Edit vehicle page
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 2,
                                        ),
                                        child: Image.asset(
                                          'assets/imgs/ins/school/note_add.png',
                                          width: 16,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          context.read<VehicleBloc>().add(
                                                DeleteVehicle(
                                                  schoolId: schoolId,
                                                  vehicleId:
                                                      state.vehicles![index].id,
                                                ),
                                              ),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 2,
                                        ),
                                        child: Image.asset(
                                          'assets/imgs/ins/school/delete_icon.png',
                                          width: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  state.vehicles![index].description,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        KorbilTheme.of(context).secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
        }
      },
    );
  }
}

// class _SelectedLangCard extends StatelessWidget {
//   const _SelectedLangCard();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 4),
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(3),
//         color: AppColors.grey2,
//       ),
//       child: Row(
//         children: [
//           const Text(
//             'English',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//               color: AppColors.black,
//             ),
//           ),
//           const Spacer(),
//           GestureDetector(
//             onTap: () {},
//             child: Image.asset(
//               'assets/imgs/ins/school/bin_green.png',
//               width: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
