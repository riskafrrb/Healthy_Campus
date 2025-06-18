import 'package:flutter/material.dart';
import 'riwayat_maret.dart';
import 'riwayat_april.dart';
import 'riwayat_mei.dart';
import 'riwayat_juni.dart';
import 'lacak_aktivitas.dart'; // Import halaman lacak_aktivitas

class RiwayatJuli extends StatelessWidget {
  const RiwayatJuli({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Image.asset(
            'assets/image/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with back button and title
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigasi ke lacak_aktivitas.dart
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LacakAktivitas(),
                            ),
                          );
                        },
                        child: Image.asset('assets/image/back.png', width: 24),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Riwayat Aktivitas',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Month selector - now clickable
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildMonthButton(context, 'Maret', 'maret', false),
                      _buildMonthButton(context, 'April', 'april', false),
                      _buildMonthButton(context, 'Mei', 'mei', false),
                      _buildMonthButton(context, 'Juni', 'juni', false),
                      _buildMonthButton(context, 'Juli', 'juli', true),
                    ],
                  ),
                ),

                // Activity list
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Image.asset(
                        'assets/image/aktivitas_juli.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthButton(
    BuildContext context,
    String monthName,
    String monthId,
    bool isActive,
  ) {
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          // Navigate to the corresponding month page
          switch (monthId) {
            case 'maret':
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const RiwayatMaret()),
              );
              break;
            case 'april':
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const RiwayatApril()),
              );
              break;
            case 'mei':
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const RiwayatMei()),
              );
              break;
            case 'juni':
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const RiwayatJuni()),
              );
              break;
            case 'juli':
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const RiwayatJuli()),
              );
              break;
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF4CAF50) : const Color(0xFFE8F5E9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          monthName,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFF4CAF50),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
