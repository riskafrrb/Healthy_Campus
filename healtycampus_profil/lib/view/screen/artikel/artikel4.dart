import 'package:flutter/material.dart';

class Artikel4 extends StatelessWidget {
  const Artikel4({super.key});

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
                              'assets/image/gambar4_artikel.png',
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Center(
                            child: Text(
                              'Tips Untuk Tidur Lebih Cepat',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Tidur cukup sangat penting bagi mahasiswa untuk menjaga konsentrasi, suasana hati, dan kesehatan tubuh secara keseluruhan.\n'
                            'Namun, jadwal kuliah yang padat, tugas menumpuk, dan kebiasaan begadang sering membuat sulit tidur lebih awal.\n\n'
                            'Berikut beberapa tips sederhana yang bisa dilakukan agar bisa tidur lebih cepat:\n\n'
                            '1. Buat Rutinitas Sebelum Tidur\n'
                            'Lakukan aktivitas yang menenangkan sebelum tidur seperti membaca buku, mendengarkan musik pelan, atau meditasi.\n'
                            'Rutinitas ini memberi sinyal pada tubuh bahwa sudah waktunya istirahat.\n\n'
                            '2. Kurangi Paparan Layar Sebelum Tidur\n'
                            'Cahaya biru dari layar HP atau laptop bisa menghambat produksi hormon melatonin yang mengatur tidur.\n'
                            'Usahakan berhenti menggunakan gadget minimal 30 menit sebelum tidur.\n\n'
                            '3. Atur Jadwal Tidur yang Konsisten\n'
                            'Tidur dan bangun di jam yang sama setiap hari, termasuk saat akhir pekan, membantu tubuh memiliki jam biologis yang teratur.\n\n'
                            '4. Batasi Konsumsi Kafein di Malam Hari\n'
                            'Hindari minum kopi, teh, atau minuman energi menjelang malam.\n'
                            'Kafein bisa membuat tubuh tetap terjaga lebih lama.\n\n'
                            '5. Ciptakan Suasana Kamar yang Nyaman\n'
                            'Pastikan kamar dalam keadaan rapi, sejuk, dan minim cahaya atau kebisingan.\n'
                            'Suasana yang nyaman membuat tubuh lebih rileks dan siap untuk tidur.\n\n'
                            '6. Hindari Tidur Siang Terlalu Lama\n'
                            'Tidur siang yang terlalu panjang bisa membuat sulit tidur di malam hari.\n'
                            'Jika ingin tidur siang, cukup 15–30 menit saja.\n\n'
                            '7. Aktif secara Fisik di Siang Hari\n'
                            'Melakukan aktivitas fisik seperti olahraga ringan bisa membantu tubuh lebih lelah secara alami sehingga lebih mudah tertidur di malam hari.\n\n'
                            'Dengan tidur yang cukup dan berkualitas, mahasiswa bisa menjalani hari-hari kuliah dengan lebih fokus, segar, dan semangat.\n'
                            'Jangan anggap remeh tidur — karena istirahat yang cukup adalah bagian dari produktivitas juga.',
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
