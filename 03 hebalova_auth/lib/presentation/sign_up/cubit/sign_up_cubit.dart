import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/form_inputs/confirmed_password.dart';
import '../../../repository/form_inputs/email.dart';
import '../../../repository/form_inputs/password.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository) : super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;

  void obscureTextChange() async {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate(
          [
            email,
            state.password,
            state.confirmedPassword,
          ],
        ),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
        password: password.value, value: state.confirmedPassword.value);
    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate(
          [state.email, password, confirmedPassword],
        ),
      ),
    );
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate([
          state.email,
          state.password,
          confirmedPassword,
        ]),
      ),
    );
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      // Step 1: Sign up the user using your authentication repository
      await _authenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,
      );

      // Step 2: After successful authentication, create a Firestore document for the user
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Generate a username from the Gmail address (before the @ symbol)
        final emailParts = user.email?.split('@');
        final generatedUsername = emailParts?[0];

        final userData = {
          'name': generatedUsername, // Use Gmail name or generated username
          'username': null, // Initially null username
          // Add other fields as needed
        };

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(userData);
      }

      // Step 3: Update the state indicating successful registration
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
