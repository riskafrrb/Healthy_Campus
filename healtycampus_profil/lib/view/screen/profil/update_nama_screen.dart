import 'package:flutter/material.dart';
import 'package:healthy_campus/utill/style.dart';
import 'package:sizer/sizer.dart';

class UpdateNamaScreen extends StatelessWidget {
  const UpdateNamaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          'Ubah Nama',
          style: openSansMedium.copyWith(fontSize: 20.sp),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                'Nama ini akan tampil di beberapa halaman.',
                textAlign: TextAlign.left,
                style: openSansRegular,
              ),
            ),
            SizedBox(height: 1.5.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
              decoration: BoxDecoration(
                color: const Color(0XFFF2F2F2),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.transparent),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1.h, horizontal: 0.h),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  labelStyle: openSansRegular.copyWith(fontSize: 15.sp),
                  hintText: 'Nama Anda',
                  fillColor: Colors.transparent,
                  hintStyle: openSansRegular.copyWith(
                    fontSize: 15.sp,
                    color: const Color(0XFFC5C0C0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(
                    Theme.of(context).primaryColor),
                foregroundColor:
                    const WidgetStatePropertyAll<Color>(Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Simpan',
                style: openSansMedium.copyWith(fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
