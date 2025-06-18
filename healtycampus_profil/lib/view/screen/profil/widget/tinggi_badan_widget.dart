// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthy_campus/utill/style.dart';
import 'package:sizer/sizer.dart';

class TinggiBadanWidget extends StatefulWidget {
  const TinggiBadanWidget({super.key});

  @override
  _TinggiBadanWidgetState createState() => _TinggiBadanWidgetState();
}

class _TinggiBadanWidgetState extends State<TinggiBadanWidget> {
  String _unit = 'cm';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Atur Berat Badan',
            style: openSansMedium.copyWith(
                fontSize: 16.sp, color: Theme.of(context).primaryColor),
          ),
          SizedBox(height: 2.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
                    ],
                    textAlign: TextAlign.center,
                    style: openSansBold.copyWith(
                      fontSize: 30.sp,
                    ),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
                      hintText: '0',
                      hintStyle: openSansBold.copyWith(
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1.h),
              Icon(
                Icons.circle,
                size: 12.sp,
              ),
              SizedBox(width: 1.h),
              Expanded(
                child: Container(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
                    ],
                    textAlign: TextAlign.center,
                    style: openSansBold.copyWith(
                      fontSize: 30.sp,
                    ),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
                      hintText: '00',
                      hintStyle: openSansBold.copyWith(
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['cm', 'ft, in'].map((unit) {
                  bool isSelected = _unit == unit;
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        _unit = unit;
                      });
                      log('unit $_unit');
                    },
                    child: Container(
                      width: 20.w,
                      padding: EdgeInsets.symmetric(
                        vertical: 1.h,
                        horizontal: 2.h,
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.pink.shade100
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Text(
                        unit,
                        textAlign: TextAlign.center,
                        style: openSansMedium,
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                    width: double.infinity,
                    child: Text(
                      'Batal',
                      textAlign: TextAlign.center,
                      style: openSansMedium.copyWith(
                        fontSize: 16.sp,
                        color: Colors.red[400],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1.h),
              SizedBox(
                height: 18.sp,
                child: const VerticalDivider(
                  color: Color(0XFFC5C0C0),
                  thickness: 1,
                ),
              ),
              SizedBox(width: 1.h),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                    width: double.infinity,
                    child: Text(
                      'Selesai',
                      textAlign: TextAlign.center,
                      style: openSansMedium.copyWith(
                        fontSize: 16.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
