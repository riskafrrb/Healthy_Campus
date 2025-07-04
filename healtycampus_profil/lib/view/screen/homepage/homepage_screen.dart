import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:healthy_campus/utill/images.dart';
import 'package:healthy_campus/view/screen/artikel/artikel1.dart';
import 'package:healthy_campus/view/screen/artikel/artikel2.dart';
import 'package:healthy_campus/view/screen/artikel/artikel3.dart';
import 'package:healthy_campus/view/screen/artikel/artikel_home.dart';
import 'package:healthy_campus/view/screen/notifikasi/notifikasi.dart';
import 'package:healthy_campus/view/screen/homepage/lacak_aktivitas.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  String username = '';

  @override
  void initState() {
    super.initState();
    getCurrentUsername();
  }

  void getCurrentUsername() {
    final box = Hive.box('sessionBox');
    final storedUsername =
        box.get('username'); // pastikan kamu simpan username saat login
    if (storedUsername != null) {
      setState(() {
        username = storedUsername;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Image.asset(
            Images.background,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Content
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header section
                Stack(
                  children: [
                    Image.asset(
                      'assets/image/rectangle_98.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Images.avatar,
                            width: 50,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Halo, ${username.isNotEmpty ? username : "-"}!',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Notifikasi(),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/image/notif_beranda.png',
                              width: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Aktivitas Hari Ini
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LacakAktivitas(),
                        ),
                      );
                    },
                    child: Image.asset('assets/image/aktivitas_beranda.png'),
                  ),
                ),
                const SizedBox(height: 24),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Artikel',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      const SizedBox(height: 8),
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
                      const SizedBox(height: 8),
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
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ArtikelHome(),
                            ),
                          );
                        },
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Text(
                              'Lihat Lebih',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
