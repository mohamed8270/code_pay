import 'package:code_pay/common/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ReusableClass extends GetxController {
  // outline icon
  Widget svgIconOutline(icon) {
    return SvgPicture.asset(
      icon,
      height: 24,
      width: 24,
      colorFilter: const ColorFilter.mode(cBlack, BlendMode.srcIn),
    );
  }

  // filled icon
  Widget svgIconFilled(icon) {
    return SvgPicture.asset(
      icon,
      height: 25,
      width: 25,
      colorFilter: const ColorFilter.mode(cGreen, BlendMode.srcIn),
    );
  }

  // filled icon
  Widget svgIcon(icon, h, w, color) {
    return SvgPicture.network(
      icon,
      height: h,
      width: w,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  // loading widget
  Widget circularLoading() {
    return const Center(
      child: SizedBox(
        height: 18,
        width: 18,
        child: CircularProgressIndicator(
          color: cGreen,
          strokeAlign: 3,
          strokeWidth: 3,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }

  // svg offline
  Widget svgOffline(icn, h, w, c) {
    return SvgPicture.asset(
      icn,
      height: h,
      width: w,
      colorFilter: ColorFilter.mode(c, BlendMode.srcIn),
    );
  }
}
