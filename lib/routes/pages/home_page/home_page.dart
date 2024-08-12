import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/interface/custom_app_bar.dart';
import 'package:code_pay/common/widgets/interface/custom_button.dart';
import 'package:code_pay/common/widgets/reusable/user_input_section.dart';
import 'package:code_pay/data/repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // text widget
    var txt = TextFond();
    // controllers
    var jobController = TextEditingController();
    // repository
    final repository = Get.put(ApiRepository());

    return Scaffold(
      backgroundColor: cbGrey,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: StaticData.heroText1,
                style: txt.textStyle(40.0, FontWeight.w800, cBlack, 1.4),
                children: [
                  TextSpan(
                    text: StaticData.heroText2,
                    style: txt.textStyle(40.0, FontWeight.w800, cGreen, 1.4),
                  ),
                ],
              ),
            ),
            StaticData.gap1,
            txt.textWidget(StaticData.heroText3, 11.0, FontWeight.w300,
                cBlack.withOpacity(0.5)),
            StaticData.gap3,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserInputSection(
                  text: 'Get job analytics',
                  icn: StaticData.search,
                  type: TextInputType.url,
                  height_: 0.058,
                  width_: 0.7,
                  r: 8,
                  controller: jobController,
                ),
                CustomBtn(
                  click: () async {
                    await repository.scrapeJobs(jobController.text);
                    jobController.clear();
                  },
                  h: 0.058,
                  w: 0.21,
                  bg: cBlack,
                  txt: 'Get a job',
                  txts: 10.0,
                  txtcolor: cWhite,
                  r: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
