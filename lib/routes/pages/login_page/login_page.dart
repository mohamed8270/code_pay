import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var txt = TextFond();

    final scrnsize = MediaQuery.sizeOf(context);

    // info
    String name = 'Code Pay';
    String sub1 = 'Job Offer';
    String sub2 =
        'Get your dream job along with perfect insigts and get placed in well reputed company';
    String t1 = 'Place with talent';
    String btn = 'Continue with Google';
    String img = 'assets/images/health.png';
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              txt.textWidget(name, 24.0, FontWeight.w800, cBlack),
              StaticData.gap1,
              Container(
                height: scrnsize.height * 0.6,
                width: scrnsize.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.scaleDown,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              StaticData.gap1,
              txt.textWidget(sub1, 10.0, FontWeight.w600, cBlack),
              StaticData.gap3,
              txt.textWidget(t1, 18.0, FontWeight.w600, cBlack),
              StaticData.gap3,
              SizedBox(
                width: scrnsize.width * 0.85,
                child: txt.textWidget(sub2, 11.0, FontWeight.w400, cBlack,
                    TextOverflow.visible, 1.5, TextAlign.center),
              ),
              StaticData.gap3,
              GestureDetector(
                onTap: () => Get.toNamed('/bottomnavbar'),
                child: Container(
                  height: scrnsize.height * 0.065,
                  width: scrnsize.width * 0.85,
                  decoration: const BoxDecoration(color: cBlack),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.network(StaticData.google,
                          height: 18, width: 18),
                      StaticData.gap3,
                      txt.textWidget(btn, 11.0, FontWeight.w500, cWhite),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
