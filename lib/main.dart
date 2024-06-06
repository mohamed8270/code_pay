import 'package:code_pay/routes/wrapper/wrapper.dart';
import 'package:code_pay/utils/device/system_chrome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  SystemChromeMethod.systemUImode();
  SystemChromeMethod.systemUIoverlay();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrapper();
  }
}
