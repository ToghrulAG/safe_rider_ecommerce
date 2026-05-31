import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/presentation/auth/widgets/auth_icon_button.dart';
import 'dart:ui';
import '../../../core/theme/app_colors.dart';

class SignupForm extends StatelessWidget {
  final VoidCallback onLoginTap;

  const SignupForm({super.key, required this.onLoginTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      key: const ValueKey('signup'),
      borderRadius: BorderRadius.circular(28.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 124, 124, 124).withOpacity(0.2),
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: Column(
            children: [
              Text(
                'Create Account',
                style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: AppColors.textDark, fontSize: 14),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: AppColors.textDark, fontSize: 14),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              AuthIconButton(
                text: 'Sign Up',
                iconData: FontAwesomeIcons.userPlus,
                buttonColor: AppColors.darkBackground,
                iconColor: AppColors.textLight,
                textColor: Colors.white,
                onTap: () => {},
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  onLoginTap();
                },
                child: Text(
                  'Already have an account? Log In',
                  style: TextStyle(fontSize: 14.sp, color: AppColors.textLight),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
