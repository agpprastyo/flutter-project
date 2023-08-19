part of 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorInitialState("", "0"));

  static const List<String> buttonList = [
    'AC',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'C',
    '0',
    '.',
    '=',
  ];

  Stream<CalculatorState> mapEventToState(CalculatorEvent event) async* {
    if (event is ButtonPressedEvent) {
      try {
        String userInput = "";
        String result = "";

        if (state is CalculatorInitialState) {
          userInput = (state as CalculatorInitialState).userInput;
          result = (state as CalculatorInitialState).result;
        }

        if (event.text == "AC") {
          yield CalculatorInitialState("", "0");
        } else if (event.text == "C") {
          if (userInput.isNotEmpty) {
            userInput = userInput.substring(0, userInput.length - 1);
          }
          yield CalculatorInitialState(userInput, result);
        } else if (event.text == "=") {
          result = calculate(userInput);
          userInput = result;

          if (userInput.endsWith(".0")) {
            userInput = userInput.replaceAll(".0", "");
          }

          if (result.endsWith(".0")) {
            result = result.replaceAll(".0", "");
          }
          yield CalculatorInitialState(userInput, result);
        } else {
          userInput += event.text;
          yield CalculatorInitialState(userInput, result);
        }
      } catch (_) {
        yield CalculatorErrorState("Error");
      }
    }
  }

  void handleButtonPressed(String text) {
    try {
      if (text == "AC") {
        emit(CalculatorInitialState("", "0"));
      } else if (text == "C") {
        if (state is CalculatorInitialState) {
          String userInput = (state as CalculatorInitialState).userInput;
          if (userInput.isNotEmpty) {
            userInput = userInput.substring(0, userInput.length - 1);
          }
          emit(CalculatorInitialState(
              userInput, (state as CalculatorInitialState).result));
        }
      } else if (text == "=") {
        if (state is CalculatorInitialState) {
          String userInput = (state as CalculatorInitialState).userInput;
          String result = calculate(userInput);
          userInput = result;

          if (userInput.endsWith(".0")) {
            userInput = userInput.replaceAll(".0", "");
          }

          emit(CalculatorInitialState(userInput, result));
        }
      } else {
        if (state is CalculatorInitialState) {
          String userInput = (state as CalculatorInitialState).userInput + text;
          emit(CalculatorInitialState(
              userInput, (state as CalculatorInitialState).result));
        }
      }
    } catch (_) {
      emit(CalculatorErrorState("Error"));
    }
  }

  String calculate(String userInput) {
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (_) {
      return "Error";
    }
  }

  Color getColor(String text) {
    if (text == "/" ||
        text == "*" ||
        text == "+" ||
        text == "-" ||
        text == "C" ||
        text == "(" ||
        text == ")") {
      return const Color.fromARGB(255, 252, 100, 100);
    }
    return Colors.white;
  }

  Color getBgColor(String text) {
    if (text == "AC") {
      return const Color.fromARGB(255, 252, 100, 100);
    }
    if (text == "=") {
      return const Color.fromARGB(255, 104, 204, 159);
    }
    return const Color(0xFF1d2630);
  }
}
