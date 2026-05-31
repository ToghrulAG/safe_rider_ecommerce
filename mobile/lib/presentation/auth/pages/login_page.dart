import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/data/cubits/auth.cubit.dart';
import 'package:mobile/data/cubits/auth.state.dart';
import 'package:mobile/presentation/auth/widgets/login_form.dart';
import 'package:mobile/presentation/auth/widgets/signup_form.dart';
import '../../../core/theme/app_colors.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
        body: Stack(
          children: [
            Positioned(
              top: 80.h,
              right: 0,
              width: 360.w,
              child: Image.asset(
                'lib/assets/loginBck.png',
                fit: BoxFit.contain,
                alignment: Alignment.centerRight,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!isLogin) {
                          setState(() {
                            isLogin = true;
                          });
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        color: Colors.transparent,
                        child: Icon(
                          Icons.arrow_back_sharp,
                          color: AppColors.textLight,
                          size: 24.sp,
                        ),
                      ),
                    ),

                    SizedBox(height: 190.h),

                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeIn,
                      layoutBuilder:
                          (
                            Widget? currentChild,
                            List<Widget> previousChildren,
                          ) {
                            return Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                ...previousChildren,
                                if (currentChild != null) currentChild,
                              ],
                            );
                          },
                      child: isLogin
                          ? LoginForm(
                              onSignUpTap: () {
                                setState(() {
                                  isLogin = false;
                                });
                              },
                            )
                          : SignupForm(
                              onLoginTap: () {
                                setState(() {
                                  isLogin = true;
                                });
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
