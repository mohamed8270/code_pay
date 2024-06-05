import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/round_container.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    String url =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png';

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
                  text.textWidget('Judy Smith', 12.0, Weight.w6, cBlack),
                  text.textWidget('UI & UX Designer', 10.0, Weight.w4, cGrey),
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

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // text widget
    final text = TextFond();
    return Row(
      children: [
        RoundContainer(
          click: () {},
          icon: StaticData.back,
          color: cWhite.withOpacity(0.5),
          icncolor: cWhite,
        ),
        text.textWidget(StaticData.details, 14, Weight.w6, cWhite),
        RoundContainer(
          click: () {},
          icon: StaticData.share,
          color: cWhite.withOpacity(0.5),
          icncolor: cWhite,
        ),
      ],
    );
  }
}
