part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
    this.email = const Email.pure(),
    this.obscureText = true,
  });

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;
  final bool obscureText;

  @override
  // TODO: implement props
  List<Object?> get props => [
        email,
        password,
        status,
        isValid,
        errorMessage,
        obscureText,
      ];

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
    bool? obscureText,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
