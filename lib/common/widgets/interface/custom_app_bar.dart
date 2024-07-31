import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    String url =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png';

    // text widget
    var txt = TextFond();
    var icn = ReusableClass();
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.3, color: cBlack.withOpacity(0.05)),
        ),
      ),
      alignment: Alignment.center,
      child: AppBar(
        elevation: 0,
        backgroundColor: cWhite,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(13),
          child: icn.svgIcon(StaticData.menu, 12.0, 12.0, cGreen),
        ),
        title: txt.textWidget(
            'Your perfect job here 🔥', 12.0, FontWeight.w600, cBlack),
        actions: [
          icn.svgIcon(StaticData.notify, 24.0, 24.0, cBlack),
          StaticData.gap3,
          CircleAvatar(
            radius: 13,
            backgroundImage: NetworkImage(url),
            backgroundColor: cbGrey,
          ),
          StaticData.gap2,
        ],
      ),
    );
  }
}
