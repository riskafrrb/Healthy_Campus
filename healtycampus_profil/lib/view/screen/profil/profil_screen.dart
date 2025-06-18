import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:healthy_campus/utill/images.dart';
import 'package:healthy_campus/utill/routes.dart';
import 'package:healthy_campus/utill/style.dart';
import 'package:healthy_campus/view/screen/profil/widget/confirm_alert_widget.dart';
import 'package:sizer/sizer.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            Center(
              child: Image.asset(
                Images.avatar,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'Sarah Ayu',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: openSansRegular.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.w600, height: 0.15.h),
            ),
            Text(
              '23082010136@student.upnjatim.ac.id',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: openSansRegular.copyWith(fontSize: 15.sp),
            ),
            SizedBox(height: 2.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 2.h),
              decoration: BoxDecoration(
                color: const Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Images.ic_place_marker,
                          width: 5.h,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(width: 1.h),
                        Text.rich(
                          TextSpan(
                            style: openSansRegular.copyWith(
                                fontSize: 14.sp, height: 0.15.h),
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
                  ),
                  SizedBox(width: 1.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.white, width: 1.5),
                        right: BorderSide(color: Colors.white, width: 1.5),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Images.ic_place_marker,
                          width: 5.h,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(width: 1.h),
                        Text.rich(
                          TextSpan(
                            style: openSansRegular.copyWith(
                                fontSize: 14.sp, height: 0.15.h),
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
                  ),
                  SizedBox(width: 1.h),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Images.ic_place_marker,
                          width: 5.h,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(width: 1.h),
                        Text.rich(
                          TextSpan(
                            style: openSansRegular.copyWith(
                                fontSize: 14.sp, height: 0.15.h),
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color(0xffEFEFEF), width: 1),
                          bottom:
                              BorderSide(color: Color(0xffEFEFEF), width: 1),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(Images.ic_edit),
                          SizedBox(width: 1.h),
                          Text(
                            'Ubah Profil',
                            style: openSansMedium,
                          )
                        ],
                      ),
                    ),
                    onTap: () =>
                        GoRouter.of(context).pushNamed(Routes.EDIT_PROFIL_NAME),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => GoRouter.of(context)
                        .pushNamed(Routes.RIWAYAT_PENYAKIT_NAME),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Color(0xffEFEFEF), width: 1)),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(Images.ic_history),
                          SizedBox(width: 1.h),
                          Text(
                            'Riwayat Penyakit',
                            style: openSansMedium,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => ConfirmAlertWidget(
                        title: 'Konfirmasi',
                        message: 'Apakah anda yakin ingin keluar?',
                        onSubmit: () {
                          // Close the dialog
                          Navigator.of(context).pop();
                          // Navigate to admin home page
                          GoRouter.of(context)
                              .goNamed(Routes.ADMIN_BERANDA_NAME);
                        },
                      ),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Color(0xffEFEFEF), width: 1)),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(Images.ic_logout),
                          SizedBox(width: 1.h),
                          Text(
                            'Keluar',
                            style: openSansMedium.copyWith(
                              color: const Color(0xffEA4335),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Image.asset(Images.copy_right),
    );
  }
}
