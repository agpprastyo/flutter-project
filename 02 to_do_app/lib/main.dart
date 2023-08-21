import 'package:flutter/material.dart';
import 'package:to_do_app/screen/to_do_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To Do App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
        useMaterial3: true,
        appBarTheme:
            const AppBarTheme(centerTitle: true, foregroundColor: Colors.red),
      ),
      home: const TodoListScreen(),
    );
  }
}
