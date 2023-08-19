import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/calculator/calculator_state.dart';
import 'calculator_view.dart';

class CaculatorPage extends StatelessWidget {
  const CaculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalculatorCubit(),
      child: const CalculatorView(),
    );
  }
}
