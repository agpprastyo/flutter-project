import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../constants/text_styles.dart';
import '../presentation/login/cubit/login_cubit.dart';
import '../presentation/sign_up/cubit/sign_up_cubit.dart';

enum EmailType {
  login,
  signup,
}

TextField emailInputHelper(
    BuildContext context, EmailType emailType, dynamic state) {
  String hintText =
      emailType == EmailType.login ? 'hmm@gmail.com' : 'Enter your email';
  String errorText =
      emailType == EmailType.login && state.email.displayError != null
          ? 'invalid email'
          : '';
  return TextField(
    key: emailType == EmailType.login
        ? const Key('loginForm_emailInput_textField')
        : const Key('signUpForm_passwordInput_textField'),
    onChanged: (email) => emailType == EmailType.login
        ? context.read<LoginCubit>().emailChanged(email)
        : context.read<SignUpCubit>().emailChanged(email),
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      filled: true,
      fillColor: AppColors.lightLight2,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      hintText: hintText,
      hintStyle: TextStyles().mainBodyRegular.copyWith(color: Colors.black26),
      helperText: '',
      errorText: errorText,
    ),
  );
}
