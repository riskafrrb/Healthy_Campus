import 'package:flutter/material.dart';
import 'package:healthy_campus/view/screen/start/mulai.dart';

class WelcomeAwal extends StatelessWidget {
  const WelcomeAwal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // fallback untuk background kosong
      resizeToAvoidBottomInset:
          false, // cegah shifting akibat keyboard/system inset
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Mulai()),
          );
        },
        child: SizedBox.expand(
          child: Stack(
            children: [
              // Background full
              Positioned.fill(
                child: Image.asset(
                  'assets/images/bg_hijau.png',
                  fit: BoxFit.cover,
                ),
              ),

              // Logo di tengah
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
