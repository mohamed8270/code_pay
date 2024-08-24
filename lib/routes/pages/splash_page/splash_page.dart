import 'dart:async';

import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/routes/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var txt = TextFond();
  var use = ReusableClass();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF0caf60),
        systemNavigationBarColor: Color(0xFF0caf60),
        statusBarIconBrightness: Brightness.light,
      ),
    );
    Timer(const Duration(seconds: 6), () {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: cWhite,
          systemNavigationBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      );
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
        decoration: const BoxDecoration(color: Color(0xFF0caf60)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    use.svgIcon(StaticData.logo, 26.0, 26.0, cWhite),
                    StaticData.gap2,
                    Text(
                      'CODE PAY',
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: cWhite,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: scrnsize.width * 0.85,
                child: txt.textWidget(
                    StaticData.splashDes,
                    10.0,
                    FontWeight.w500,
                    cWhite,
                    TextOverflow.visible,
                    1.5,
                    TextAlign.center),
              ),
            ),
            StaticData.gap3,
          ],
        ),
      ),
    );
  }
}
