import 'package:flutter/material.dart';
import 'package:healthy_campus/utill/images.dart';

class AdminBerandaScreen extends StatelessWidget {
  const AdminBerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FFF1),
      body: SafeArea(
        child: Column(
          children: [
            // Header with Time
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: const Row(
                children: [
                  Text(
                    '9:30',
                    style: TextStyle(
                      color: Color(0xFF1D1B20),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Greeting
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Halo, Admin Riska!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            // Data Section
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Data Terkini',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // Data Cards
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                children: [
                  _buildDataCard(
                    title: 'Jumlah Pengguna terdaftar',
                    value: '1000 Pengguna',
                    icon: Icons.people_outline,
                  ),
                  const SizedBox(height: 16),
                  _buildDataCard(
                    title: 'Artikel yang dipublikasikan',
                    value: '20 Artikel',
                    icon: Icons.article_outlined,
                  ),
                  const SizedBox(height: 16),
                  _buildDataCard(
                    title: 'Tempat makan terdaftar',
                    value: '10 Tempat',
                    icon: Icons.restaurant_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // BOTTOM COPYRIGHT NAVIGATION (Sama seperti di ProfilScreen)
      bottomNavigationBar: Image.asset(Images.copy_right),
    );
  }

  Widget _buildDataCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: const Color(0xFF5C8858)),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
