import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthy_campus/utill/images.dart';
import 'package:healthy_campus/utill/style.dart';
import 'package:sizer/sizer.dart';

// Import screen admin Anda
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
    {
      'icon': Images.ic_btm_users,
      'label': "Pengguna"
    }, // Pastikan ada di images.dart
    {
      'icon': Images.ic_btm_article,
      'label': "Artikel"
    }, // Pastikan ada di images.dart
    {
      'icon': Images.ic_btm_food,
      'label': "Makanan"
    }, // Gunakan ikon yang sama atau beda
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
      body: _adminPages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        backgroundColor: Colors.transparent,
        color: const Color(0xFF5C8858), // Warna hijau admin
        buttonBackgroundColor: Colors.white,
        items: _adminMenu.asMap().entries.map((entry) {
          final isSelected = _selectedIndex == entry.key;
          return CurvedNavigationBarItem(
            child: SvgPicture.asset(
              entry.value['icon'],
              color: isSelected ? const Color(0xFF5C8858) : Colors.white,
            ),
            label: entry.value['label'],
            labelStyle: openSansMedium.copyWith(
              fontSize: 10.sp,
              color: Colors.white,
            ),
          );
        }).toList(),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
