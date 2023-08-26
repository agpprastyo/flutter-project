import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:hebalova_auth/widgets/email_input_helper.dart';
import 'package:hebalova_auth/widgets/password_input_helper.dart';
import 'package:hebalova_auth/widgets/title_auth.dart';

import '../../../constants/color.dart';
import '../cubit/sign_up_cubit.dart';
import '../widgets/signup_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TitleAuth(
                    title: 'Sign Up',
                    description: 'Sign Up to your account',
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  _EmailInput(),
                  const SizedBox(height: 8),
                  _PasswordInput(),
                  const SizedBox(height: 8),
                  _ConfirmPasswordInput(),
                  const SizedBox(height: 8),
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
                    child: const SignUpButton()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return emailInputHelper(context, EmailType.signup, state);
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.obscureText != current.obscureText,
      builder: (context, state) {
        return passwordInputHelper(
            context, state, InputType.signup); // Pass InputType.signup here
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword ||
          previous.obscureText != current.obscureText,
      builder: (context, state) {
        return passwordInputHelper(context, state, InputType.confirmSignup);
      },
    );
  }
}
