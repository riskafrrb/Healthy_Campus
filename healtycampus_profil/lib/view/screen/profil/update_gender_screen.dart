import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:healthy_campus/utill/style.dart';
import 'package:sizer/sizer.dart';

class UpdateGenderScreen extends StatefulWidget {
  const UpdateGenderScreen({super.key});

  @override
  State<UpdateGenderScreen> createState() => _UpdateGenderScreenState();
}

class _UpdateGenderScreenState extends State<UpdateGenderScreen> {
  String _selectedValue = '-';

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
          'Pilih Jenis Kelamin',
          style: openSansMedium.copyWith(fontSize: 20.sp),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.h),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => setState(() {
                      _selectedValue = 'L';
                    }),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 4.5.h,
                          width: 2.h,
                          child: Radio<String>(
                            value: 'L',
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 1.h),
                        Text(
                          'Pria',
                          style: openSansRegular.copyWith(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color(0XFFCACACA),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => setState(() {
                      _selectedValue = 'P';
                    }),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 4.5.h,
                          width: 2.h,
                          child: Radio<String>(
                            value: 'P',
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 1.h),
                        Text(
                          'Perempuan',
                          style: openSansRegular.copyWith(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ],
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
