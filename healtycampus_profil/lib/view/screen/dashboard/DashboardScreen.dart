import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthy_campus/utill/images.dart';
import 'package:healthy_campus/view/screen/homepage/homepage_screen.dart';
import 'package:healthy_campus/view/screen/makanan/rekom_makanan.dart';
import 'package:healthy_campus/view/screen/profil/profil_screen.dart';
import 'package:healthy_campus/view/screen/tantangan/tantangan.dart';
import 'package:sizer/sizer.dart';
import 'package:healthy_campus/utill/style.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  bool isSelected = true;

  final List<Map<String, dynamic>> _menu = [
    {'icon': Images.ic_btm_home, 'label': "Beranda"},
    {'icon': Images.ic_btm_tantangan, 'label': "Tantangan"},
    {'icon': Images.ic_btm_makanan, 'label': "Makanan Sehat"},
    {'icon': Images.ic_btm_profile, 'label': "Profil"},
  ];

  final List<Widget> _pages = [
    const BerandaScreen(),
    const Tantangan(),
    const RekomMakanan(),
    const ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        backgroundColor: Colors.transparent,
        color: Theme.of(context).primaryColor,
        buttonBackgroundColor:
            isSelected ? Colors.white : Theme.of(context).primaryColor,
        items: List.generate(_menu.length, (index) {
          setState(() {
            isSelected = _selectedIndex == index;
          });
          return CurvedNavigationBarItem(
            child: SvgPicture.asset(
              _menu[index]['icon'],
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
            ),
            label: _menu[index]['label'],
            labelStyle: openSansMedium.copyWith(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          );
        }),
        onTap: (index) {
          setState(() {
            isSelected = true;
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
