import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

import 'package:healthy_campus/utill/images.dart';
import 'package:healthy_campus/utill/routes.dart';
import 'package:healthy_campus/utill/style.dart';
import 'package:healthy_campus/view/screen/profil/widget/confirm_alert_widget.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  String username = '-';
  String email = '-';

  @override
  void initState() {
    super.initState();
    _loadSessionData();
  }

  Future<void> _loadSessionData() async {
    final sessionBox = await Hive.openBox('sessionBox');
    setState(() {
      username = sessionBox.get('username', defaultValue: '-') ?? '-';
      email = sessionBox.get('email', defaultValue: '-') ?? '-';
    });
  }

  Future<void> _logoutAndNavigate() async {
    final sessionBox = await Hive.openBox('sessionBox');
    await sessionBox.clear();

    // Tutup dialog konfirmasi
    Navigator.of(context).pop();

    // Arahkan ke halaman login (pakai pushNamed seperti Edit Profil)
    GoRouter.of(context).pushNamed(Routes.LOGIN_NAME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(left: 3.w),
          child: Text(
            'Akun Saya',
            style: openSansMedium.copyWith(fontSize: 20.sp),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Center(child: Image.asset(Images.avatar)),
            SizedBox(height: 2.h),
            Text(
              username,
              style: openSansRegular.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              email,
              style: openSansRegular.copyWith(fontSize: 15.sp),
            ),
            SizedBox(height: 2.h),

            // Info Jarak
            Container(
              padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 2.h),
              decoration: BoxDecoration(
                color: const Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: List.generate(3, (_) {
                  return Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Images.ic_place_marker, width: 5.h),
                        SizedBox(width: 1.h),
                        Text.rich(
                          TextSpan(
                            style: openSansRegular.copyWith(fontSize: 14.sp),
                            children: [
                              const TextSpan(text: 'Jarak\n'),
                              TextSpan(
                                text: '3,2 Km',
                                style: openSansMedium.copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 2.h),

            // Menu Profil
            Expanded(
              child: ListView(
                children: [
                  // Ubah Profil
                  InkWell(
                    onTap: () =>
                        GoRouter.of(context).pushNamed(Routes.EDIT_PROFIL_NAME),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color(0xffEFEFEF)),
                          bottom: BorderSide(color: Color(0xffEFEFEF)),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(Images.ic_edit),
                          SizedBox(width: 1.h),
                          Text('Ubah Profil', style: openSansMedium),
                        ],
                      ),
                    ),
                  ),

                  // Riwayat Penyakit
                  InkWell(
                    onTap: () => GoRouter.of(context)
                        .pushNamed(Routes.RIWAYAT_PENYAKIT_NAME),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xffEFEFEF)),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(Images.ic_history),
                          SizedBox(width: 1.h),
                          Text('Riwayat Penyakit', style: openSansMedium),
                        ],
                      ),
                    ),
                  ),

                  // Logout
                  InkWell(
                    onTap: () => showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => ConfirmAlertWidget(
                        title: 'Konfirmasi',
                        message: 'Apakah anda yakin ingin keluar?',
                        onSubmit: _logoutAndNavigate,
                      ),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xffEFEFEF)),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(Images.ic_logout),
                          SizedBox(width: 1.h),
                          Text(
                            'Keluar',
                            style: openSansMedium.copyWith(
                                color: const Color(0xffEA4335)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Image.asset(Images.copy_right),
    );
  }
}
