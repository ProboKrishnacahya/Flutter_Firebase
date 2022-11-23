import 'package:firebase_baas/shared/constant.dart';
import 'package:firebase_baas/views/pages/pages.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase BaaS',
      theme: ThemeData(
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Style.blue500),
            foregroundColor: MaterialStateProperty.all<Color>(Style.white),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(16),
            ),
          ),
        ),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
