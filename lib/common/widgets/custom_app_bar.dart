import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/round_container.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    String url = '';

    // text widget
    final text = TextFond();
    return Padding(
      padding: EdgeInsets.only(top: StaticData.p5, bottom: StaticData.p4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: cGrey,
                backgroundImage: NetworkImage(url),
              ),
              StaticData.gap2,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text.textWidget('Judy Smith', 12, Weight.w6, cBlack),
                  text.textWidget('UI & UX Designer', 10, Weight.w4, cGrey),
                ],
              ),
            ],
          ),
          RoundContainer(
            icon: StaticData.notify,
            color: cWhite,
            icncolor: cBlack,
            border: Border.all(width: 1.5, color: cGrey),
          ),
        ],
      ),
    );
  }
}
