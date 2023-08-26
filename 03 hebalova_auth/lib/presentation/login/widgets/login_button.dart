import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../constants/text_styles.dart';
import '../cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: Colors.white,
                ),
              )
            : InkWell(
                child: TextButton(
                  key: const Key('loginForm_continue_raisedButton'),
                  onPressed: state.isValid
                      ? () => context.read<LoginCubit>().loginWithCredentials()
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyles()
                            .mainBodyBold
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
