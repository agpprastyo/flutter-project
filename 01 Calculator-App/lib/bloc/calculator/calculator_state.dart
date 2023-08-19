import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

import 'calculator_event.dart';

part 'calculator_cubit.dart';

abstract class CalculatorState {}

class CalculatorInitialState extends CalculatorState {
  final String userInput;
  final String result;

  CalculatorInitialState(this.userInput, this.result);
}

class CalculatorErrorState extends CalculatorState {
  final String errorMessage;

  CalculatorErrorState(this.errorMessage);
}
