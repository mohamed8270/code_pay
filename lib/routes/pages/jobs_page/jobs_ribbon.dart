import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/utils/string_check.dart';
import 'package:flutter/material.dart';

dynamic ribbonCard(posteddata, appliedata, viewsdata, context) {
  var res = popularityPercent(
      posteddata == 'a month ago' ? '30' : '0', appliedata, viewsdata);
  String data = res.replaceAll(RegExp(r'[^0-9]'), '');
  int checkdata = int.parse(data);
  var txt = TextFond();

  // print([res, data, checkdata]);

  if (checkdata >= 60) {
    final scrnsize = MediaQuery.sizeOf(context);
    return Container(
      height: scrnsize.height * 0.025,
      width: scrnsize.width * 0.4,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          // bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      alignment: Alignment.center,
      child: txt.textWidget(res.toString(), 8.0, FontWeight.w500, cWhite),
    );
  } else {
    return null;
  }
}
