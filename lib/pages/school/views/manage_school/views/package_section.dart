import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/views/create_new_package/views/create_new_package.dart';
import 'package:korbil_mobile/pages/school/views/manage_school/views/package_card.dart';
import 'package:korbil_mobile/theme/theme.dart';

class PackageSection extends StatelessWidget {
  const PackageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.sizeOf(context);
    return BlocBuilder<SchoolBloc, SchoolState>(
      builder: (context, state) {
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
                  for (final element in state.school!.packages!)
                    Text(element.schoolPackage.title), //todo Package card

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
            if (state is SchoolLoading)
              Center(
                child: CircularProgressIndicator(
                  color: KorbilTheme.of(context).primaryColor,
                ),
              )
            else
              _buildPackagesCarousel(s, context, state),
          ],
        );
      },
    );
  }

  Widget _buildPackagesCarousel(
      Size size, BuildContext context, SchoolState state,) {
    if (state.school!.packages!.isEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: Center(
          child: Text(
            'No packages',
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
      items: state.school!.packages!
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
