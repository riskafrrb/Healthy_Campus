// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:healthy_campus/utill/style.dart';
import 'package:sizer/sizer.dart';

class ConfirmAlertWidget extends StatelessWidget {
  final String title;
  final String message;
  final Function()? onClose;
  final Function()? onSubmit;
  const ConfirmAlertWidget({
    super.key,
    required this.title,
    required this.message,
    this.onClose,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)), //this right here
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 3.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: openSansMedium.copyWith(
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: openSansLight.copyWith(
                fontSize: 15.sp,
              ),
            ),
            SizedBox(height: 3.h),
            Container(
              padding: EdgeInsets.only(top: 1.h),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Text(
                      'Batal',
                      style: openSansMedium.copyWith(
                          fontSize: 15.sp,
                          color: Theme.of(context).primaryColor),
                    ),
                    onTap: onClose ??
                        () {
                          return Navigator.of(context).pop();
                        },
                  ),
                  SizedBox(width: 5.w),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Text(
                      'Keluar',
                      style: openSansBold.copyWith(
                        fontSize: 15.sp,
                        color: Colors.red[600],
                      ),
                    ),
                    onTap: onSubmit ??
                        () {
                          return Navigator.of(context).pop();
                        },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
