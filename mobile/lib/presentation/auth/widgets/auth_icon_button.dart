import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'dart:ui';
// import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthIconButton extends StatelessWidget {
  final String text;
  final dynamic iconData;
  final Color buttonColor;
  final Color textColor;
  final Color iconColor;
  final VoidCallback onTap;

  const AuthIconButton({
    super.key,
    required this.text,
    required this.iconData,
    required this.buttonColor,
    required this.textColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          backgroundColor: buttonColor,
        ),
        onPressed: onTap,
        child: Row(
          children: [
            FaIcon(iconData, color: iconColor, size: 20.sp),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 20.sp),
          ],
        ),
      ),
    );
  }
}
