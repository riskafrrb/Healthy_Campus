import 'dart:developer';
import 'package:healthy_campus/view/screen/start/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healthy_campus/app/app.dart';
import 'package:healthy_campus/utill/routes.dart';
import 'package:healthy_campus/view/screen/dashboard/DashboardScreen.dart';
import 'package:healthy_campus/view/screen/dashboard/AdminDashboardScreen.dart';
import 'package:healthy_campus/view/screen/profil/update_gender_screen.dart';
import 'package:healthy_campus/view/screen/profil/update_nama_screen.dart';
import 'package:healthy_campus/view/screen/profil/update_profil_screen.dart';
import 'package:healthy_campus/view/screen/profil/update_riwayat_penyakit_screen.dart';
import 'package:healthy_campus/view/screen/profil/update_umur_screen.dart';
import 'package:healthy_campus/view/screen/admin/admin_beranda_screen.dart'; // Pastikan ini diimport

final routerHelper = GoRouter(
  initialLocation:
      Routes.DASHBOARD_SCREEN, // Pastikan ini sesuai dengan path yang ada
  navigatorKey: App.navigatorKey,
  routes: [
    // Route untuk admin beranda (ditambahkan kurung penutup)
    GoRoute(
      path: Routes.ADMIN_BERANDA_SCREEN, // Gunakan constant yang sesuai
      name: Routes.ADMIN_BERANDA_NAME,
      pageBuilder: (context, state) => const MaterialPage(
        child: AdminDashboardScreen(),
      ),
    ),
    GoRoute(
      name: Routes.LOGIN_NAME,
      path: Routes.LOGIN_SCREEN,
      pageBuilder: (context, state) => const MaterialPage(
        child: Login(),
      ),
    ),
    // Route dashboard (pastikan constant DASHBOARD_SCREEN ada di Routes)
    GoRoute(
      name: Routes.DASHBOARD_NAME,
      path: Routes.DASHBOARD_SCREEN,
      pageBuilder: (context, state) => const MaterialPage(
        child: DashboardScreen(),
      ),
    ),
    GoRoute(
      name: Routes.EDIT_PROFIL_NAME,
      path: Routes.EDIT_PROFIL_SCREEN,
      pageBuilder: (context, state) => const MaterialPage(
        child: UpdateProfilScreen(),
      ),
    ),
    GoRoute(
      name: Routes.EDIT_NAMA_NAME,
      path: Routes.EDIT_NAMA_SCREEN,
      pageBuilder: (context, state) => const MaterialPage(
        child: UpdateNamaScreen(),
      ),
    ),
    GoRoute(
      name: Routes.EDIT_GENDER_NAME,
      path: Routes.EDIT_GENDER_SCREEN,
      pageBuilder: (context, state) => const MaterialPage(
        child: UpdateGenderScreen(),
      ),
    ),
    GoRoute(
      name: Routes.EDIT_UMUR_NAME,
      path: Routes.EDIT_UMUR_SCREEN,
      pageBuilder: (context, state) => const MaterialPage(
        child: UpdateUmurScreen(),
      ),
    ),
    GoRoute(
      name: Routes.RIWAYAT_PENYAKIT_NAME,
      path: Routes.RIWAYAT_PENYAKIT_SCREEN,
      pageBuilder: (context, state) => const MaterialPage(
        child: UpdateRiwayatPenyakitScreen(),
      ),
    ),
  ],
);
