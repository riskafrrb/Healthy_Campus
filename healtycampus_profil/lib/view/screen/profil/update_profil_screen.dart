import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:healthy_campus/models/user_model.dart';
import 'package:healthy_campus/utill/images.dart';
import 'package:healthy_campus/utill/routes.dart';
import 'package:healthy_campus/utill/style.dart';
import 'package:healthy_campus/view/screen/profil/widget/berat_badan_widget.dart';
import 'package:healthy_campus/view/screen/profil/widget/tinggi_badan_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

class UpdateProfilScreen extends StatefulWidget {
  const UpdateProfilScreen({super.key});

  @override
  State<UpdateProfilScreen> createState() => _UpdateProfilScreenState();
}

class _UpdateProfilScreenState extends State<UpdateProfilScreen> {
  String username = '-';

  @override
  @override
  void initState() {
    super.initState();
    final sessionBox = Hive.box('sessionBox');
    setState(() {
      username = sessionBox.get('username', defaultValue: '-') ?? '-';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          'Ubah Profil',
          style: openSansMedium.copyWith(fontSize: 20.sp),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            Center(
              child: Image.asset(Images.avatar),
            ),
            SizedBox(height: 2.h),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Text(
                'Ubah Foto Profil',
                textAlign: TextAlign.center,
                style: openSansRegular.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 0.15.h,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            const Divider(thickness: 1, color: Color(0xffEFEFEF)),
            SizedBox(height: 2.h),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  _buildButton(
                    icon: Images.ic_use,
                    label: 'Nama',
                    value: username,
                    onTap: () =>
                        GoRouter.of(context).pushNamed(Routes.EDIT_NAMA_NAME),
                  ),
                  SizedBox(height: 1.h),
                  _buildButton(
                    icon: Images.ic_use,
                    label: 'Jenis Kelamin',
                    value: '-', // Belum ada datanya
                    onTap: () =>
                        GoRouter.of(context).pushNamed(Routes.EDIT_GENDER_NAME),
                  ),
                  SizedBox(height: 1.h),
                  _buildButton(
                    icon: Images.ic_use,
                    label: 'Umur',
                    value: '-', // Belum ada datanya
                    onTap: () =>
                        GoRouter.of(context).pushNamed(Routes.EDIT_UMUR_NAME),
                  ),
                  SizedBox(height: 1.h),
                  _buildButton(
                    icon: Images.ic_use,
                    label: 'Berat Badan',
                    value: '-', // Belum ada datanya
                    onTap: () => showModalBottom(
                      context: context,
                      child: const BeratBadanWidget(),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  _buildButton(
                    icon: Images.ic_use,
                    label: 'Tinggi Badan',
                    value: '-', // Belum ada datanya
                    onTap: () => showModalBottom(
                      context: context,
                      child: const TinggiBadanWidget(),
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

  Widget _buildButton({
    required String icon,
    required String label,
    required String value,
    void Function()? onTap,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
        decoration: BoxDecoration(
          color: const Color(0XFFF5F5F5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 2.h),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: openSansLight.copyWith(color: const Color(0XFF757575)),
              ),
            ),
            SizedBox(width: 2.h),
            Expanded(
              child: Text(
                value,
                style: openSansMedium,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showModalBottom(
      {required BuildContext context, required Widget child}) async {
    showModalBottomSheet(
      context: context,
      elevation: 1,
      useSafeArea: true,
      clipBehavior: Clip.none,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }
}
