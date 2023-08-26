import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../constants/text_styles.dart';
import '../cubit/sign_up_cubit.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
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
                  key: const Key('signUpForm_continue_raisedButton'),
                  // style: ElevatedButton.styleFrom(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(30),
                  //   ),
                  //   backgroundColor: Colors.orangeAccent,
                  // ),
                  onPressed: state.isValid
                      ? () => context.read<SignUpCubit>().signUpFormSubmitted()
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Register',
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
