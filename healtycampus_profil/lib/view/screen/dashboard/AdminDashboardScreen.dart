import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'package:healthy_campus/utill/images.dart';
import 'package:healthy_campus/utill/style.dart';

// Import screen admin
import 'package:healthy_campus/view/screen/admin/admin_beranda_screen.dart';
import 'package:healthy_campus/view/screen/admin/data_pengguna_screen.dart';
import 'package:healthy_campus/view/screen/admin/data_makanan_screen.dart';
import 'package:healthy_campus/view/screen/admin/data_artikel_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _adminMenu = [
    {'icon': Images.ic_btm_home_admin, 'label': "Beranda"},
    {'icon': Images.ic_btm_users_admin, 'label': "Pengguna"},
    {'icon': Images.ic_btm_article_admin, 'label': "Artikel"},
    {'icon': Images.ic_btm_food_admin, 'label': "Makanan"},
  ];

  final List<Widget> _adminPages = [
    const AdminBerandaScreen(),
    const DataPenggunaScreen(),
    const DataArtikelScreen(),
    const DataMakananScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _adminPages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        backgroundColor: Colors.transparent,
        color: const Color(0xFF5C8858),
        buttonBackgroundColor: Colors.white,
        items: List.generate(_adminMenu.length, (index) {
          final isSelected = _selectedIndex == index;
          return CurvedNavigationBarItem(
            child: Padding(
              padding: const EdgeInsets.all(4.0), // ✅ Tambahkan padding
              child: SvgPicture.asset(
                _adminMenu[index]['icon'],
                height: isSelected
                    ? 22.sp
                    : 20.sp, // ✅ Ukuran lebih kecil dan proporsional
                color: isSelected ? const Color(0xFF5C8858) : Colors.white,
                placeholderBuilder: (context) => const Icon(Icons.error),
              ),
            ),
            label: _adminMenu[index]['label'],
            labelStyle: openSansMedium.copyWith(
              fontSize: 10.sp,
              color: Colors.white,
            ),
          );
        }),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
