import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthy_campus/view/screen/start/login.dart';

class Mulai extends StatelessWidget {
  const Mulai({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset('assets/image/bg_hijau.png', fit: BoxFit.cover),
          ),

          // Time display at top right
          const Positioned(
            top: 40,
            right: 16,
            child: Text(
              '9:30',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),

          // Main content center
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Healthy Campus Text (centered properly)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    'assets/image/teks_healthycampus.png',
                    width: MediaQuery.of(context).size.width * 0.85,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),

                // Logo (centered)
                Image.asset(
                  'assets/image/logo.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40),

                // Tombol Mulai (dibesarkan)
                GestureDetector(
                  onTap: () {
                    context.go(
                        '/login'); // atau pakai constant: context.go(Routes.LOGIN_SCREEN);
                  },
                  child: Image.asset(
                    'assets/image/mulai.png',
                    width: 220, // dibesarkan
                    fit: BoxFit.contain,
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
