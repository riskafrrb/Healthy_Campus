import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // ✅ untuk context.go
import 'package:healthy_campus/view/screen/dashboard/AdminDashboardScreen.dart';
import 'package:healthy_campus/view/screen/dashboard/DashboardScreen.dart';
import 'package:healthy_campus/view/screen/start/verification_page.dart';
import 'signup.dart';
import 'package:healthy_campus/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:healthy_campus/utill/routes.dart'; // ✅ untuk route constant

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final UserModel adminUser = UserModel(
    username: 'admin',
    password: 'admin123',
    email: 'admin@healthycampus.com',
    role: 'admin',
  );

  @override
  void initState() {
    super.initState();
    _checkAndAddAdminUser();
  }

  Future<void> _checkAndAddAdminUser() async {
    final box = Hive.box<UserModel>('userBox');
    final adminExists = box.values.any((user) => user.username == 'admin');

    if (!adminExists) {
      await box.add(adminUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/bg_login.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 60),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/image/teks_healthycampus.png',
                    width: 200,
                  ),
                ),
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
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerificationPage(),
                              ),
                            );
                          },
                          child: const Text(
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
                          onTap: () async {
                            final box = Hive.box<UserModel>('userBox');

                            String inputUsername =
                                usernameController.text.trim();
                            String inputPassword =
                                passwordController.text.trim();

                            // ✅ GUNAKAN GoRouter UNTUK ADMIN
                            if (inputUsername == 'admin' &&
                                inputPassword == 'admin123') {
                              final sessionBox =
                                  await Hive.openBox('sessionBox');
                              await sessionBox.put(
                                  'username', adminUser.username);
                              await sessionBox.put('email', adminUser.email);
                              await sessionBox.put('role', adminUser.role);

                              context.go(Routes.ADMIN_BERANDA_SCREEN);
                              return;
                            }

                            final users = box.values.toList();
                            UserModel? matchUser;
                            try {
                              matchUser = users.firstWhere(
                                (user) =>
                                    user.username == inputUsername &&
                                    user.password == inputPassword,
                              );
                            } catch (e) {
                              matchUser = null;
                            }

                            if (matchUser != null) {
                              // Simpan session login ke Hive
                              final sessionBox =
                                  await Hive.openBox('sessionBox');
                              await sessionBox.put(
                                  'username', matchUser.username);
                              await sessionBox.put('email', matchUser.email);
                              await sessionBox.put('role', matchUser.role);

                              // Arahkan ke dashboard
                              context.go(Routes.DASHBOARD_SCREEN);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Username atau password salah'),
                                ),
                              );
                            }
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
