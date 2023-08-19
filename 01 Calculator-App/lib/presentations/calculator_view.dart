import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

import '../bloc/calculator/calculator_state.dart';
import '../presentations/widgets/custom_button.dart';
import '../presentations/widgets/theme_switch.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.w),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // themeSwitch(context),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.h,
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(20.h),
                              alignment: Alignment.centerRight,
                              child: Text(
                                state is CalculatorInitialState
                                    ? state.userInput
                                    : "", // Update accordingly
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.h),
                              alignment: Alignment.centerRight,
                              child: Text(
                                state is CalculatorInitialState
                                    ? state.result
                                    : "", // Update accordingly
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: GridView.builder(
                        itemCount: CalculatorCubit.buttonList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return customButton(
                            context,
                            CalculatorCubit.buttonList[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
