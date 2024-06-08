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
      height: 24,
      width: 24,
      colorFilter: const ColorFilter.mode(cBlack, BlendMode.srcIn),
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

  // 
}
