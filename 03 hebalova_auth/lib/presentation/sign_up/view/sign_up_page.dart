import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hebalova_auth/presentation/sign_up/view/sign_up_form.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../widgets/banner_image.dart';
import '../cubit/sign_up_cubit.dart';
import '../widgets/back_pressed_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 130.h,
          bottom: 0,
          left: 0,
          right: 0,
          child: BlocProvider<SignUpCubit>(
            create: (_) =>
                SignUpCubit(context.read<AuthenticationRepository>()),
            child: const SignUpForm(),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: BannerImage(),
        ),
        backPressedButton(context)
      ]),
    );
  }
}
