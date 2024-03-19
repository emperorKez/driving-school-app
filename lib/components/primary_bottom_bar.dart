import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/app_home/cubit/tab_view/tab_view_bloc.dart';

typedef TapFunc = void Function(int index);

class PrimaryBottomAppBar extends StatefulWidget {
  const PrimaryBottomAppBar({
    // required this.onTap,
    super.key,
  });

  // final TapFunc onTap;

  @override
  State<PrimaryBottomAppBar> createState() => _PrimaryBottomAppBarState();
}

class _PrimaryBottomAppBarState extends State<PrimaryBottomAppBar> {
  // int _selectedIndex = 0;

  
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey1,
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              index: 0,
              // ontap: (i) {
              //   // widget.onTap(i);
              //   setState(() {
              //     _selectedIndex = i;
              //   });
              // },
              // selected: _selectedIndex,
              icon: 'assets/imgs/ins/global/i_menu/menu_1.png',
              selectedIcon: 'assets/imgs/ins/global/i_menu/menu1_s.png',
            ),
            _NavItem(
              index: 1,
              // ontap: (i) {
              //   // widget.onTap(i);
              //   setState(() {
              //     _selectedIndex = i;
              //   });
              // },
              // selected: _selectedIndex,
              icon: 'assets/imgs/ins/global/i_menu/menu2.png',
              selectedIcon: 'assets/imgs/ins/global/i_menu/menu2_s.png',
            ),
            _NavItem(
              index: 2,
              // ontap: (i) {
              //   // widget.onTap(i);
              //   setState(() {
              //     _selectedIndex = i;
              //   });
              // },
              // selected: _selectedIndex,
              icon: 'assets/imgs/ins/global/i_menu/menu3.png',
              selectedIcon: 'assets/imgs/ins/global/i_menu/menu3_s.png',
            ),
            _NavItem(
              index: 3,
              // ontap: (i) {
              //   // widget.onTap(i);
              //   setState(() {
              //     _selectedIndex = i;
              //   });
              // },
              // selected: _selectedIndex,
              icon: 'assets/imgs/ins/global/i_menu/menu4.png',
              selectedIcon: 'assets/imgs/ins/global/i_menu/menu4_s.png',
            ),
          ],
        ),
      ),
    );
  }
}

class PrimarySideBar extends StatelessWidget {
  const PrimarySideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4, right: 4, top: 50),
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey1,
            blurRadius: 3,
            spreadRadius: 3,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: const Column(
        children: [
          _NavItem(
            index: 0,
            // ontap: (i) {
            //   // widget.onTap(i);
            //   setState(() {
            //     _selectedIndex = i;
            //   });
            // },
            // selected: _selectedIndex,
            icon: 'assets/imgs/ins/global/i_menu/menu_1.png',
            selectedIcon: 'assets/imgs/ins/global/i_menu/menu1_s.png',
          ),
          _NavItem(
            index: 1,
            // ontap: (i) {
            //   // widget.onTap(i);
            //   setState(() {
            //     _selectedIndex = i;
            //   });
            // },
            // selected: _selectedIndex,
            icon: 'assets/imgs/ins/global/i_menu/menu2.png',
            selectedIcon: 'assets/imgs/ins/global/i_menu/menu2_s.png',
          ),
          _NavItem(
            index: 2,
            // ontap: (i) {
            //   // widget.onTap(i);
            //   setState(() {
            //     _selectedIndex = i;
            //   });
            // },
            // selected: _selectedIndex,
            icon: 'assets/imgs/ins/global/i_menu/menu3.png',
            selectedIcon: 'assets/imgs/ins/global/i_menu/menu3_s.png',
          ),
          _NavItem(
            index: 3,
            // ontap: (i) {
            //   // widget.onTap(i);
            //   setState(() {
            //     _selectedIndex = i;
            //   });
            // },
            // selected: _selectedIndex,
            icon: 'assets/imgs/ins/global/i_menu/menu4.png',
            selectedIcon: 'assets/imgs/ins/global/i_menu/menu4_s.png',
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.index,
    required this.icon,
    required this.selectedIcon,
  });

  final int index;
  // final int selected;
  final String icon;
  final String selectedIcon;
  // final TapFunc ontap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabViewBloc, TabViewState>(
      builder: (context, tabState) {
        return GestureDetector(
          onTap: () {
            // ontap(index);
            context.read<TabViewBloc>().add(ChangeTab(index));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: tabState.index == index
                  ? AppColors.green.withOpacity(0.3)
                  : Colors.transparent,
            ),
            child: Image.asset(
              tabState.index == index ? selectedIcon : icon,
              width: 25,
              height: 25,
            ),
          ),
        );
      },
    );
  }
}
