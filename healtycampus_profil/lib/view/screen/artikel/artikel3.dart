import 'package:flutter/material.dart';

class Artikel3 extends StatelessWidget {
  const Artikel3({super.key});

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
                              'assets/image/gambar3_artikel.png',
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Center(
                            child: Text(
                              'Menyeimbangkan Olahraga dan Kuliah',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Menyeimbangkan antara kuliah dan olahraga memang bisa menjadi tantangan, apalagi dengan jadwal yang padat dan tugas yang menumpuk.\n'
                            'Namun, dengan pengaturan waktu dan niat yang kuat, keduanya tetap bisa berjalan beriringan.\n\n'
                            'Berikut beberapa cara sederhana yang bisa dilakukan untuk menyeimbangkan kuliah dan olahraga:\n\n'
                            '1. Buat Jadwal yang Teratur\n'
                            'Tentukan waktu khusus untuk olahraga dalam jadwal harian atau mingguan.\n'
                            'Misalnya, olahraga ringan di pagi hari sebelum kuliah, atau di sore hari setelah menyelesaikan tugas.\n\n'
                            '2. Manfaatkan Waktu Luang dengan Bijak\n'
                            'Gunakan jeda antar kelas atau waktu istirahat untuk bergerak ringan, seperti stretching, jalan kaki, atau naik turun tangga.\n\n'
                            '3. Pilih Jenis Olahraga yang Fleksibel\n'
                            'Tidak perlu langsung pergi ke gym. Cukup lakukan olahraga ringan seperti yoga, skipping, atau workout 10–15 menit di kamar.\n\n'
                            '4. Gabungkan Olahraga dengan Aktivitas Sosial\n'
                            'Ajak teman untuk olahraga bareng, seperti jogging di akhir pekan atau ikut komunitas olahraga kampus agar tetap semangat.\n\n'
                            '5. Gunakan Aplikasi Penunjang\n'
                            'Banyak aplikasi yang bisa bantu atur jadwal olahraga dan kuliah, serta mengingatkan kapan saatnya bergerak.\n\n'
                            '6. Jangan Abaikan Kesehatan Mental\n'
                            'Olahraga tidak hanya baik untuk fisik, tapi juga membantu meredakan stres akibat kuliah.\n'
                            'Menjadikannya prioritas akan membantu performa belajar juga.\n\n'
                            '7. Tetapkan Tujuan Realistis\n'
                            'Tidak harus olahraga setiap hari. Mulai dari 2–3 kali seminggu sudah cukup, asalkan konsisten.\n\n'
                            'Menyeimbangkan kuliah dan olahraga bukan soal membagi waktu sama rata, tapi soal prioritas dan konsistensi.\n'
                            'Dengan gaya hidup yang aktif dan teratur, kamu bisa tetap sehat, produktif, dan semangat menjalani hari sebagai mahasiswa.',
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
