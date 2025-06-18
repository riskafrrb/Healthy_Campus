import 'package:flutter/material.dart';
import 'package:healthy_campus/utill/images.dart';
import 'package:healthy_campus/view/screen/homepage/homepage_screen.dart'; // Make sure to import your Beranda page

class Notifikasi extends StatelessWidget {
  const Notifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/image/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Content
          Column(
            children: [
              // Fixed Header
              Container(
                padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
                child: Row(
                  children: [
                    // Back button - now navigates to Beranda
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Perubahan utama di sini
                      },
                      child: Image.asset('assets/image/back.png', width: 24),
                    ),
                    const SizedBox(width: 16),
                    // Title
                    const Text(
                      'Notifikasi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Scrollable Content Area
              Expanded(
                child: Stack(
                  children: [
                    // Semi-transparent white background
                    Image.asset(
                      'assets/image/bg_artikel.png',
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),

                    // Scrollable notifications
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Image.asset('assets/image/notifikasi.png'),
                          const SizedBox(height: 8),
                          Image.asset('assets/image/notifikasi.png'),
                          const SizedBox(height: 8),
                          Image.asset('assets/image/notifikasi.png'),
                          const SizedBox(height: 8),
                          Image.asset('assets/image/notifikasi.png'),
                          const SizedBox(height: 8),
                          Image.asset('assets/image/notifikasi.png'),
                          const SizedBox(height: 8),
                          Image.asset('assets/image/notifikasi.png'),
                          const SizedBox(height: 8),
                          Image.asset('assets/image/notifikasi.png'),
                          const SizedBox(height: 8),
                          Image.asset('assets/image/notifikasi.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
