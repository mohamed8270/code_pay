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
      padding: EdgeInsets.only(top: StaticData.p5, bottom: StaticData.p1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: cGrey2,
                backgroundImage: NetworkImage(url),
              ),
              StaticData.gap2,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text.textWidget('Judy Smith', 14.0, Weight.w7, cBlack),
                  text.textWidget('UI & UX Designer', 12.0, Weight.w4, cGrey),
                ],
              ),
            ],
          ),
          RoundContainer(
            icon: StaticData.notify,
            color: cGrey2,
            icncolor: cBlack,
            border: Border.all(width: 1.5, color: cGrey.withOpacity(0.2)),
          ),
        ],
      ),
    );
  }
}

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar(
      {super.key,
      required this.title,
      required this.action,
      required this.leading,
      required this.clicklead,
      required this.clickaction});

  final String title;
  final String action;
  final String leading;
  final VoidCallback clicklead;
  final VoidCallback clickaction;

  @override
  Widget build(BuildContext context) {
    // text widget
    final text = TextFond();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RoundContainer(
          click: clicklead,
          icon: leading,
          color: cWhite.withOpacity(0.5),
          icncolor: cWhite,
        ),
        text.textWidget(title, 14.0, Weight.w6, cWhite),
        RoundContainer(
          click: clickaction,
          icon: action,
          color: cWhite.withOpacity(0.5),
          icncolor: cWhite,
        ),
      ],
    );
  }
}
