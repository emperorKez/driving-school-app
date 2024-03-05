import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/theme/theme.dart';

class ProfilePackageHistory extends StatefulWidget {
  const ProfilePackageHistory({super.key});

  @override
  State<ProfilePackageHistory> createState() => _ProfilePackageHistoryState();
}

class _ProfilePackageHistoryState extends State<ProfilePackageHistory> {
  Future<void> _showRecieptDialog() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          // title: Text('Dialog Title'),
          content: _AddNewUserlertContent(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Package History',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
      ),
      body: CustomScreenPadding(
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            _PackageHistoryCard(
              ontap: _showRecieptDialog,
            ),
            _PackageHistoryCard(
              ontap: _showRecieptDialog,
            ),
            _PackageHistoryCard(
              ontap: _showRecieptDialog,
            ),
          ],
        ),
      ),
    );
  }
}

class _AddNewUserlertContent extends StatelessWidget {
  const _AddNewUserlertContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Proof of payment',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: KorbilTheme.of(context).secondaryColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 12,
            ),
            child: Column(
              children: [
                Text(
                  '90 Min Traffic Light Drive',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).secondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    '€ 259.00',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Payment date ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '2022 June 10',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Status : ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Completed',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Image.asset(
                      'assets/imgs/ins/profile/verified_tick.png',
                      width: 18,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/imgs/ins/profile/download_reciept_green.png',
                      width: 18,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Download',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          PrimaryBtn(
            text: 'Done',
            ontap: () {
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<dynamic>(
              //     builder: (cxt) => const CreateDrivingSchoolView(),
              //   ),
              // );
            },
            vm: 10,
            hm: 0,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}

class _PackageHistoryCard extends StatelessWidget {
  const _PackageHistoryCard({
    required this.ontap,
    super.key,
  });

  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: KorbilTheme.of(context).white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [defaultBoxShadow()],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 35,
            child: Center(
              child: Image.asset(
                'assets/imgs/ins/profile/10hr.png',
                width: 28,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '10Hrs Package',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Text(
            '2022 June 10',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              ontap();
            },
            child: Image.asset(
              'assets/imgs/ins/profile/tasks.png',
              width: 24,
            ),
          )
        ],
      ),
    );
  }
}
