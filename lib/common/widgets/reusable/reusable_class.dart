import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
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

  // details container
  Widget detailsContainer(context, txt1, txt2, txt3) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: screenSize.height * 0.1,
      width: screenSize.width * 0.95,
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1.5, color: cGrey.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                svgIcon(StaticData.time, 18.0, 18.0, cGrey),
                StaticData.gap1,
                TextFond().textWidget(txt1, 12.0, Weight.w5, cGrey),
              ],
            ),
            SizedBox(
              height: 20,
              width: 15,
              child: VerticalDivider(
                  width: 2, color: cGrey.withOpacity(0.3), thickness: 1),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                svgIcon(StaticData.view, 18.0, 18.0, cGrey),
                StaticData.gap1,
                TextFond().textWidget(txt2, 12.0, Weight.w5, cGrey),
              ],
            ),
            SizedBox(
              height: 20,
              width: 15,
              child: VerticalDivider(
                  width: 1.5, color: cGrey.withOpacity(0.3), thickness: 1),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                svgIcon(StaticData.applyicn, 18.0, 18.0, cGrey),
                StaticData.gap1,
                TextFond().textWidget(txt3, 12.0, Weight.w5, cGrey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // details container
  Widget detailsContainer1(context, txt1, txt2, txt3) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      // height: screenSize.height * 0.03,
      width: screenSize.width * 0.95,
      color: cGrey2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFond().textWidget(txt1, 12.0, Weight.w5, cGrey),
              ],
            ),
            const SizedBox(
              height: 20,
              width: 50,
              child: Icon(Icons.trip_origin_rounded, size: 6, color: cGrey),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFond().textWidget(txt2, 12.0, Weight.w5, cGrey),
              ],
            ),
            const SizedBox(
              height: 20,
              width: 50,
              child: Icon(Icons.trip_origin_rounded, size: 6, color: cGrey),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFond().textWidget(txt3, 12.0, Weight.w5, cGrey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
