import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:healthy_campus/view/screen/homepage/homepage_screen.dart';
import 'package:healthy_campus/view/screen/start/verification_page.dart';
import 'signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/bg_login.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Logo
                Container(
                  padding: const EdgeInsets.only(top: 60),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/teks_healthycampus.png',
                    width: 200,
                  ),
                ),

                // White container
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
                      const Text(
                        'Selamat Datang Kembali!',
                        style: TextStyle(
                          fontFamily: 'SairaSemiCondensed',
                          fontWeight: FontWeight.w600,
                          fontSize: 32,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Halo! masuk untuk melanjutkan',
                        style: TextStyle(
                          fontFamily: 'SansSerifCollection',
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Image.asset('assets/images/usn_login.png'),
                      const SizedBox(height: 16),
                      Image.asset('assets/images/sandi_login.png'),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VerificationPage(), // Navigate to password verification page
                              ),
                            );
                          },
                          child: Text(
                            'Lupa kata sandi?',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BerandaScreen(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/image/masuk.png',
                            width: 180,
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Tidak punya akun? ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'Daftar Sekarang',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF2E7D32),
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Signup(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      Row(
                        children: const [
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
                      const SizedBox(height: 20),
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
