import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../constants/text_styles.dart';
import '../presentation/login/cubit/login_cubit.dart';
import '../presentation/sign_up/cubit/sign_up_cubit.dart';

enum InputType { login, signup, confirmSignup }

TextField passwordInputHelper(
    BuildContext context, dynamic state, InputType inputType) {
  return TextField(
    key: _getTextFieldKey(inputType),
    onChanged: _getOnChangedCallback(context, inputType),
    obscureText: _getObscureText(state, inputType),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      filled: true,
      fillColor: AppColors.lightLight2,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      hintText: _getHintText(state, inputType),
      hintStyle: TextStyles().mainBodyRegular.copyWith(color: Colors.black26),
      // labelText: 'password',
      helperText: '',
      errorText: _getErrorText(state, inputType),
      suffixIcon: IconButton(
        icon: Icon(
          _getSuffixIcon(state),
          color: Colors.black26,
        ),
        onPressed: _getSuffixIconPressedCallback(context, inputType),
      ),
    ),
  );
}

_getHintText(state, InputType inputType) {
  switch (inputType) {
    case InputType.signup:
      return 'password';
    case InputType.confirmSignup:
      return 'confirm password';
    default:
      return 'password';
  }
}

Key _getTextFieldKey(InputType inputType) {
  switch (inputType) {
    case InputType.signup:
      return const Key('signUpForm_passwordInput_textField');
    case InputType.confirmSignup:
      return const Key('signUpForm_confirmedPasswordInput_textField');
    default:
      return const Key('loginForm_passwordInput_textField');
  }
}

ValueChanged<String> _getOnChangedCallback(
    BuildContext context, InputType inputType) {
  switch (inputType) {
    case InputType.signup:
      return (password) =>
          context.read<SignUpCubit>().passwordChanged(password);
    case InputType.confirmSignup:
      return (confirmPassword) =>
          context.read<SignUpCubit>().confirmedPasswordChanged(confirmPassword);
    default:
      return (password) => context.read<LoginCubit>().passwordChanged(password);
  }
}

bool _getObscureText(dynamic state, InputType inputType) {
  return inputType != InputType.login ? true : state.obscureText;
}

String? _getErrorText(dynamic state, InputType inputType) {
  if (state.password.displayError != null && inputType == InputType.login) {
    return 'invalid password';
  }
  if (state.password.displayError != null &&
      inputType == InputType.confirmSignup &&
      state.password.value.isNotEmpty) {
    return 'passwords do not match';
  }
  return null;
}

IconData _getSuffixIcon(dynamic state) {
  return state.obscureText ? Icons.visibility_off : Icons.visibility;
}

VoidCallback? _getSuffixIconPressedCallback(
    BuildContext context, InputType inputType) {
  if (inputType == InputType.login) {
    return () {
      context.read<LoginCubit>().obscureTextChange();
    };
  }
  if (inputType == InputType.signup || inputType == InputType.confirmSignup) {
    return () {
      context.read<SignUpCubit>().obscureTextChange();
    };
  }
  return null;
}
