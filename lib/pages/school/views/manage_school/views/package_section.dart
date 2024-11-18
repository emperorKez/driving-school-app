import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/school/bloc/package/package_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/views/create_new_package/views/create_new_package.dart';
import 'package:korbil_mobile/pages/school/views/manage_school/views/package_card.dart';
import 'package:korbil_mobile/theme/theme.dart';

class PackageSection extends StatelessWidget {
  const PackageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.sizeOf(context);
    return BlocBuilder<PackageBloc, PackageState>(
      builder: (context, state) {
        if (state is PackageInitial) {
          context.read<PackageBloc>().add(GetPackages(
              schoolId: context.read<SchoolBloc>().state.schoolInfo!.id,),);
        }
        if (state is! PackageLoaded) {
          return kLoadingWidget(context);
        } else {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Packages',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    PrimaryBtn(
                      text: '+ Add New Package',
                      fontSize: 14,
                      vm: 0,
                      hm: 0,
                      pvm: 8,
                      phm: 10,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (ctx) => const InstCreateNewPackageView(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
                _buildPackagesCarousel(s, context, state),
            ],
          );
        }
      },
    );
  }

  Widget _buildPackagesCarousel(
    Size size,
    BuildContext context,
    PackageState state,
  ) {
    if (state.packages == null || state.packages!.isEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: Center(
          child: Text(
            'You do not have any package',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }
    return CarouselSlider(
      items: state.packages!
          .map((p) => PackageCard(size: size, package: p))
          .toList(),
      options: CarouselOptions(
        height: size.height * 0.5,
        initialPage: 1,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        clipBehavior: Clip.antiAlias,
      ),
    );
  }
}
