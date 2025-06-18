import 'package:flutter/material.dart';

class Artikel5 extends StatelessWidget {
  const Artikel5({super.key});

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
                              'assets/image/gambar5_artikel.png',
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Center(
                            child: Text(
                              'Tips Mengatur Waktu Organisasi dan Tugas',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Menjadi mahasiswa aktif di organisasi kampus memang memberikan banyak pengalaman berharga.\n'
                            'Namun, di sisi lain, tanggung jawab akademik tetap harus dijalankan dengan baik.\n\n'
                            'Agar keduanya bisa berjalan seimbang, berikut beberapa tips yang bisa dilakukan:\n\n'
                            '1. Buat Skala Prioritas\n'
                            'Tentukan mana kegiatan yang paling penting dan mendesak.\n'
                            'Gunakan metode seperti to-do list atau Eisenhower Matrix agar lebih mudah menentukan mana yang harus dikerjakan lebih dulu.\n\n'
                            '2. Gunakan Kalender atau Aplikasi Pengingat\n'
                            'Catat semua jadwal rapat, deadline tugas, dan ujian di kalender atau aplikasi digital.\n'
                            'Dengan begitu, kamu bisa melihat gambaran keseluruhan dan menghindari jadwal yang bertabrakan.\n\n'
                            '3. Jangan Menunda Pekerjaan\n'
                            'Selesaikan tugas saat ada waktu luang, jangan menunggu mepet deadline.\n'
                            'Menunda hanya akan membuat pekerjaan menumpuk dan menambah stres.\n\n'
                            '4. Bagi Waktu dengan Bijak\n'
                            'Atur waktu harian dengan membagi blok waktu khusus untuk kuliah, tugas, rapat organisasi, dan istirahat.\n'
                            'Pastikan tetap ada waktu untuk diri sendiri.\n\n'
                            '5. Belajar Delegasi\n'
                            'Dalam organisasi, jangan ragu untuk membagi tugas dengan anggota tim.\n'
                            'Tidak semua hal harus kamu kerjakan sendiri.\n\n'
                            '6. Tetapkan Batasan\n'
                            'Jika kamu merasa terlalu kewalahan, jangan takut untuk berkata “tidak” atau mengambil jeda dari kegiatan organisasi sementara waktu untuk fokus pada akademik.\n\n'
                            '7. Manfaatkan Akhir Pekan Secara Produktif\n'
                            'Gunakan akhir pekan untuk menyelesaikan tugas, merapikan catatan, atau merancang rencana minggu depan.\n'
                            'Ini membantumu lebih siap saat hari aktif tiba.\n\n'
                            'Mengatur waktu antara organisasi dan tugas kuliah memang butuh komitmen dan disiplin.\n'
                            'Tapi dengan manajemen waktu yang baik, kamu bisa tetap aktif berorganisasi tanpa mengorbankan nilai akademik.\n'
                            'Keduanya bisa berjalan berdampingan dan saling melengkapi.',
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
