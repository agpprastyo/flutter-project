import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hebalova_auth/repository/authentication_repository/authentication_repository.dart';

import 'app/bloc_observer.dart';
import 'app/view/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initialization(null);

  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(App(authenticationRepository: authenticationRepository));
  // FlutterNativeSplash.remove();
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 0));
}
