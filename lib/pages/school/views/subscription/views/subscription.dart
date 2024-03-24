import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/subscription/subscription_bloc.dart';
import 'package:korbil_mobile/pages/school/views/subscription/views/package_card.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class SubscriptionView extends StatefulWidget {
  const SubscriptionView({super.key});

  @override
  State<SubscriptionView> createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                'Subscription',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              leading: const InstAppBarBackBtn(),
            ),
      body: _renderMobileBody(s),
    );
  }

  Widget _renderMobileBody(Size s) {
    return BlocBuilder<SubscriptionBloc, SubscriptionState>(
      builder: (context, state) {
        return ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            if (state is SchoolLoaded)
              CarouselSlider(
                items: List.generate(
                  state.subscriptionLevels!.length,
                  (index) => PackageCard(
                    s: s,
                    subscriptionLevel: state.subscriptionLevels![index],
                  ),
                ),
                options: CarouselOptions(
                  height: s.height * 0.5,
                  initialPage: 1,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  clipBehavior: Clip.antiAlias,
                ),
              )
            else
              kLoadingWidget(context),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Text(
                    'If you need for more details',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Email Us',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'infor@körbil.com',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
