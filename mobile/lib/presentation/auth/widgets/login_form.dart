import 'package:flutter/material.dart';
import 'package:mobile/presentation/auth/widgets/auth_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/cubits/auth.cubit.dart';
import '../../../data/cubits/auth.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onSignUpTap;

  const LoginForm({super.key, required this.onSignUpTap});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      key: const ValueKey('login'),
      borderRadius: BorderRadius.circular(28.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 190, 159, 159).withOpacity(0.2),
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: AppColors.textDark, fontSize: 14),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.darkBackground,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'or',
                style: TextStyle(color: AppColors.textLight, fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              AuthIconButton(
                text: 'Continue',
                iconData: FontAwesomeIcons.arrowRight,
                buttonColor: Color.fromARGB(255, 72, 186, 26),
                iconColor: Color.fromARGB(255, 255, 255, 255),
                textColor: Colors.white,
                onTap: () => {},
              ),
              SizedBox(height: 10.h),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Welcome, ${state.user}"), 
                      ),
                    );
                  }
                  if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMessage),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    );
                  }

                  return AuthIconButton(
                    text: 'Continue with Google',
                    iconData: FontAwesomeIcons.google,
                    iconColor: AppColors.darkSurface,
                    buttonColor: AppColors.lightBackground,
                    textColor: Colors.black,
                    onTap: () {
                      context.read<AuthCubit>().loginWithGoogle();
                    },
                  );
                },
              ),
              SizedBox(height: 10.h),
              AuthIconButton(
                text: 'Continue with Apple',
                iconData: FontAwesomeIcons.apple,
                iconColor: AppColors.lightBackground,
                textColor: AppColors.textLight,
                buttonColor: AppColors.darkBackground,
                onTap: () => {},
              ),
              SizedBox(height: 10.h),
              AuthIconButton(
                text: 'Continue with Facebook',
                iconData: FontAwesomeIcons.facebook,
                iconColor: Colors.blue,
                textColor: AppColors.textDark,
                buttonColor: const Color.fromARGB(255, 255, 255, 255),
                onTap: () => {},
              ),
              SizedBox(height: 15.h),
              GestureDetector(
                onTap: () {
                  widget.onSignUpTap();
                },
                child: Text(
                  'Dont have an account? Sign Up',
                  style: TextStyle(fontSize: 14.sp, color: AppColors.textLight),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Forgot your password?',
                style: TextStyle(fontSize: 14.sp, color: AppColors.textLight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
