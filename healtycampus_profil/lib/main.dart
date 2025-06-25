import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:healthy_campus/app/app.dart';
import 'package:healthy_campus/models/user_model.dart';
import 'package:healthy_campus/models/food_store_model.dart';
import 'package:healthy_campus/view/screen/admin/tambah_toko_screen.dart';
import 'package:healthy_campus/view/screen/admin/data_makanan_screen.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(FoodStoreModelAdapter());

  final userBox = await Hive.openBox<UserModel>('userBox');
  if (userBox.isEmpty) {
    userBox.add(UserModel(
      username: 'riska',
      password: '123456',
      email: 'riska@example.com',
      role: 'user',
    ));
    userBox.add(UserModel(
      username: 'admin',
      password: 'admin123',
      email: 'admin@healthycampus.com',
      role: 'admin',
    ));
  }

  await Hive.openBox('sessionBox');

  runApp(const MyApp());
}

// ✅ Setup GoRouter
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const App(),
    ),
    GoRoute(
      path: '/tambah-toko',
      name: 'tambahToko',
      builder: (context, state) => const TambahTokoScreen(),
    ),
    GoRoute(
      path: '/data-toko',
      name: 'dataToko',
      builder: (context, state) => const DataMakananScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Healthy Campus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
