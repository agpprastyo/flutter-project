import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:hebalova_auth/widgets/password_input_helper.dart';

import '../../../constants/color.dart';
import '../../../widgets/title_auth.dart';
import '../cubit/login_cubit.dart';
import '../widgets/google_login_button.dart';
import '../widgets/login_button.dart';
import '../widgets/login_email_input.dart';
import '../widgets/login_password_input.dart';
import '../widgets/sign_up_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleAuth(
                  title: 'Login',
                  description: 'Sign to your account',
                ),
                SizedBox(height: 30.h),
                const EmailInput(),
                SizedBox(height: 8.h),
                const PasswordInput(
                  inputType: InputType.login,
                ),
                SizedBox(height: 8.h),
                const GoogleLoginButton(),
                const SizedBox(height: 4),
                const SignUpButton(),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  height: 55.h,
                  decoration: const BoxDecoration(color: AppColors.primary),
                  child: const LoginButton()),
            ],
          ),
        )
      ]),
    );
  }
}
