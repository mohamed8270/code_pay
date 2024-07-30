import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:flutter/material.dart';

class SnackBarRepo extends StatelessWidget {
  const SnackBarRepo({super.key, required this.txt, required this.bg});

  final String txt;
  final Color bg;

  @override
  Widget build(BuildContext context) {
    var text = TextFond();
    return ScaffoldMessenger(
      child: SnackBar(
        backgroundColor: cGreen,
        content: text.textWidget(
            'Job data successfuly added', 12.0, FontWeight.w600, cWhite),
      ),
    );
  }
}
