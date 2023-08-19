import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

import '../../bloc/calculator/calculator_state.dart';

Widget customButton(BuildContext context, String text) {
  return Stack(
    children: [
      Positioned(
        top: 0,
        bottom: 0,
        right: 0,
        left: 0,
        child: NeumorphicButton(
          style: NeumorphicStyle(
              shape: NeumorphicShape.convex,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: 2,
              lightSource: LightSource.top,
              color: Colors.black),
          onPressed: () {
            BlocProvider.of<CalculatorCubit>(context).handleButtonPressed(text);
          },
        ),
      ),
      Positioned(
        top: 0,
        bottom: 0,
        right: 0,
        left: 0,
        child: NeumorphicButton(
          style: NeumorphicStyle(
              // shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: -5,
              lightSource: LightSource.bottomLeft,
              color: Colors.black),
          onPressed: () {
            BlocProvider.of<CalculatorCubit>(context).handleButtonPressed(text);
          },
        ),
      ),
      Center(
        child: Text(
          text,
          style: TextStyle(
              color: CalculatorCubit().getColor(text),
              fontSize: 25.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
