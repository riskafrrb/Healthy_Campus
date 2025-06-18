import 'package:flutter/material.dart';
import 'package:healthy_campus/view/screen/homepage/homepage_screen.dart';
import 'package:healthy_campus/view/screen/homepage/riwayat_maret.dart';

class LacakAktivitas extends StatelessWidget {
  const LacakAktivitas({super.key});

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

          SafeArea(
            child: Column(
              children: [
                // Header with back button and logo
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                  child: Row(
                    children: [
                      // Back button (navigasi ke Beranda)
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Perubahan utama di sini
                        },
                        child: Image.asset('assets/image/back.png', width: 24),
                      ),
                      const SizedBox(width: 16),
                      // App logo
                      Image.asset('assets/image/Group_134.png', height: 40),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Teks "Riwayat" bisa diklik dan menuju RiwayatMaret
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RiwayatMaret(),
                          ),
                        );
                      },
                      child: const Text(
                        'Riwayat',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration
                              .underline, // Opsional biar kelihatan bisa diklik
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Circle progress
                Image.asset('assets/image/Group_56.png', height: 180),
                const SizedBox(height: 24),

                // Stats image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Image.asset('assets/image/Group_57.png'),
                ),
                const SizedBox(height: 40),

                // Bar chart image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset('assets/image/grafik_batang.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
