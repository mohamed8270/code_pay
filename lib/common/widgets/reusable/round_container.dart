import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer(
      {super.key,
      required this.icon,
      required this.color,
      required this.icncolor,
      this.border});

  final String icon;
  final Color color;
  final Color icncolor;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: screenSize.height * 0.1,
      width: screenSize.width * 0.1,
      decoration:
          BoxDecoration(color: color, shape: BoxShape.circle, border: border),
      alignment: Alignment.center,
      child: SvgPicture.network(
        icon,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(icncolor, BlendMode.srcIn),
      ),
    );
  }
}
