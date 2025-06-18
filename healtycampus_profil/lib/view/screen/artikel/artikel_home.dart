import 'package:flutter/material.dart';
import 'package:healthy_campus/view/screen/homepage/homepage_screen.dart'; // Import halaman beranda

// Import halaman artikel
import 'artikel1.dart';
import 'artikel2.dart';
import 'artikel3.dart';
import 'artikel4.dart';
import 'artikel5.dart';

class ArtikelHome extends StatelessWidget {
  const ArtikelHome({super.key});

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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back button - now navigates to Beranda
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Perubahan utama di sini
                        },
                        child: Image.asset('assets/image/back.png', width: 24),
                      ),
                      const SizedBox(width: 16),
                      // Title and subtitle
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Artikel & Edukasi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Mari baca artikel untuk pengetahuan baru',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Article list
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Artikel1(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/image/artikel1_beranda.png',
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Artikel2(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/image/artikel2_beranda.png',
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Artikel3(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/image/artikel3_beranda.png',
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Artikel4(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/image/artikel4_beranda.png',
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Artikel5(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/image/artikel5_beranda.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom navbar
        ],
      ),
    );
  }
}
