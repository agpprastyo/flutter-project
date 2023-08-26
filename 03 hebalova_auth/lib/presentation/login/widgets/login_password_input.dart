import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/password_input_helper.dart';
import '../cubit/login_cubit.dart';

class PasswordInput extends StatelessWidget {
  final InputType inputType;

  const PasswordInput({Key? key, required this.inputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.obscureText != current.obscureText,
      builder: (context, state) {
        return passwordInputHelper(
            context, state, inputType); // Use the method from the new file
      },
    );
  }
}
