import 'dart:async';

import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/routes/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var txt = TextFond();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final scrnsize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: scrnsize.height,
        width: scrnsize.width,
        decoration: const BoxDecoration(color: cGreen),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: txt.textWidget(StaticData.name.toUpperCase(), 40.0,
                    FontWeight.w800, cWhite),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: txt.textWidget(
                  StaticData.splashDes, 12.0, FontWeight.w500, cWhite),
            )
          ],
        ),
      ),
    );
  }
}
