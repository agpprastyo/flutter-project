abstract class CalculatorEvent {}

class ButtonPressedEvent extends CalculatorEvent {
  final String text;

  ButtonPressedEvent(this.text);
}
