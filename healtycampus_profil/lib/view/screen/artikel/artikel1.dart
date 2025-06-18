import 'package:flutter/material.dart';

class Artikel1 extends StatelessWidget {
  const Artikel1({super.key});

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
                              'assets/image/gambar1_artikel.png',
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Center(
                            child: Text(
                              'Cara Mengurangi Stress Mahasiswa',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Menjadi mahasiswa bukanlah hal yang mudah. Tugas yang menumpuk, deadline yang ketat, dan tekanan akademik sering kali menjadi pemicu stres. Jika tidak dikelola dengan baik, stres bisa berdampak negatif pada kesehatan fisik maupun mental. Berikut beberapa cara sederhana yang bisa dilakukan mahasiswa untuk mengurangi stres:\n\n'
                            '1. Atur Waktu dengan Baik\n'
                            'Management waktu yang baik membantu menghindari penumpukan tugas. Gunakan to-do list atau aplikasi pengingat agar lebih terorganisir.\n\n'
                            '2. Istirahat yang Cukup\n'
                            'Tidur yang cukup dapat meningkatkan konsentrasi dan mood. Hindari begadang jika tidak benar-benar perlu.\n\n'
                            '3. Olahraga Secara Teratur\n'
                            'Aktivitas fisik seperti jalan kaki, bersepeda, atau yoga bisa membantu tubuh melepaskan hormon endorfin yang membuat kita merasa lebih bahagia dan rileks.\n\n'
                            '4. Luangkan Waktu untuk Diri Sendiri\n'
                            'Lakukan hobi yang disukai, seperti membaca, menonton film, atau bermain musik untuk menyegarkan pikiran.\n\n'
                            '5. Berbagi Cerita dengan Teman atau Keluarga\n'
                            'Jangan ragu untuk bercerita tentang masalah yang dihadapi. Dukungan sosial bisa sangat membantu dalam mengurangi tekanan.\n\n'
                            'Mengelola stres adalah bagian penting dari kehidupan mahasiswa. Dengan menerapkan kebiasaan positif, beban akademik bisa dijalani dengan lebih tenang dan sehat.',
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
