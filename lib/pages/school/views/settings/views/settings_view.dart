import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class InstAppSettingsView extends StatefulWidget {
  const InstAppSettingsView({super.key});

  @override
  State<InstAppSettingsView> createState() => _InstAppSettingsViewState();
}

class _InstAppSettingsViewState extends State<InstAppSettingsView> {
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
                'Settings',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              leading: const InstAppBarBackBtn(),
            ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
          shrinkWrap: true,
          children: [
            _buildItem(
              'assets/imgs/ins/school/simple_bell.png',
              'Notifications',
              Switch(
                value: true,
                onChanged: (val) {},
                activeColor: KorbilTheme.of(context).primaryColor,
              ),
            ),
            _buildItem(
              'assets/imgs/ins/school/person_lang.png',
              'Application Language ',
              Text(
                'English',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).alternate1,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: s.height * 0.65,
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
      ),
    );
  }

  Container _buildItem(String icon, String text, Widget? action) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              right: 20,
            ),
            child: Image.asset(
              icon,
              width: 18,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Container(padding: const EdgeInsets.only(left: 15), child: action),
        ],
      ),
    );
  }
}
