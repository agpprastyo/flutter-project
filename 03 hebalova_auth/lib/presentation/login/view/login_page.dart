import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../widgets/banner_image.dart';
import '../cubit/login_cubit.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 130.h,
            bottom: 0,
            left: 0,
            right: 0,
            child: BlocProvider(
              create: (_) =>
                  LoginCubit(context.read<AuthenticationRepository>()),
              child: const LoginForm(),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: BannerImage(),
          ),
        ],
      ),
    );
  }
}
