import 'package:code_pay/constants/theme.dart';
import 'package:code_pay/views/pages/home_page.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Pay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: cWhite),
        useMaterial3: true,
      ),
      routes: {
        'homepage': (c) => const HomePage(),
      },
      home: const HomePage(),
    );
  }
}
