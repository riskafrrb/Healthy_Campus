import 'package:flutter/material.dart';
import 'login.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/image/bg_login.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Healthy Campus logo
                Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    'assets/image/teks_healthycampus.png',
                    width: 200,
                  ),
                ),

                // White card area
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // "Buat Akun" text
                      const Text(
                        'Buat Akun',
                        style: TextStyle(
                          fontFamily: 'SairaSemiCondensed',
                          fontWeight: FontWeight.w600,
                          fontSize: 32,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Form fields
                      Image.asset('assets/image/usn_login.png'),
                      const SizedBox(height: 16),
                      Image.asset('assets/image/email.png'),
                      const SizedBox(height: 16),
                      Image.asset('assets/image/sandi_login.png'),
                      const SizedBox(height: 16),
                      Image.asset('assets/image/konfirm_sandi.png'),
                      const SizedBox(height: 24),

                      // Daftar button - Ukuran disesuaikan sama dengan masuk.png (width: 180)
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/image/daftar.png',
                            width: 180, // Ukuran sama dengan tombol Masuk
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Sudah punya akun? Masuk
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Sudah punya akun? ',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                            child: const Text(
                              'Masuk',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF2E7D32),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Divider with text
                      const Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Atau lanjutkan dengan',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Social login icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/image/mail.png', width: 40),
                          const SizedBox(width: 16),
                          Image.asset('assets/image/google.png', width: 40),
                          const SizedBox(width: 16),
                          Image.asset('assets/image/facebook.png', width: 40),
                        ],
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
