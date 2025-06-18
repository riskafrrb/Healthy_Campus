import 'package:flutter/material.dart';

class Artikel2 extends StatelessWidget {
  const Artikel2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background utama
          Image.asset(
            'assets/image/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Area konten scroll
          Positioned.fill(
            top: 80, // Scroll dimulai di bawah header
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  children: [
                    // Background putih (bg_artikel)
                    Positioned.fill(
                      child: Image.asset(
                        'assets/image/bg_artikel.png',
                        fit: BoxFit.fill,
                      ),
                    ),

                    // Isi artikel
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Center(
                            child: Image.asset(
                              'assets/image/gambar2_artikel.png',
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Center(
                            child: Text(
                              'Keuntungan Makan Brokoli',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Brokoli merupakan salah satu sayuran yang kaya akan nutrisi dan sangat bermanfaat bagi kesehatan tubuh.\n'
                            'Dengan mengonsumsi brokoli secara rutin, tubuh bisa mendapatkan berbagai zat penting yang membantu menjaga dan meningkatkan kesehatan.\n\n'
                            'Berikut beberapa manfaat dari makan brokoli:\n\n'
                            '1. Menangkal Radikal Bebas\n'
                            'Brokoli mengandung antioksidan seperti vitamin C dan sulforaphane yang membantu melindungi sel-sel tubuh dari kerusakan akibat radikal bebas.\n\n'
                            '2. Meningkatkan Daya Tahan Tubuh\n'
                            'Kandungan vitamin C, beta-karoten, dan mineral dalam brokoli membantu memperkuat sistem kekebalan tubuh agar tidak mudah terserang penyakit.\n\n'
                            '3. Menjaga Kesehatan Jantung\n'
                            'Serat, kalium, dan antioksidan dalam brokoli berperan dalam menurunkan tekanan darah serta kadar kolesterol, sehingga baik untuk kesehatan jantung.\n\n'
                            '4. Mendukung Proses Detoksifikasi\n'
                            'Brokoli membantu proses detoksifikasi alami tubuh melalui kandungan senyawa seperti glukorafanin yang mendukung kerja hati.\n\n'
                            '5. Menjaga Kesehatan Tulang\n'
                            'Vitamin K dan kalsium dalam brokoli penting untuk menjaga kekuatan tulang dan mencegah risiko osteoporosis.\n\n'
                            '6. Melancarkan Pencernaan\n'
                            'Tingginya serat dalam brokoli membantu melancarkan sistem pencernaan dan mencegah sembelit.\n\n'
                            '7. Baik untuk Kesehatan Mata\n'
                            'Brokoli mengandung lutein dan zeaxanthin yang membantu melindungi mata dari gangguan penglihatan dan kerusakan akibat usia.\n\n'
                            '8. Berpotensi Mencegah Kanker\n'
                            'Senyawa aktif dalam brokoli seperti sulforaphane diketahui dapat menghambat pertumbuhan sel kanker tertentu seperti kanker payudara, prostat, dan usus besar.\n\n'
                            'Mengonsumsi brokoli secara rutin sebagai bagian dari pola makan sehat dapat membantu tubuh tetap bugar dan terhindar dari berbagai penyakit.\n'
                            'Dengan menjaga asupan gizi harian, kualitas hidup pun bisa meningkat secara menyeluruh.',
                            style: TextStyle(fontSize: 16, height: 1.5),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Header tetap (tidak ikut scroll)
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset('assets/image/back.png', width: 24),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Artikel & Edukasi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
