import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/theme/theme_cubit.dart';

Widget themeSwitch(BuildContext context) {
  return SizedBox(
    width: 80.w,
    child: AnimatedToggleSwitch<bool>.dual(
      current: context.select(
          (ThemeCubit cubit) => cubit.state.brightness == Brightness.light),
      first: false,
      second: true,
      dif: 5.0.h,
      borderColor: Colors.transparent,
      borderWidth: 5.0.h,
      height: 40.h,
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 1.5),
        ),
      ],
      onChanged: (value) {
        BlocProvider.of<ThemeCubit>(context).toggleTheme();
        return Future.delayed(const Duration(seconds: 2));
      },
      colorBuilder: (b) => b ? Colors.red : Colors.green,
      iconBuilder: (value) => value
          ? Icon(
              Icons.light_mode_rounded,
              size: 20.h,
            )
          : Icon(
              Icons.dark_mode_rounded,
              size: 20.h,
            ),
    ),
  );
}
