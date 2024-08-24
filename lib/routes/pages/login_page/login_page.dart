import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var txt = TextFond();
    var use = ReusableClass();
    final scrnsize = MediaQuery.sizeOf(context);

    // info
    String name = 'Code Pay';
    String sub1 = 'Job Offer';
    String sub2 = 'Get your dream job along with perfect insigts about it';
    String t1 = 'Place with talent';
    String btn = 'Continue with Google';
    String img = 'assets/images/health.png';
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              txt.textWidget(name, 18.0, FontWeight.w800, cBlack),
              StaticData.gap1,
              Container(
                height: scrnsize.height * 0.5,
                width: scrnsize.width * 0.5,
                decoration: BoxDecoration(
                  color: cbGrey,
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.scaleDown,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              StaticData.gap1,
              txt.textWidget(sub1, 10.0, FontWeight.w600, cBlack),
              StaticData.gap2,
              txt.textWidget(t1, 10.0, FontWeight.w600, cBlack),
              StaticData.gap2,
              txt.textWidget(sub2, 10.0, FontWeight.w600, cBlack),
              StaticData.gap2,
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: scrnsize.height * 0.055,
                  width: scrnsize.width * 0.75,
                  decoration: const BoxDecoration(color: cBlack),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      use.svgIcon(
                          StaticData.google, 12.0, 12.0, Colors.transparent),
                      StaticData.gap1,
                      txt.textWidget(btn, 12.0, FontWeight.w600, cWhite),
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
