import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/interface/status_view.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/common/widgets/reusable/user_input_section.dart';
import 'package:code_pay/data/service/http_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailDialogueBox {
  Future<void> mailDialgoueBox(BuildContext context, String id) async {
    var scrnsize = MediaQuery.sizeOf(context);
    var use = ReusableClass();
    var txt = TextFond();
    var httpClient = HttpClientFetch();
    var emailController = TextEditingController();
    String t1 = 'Dont miss the next big opportunity to be placed!';
    String t2 = 'Never miss a bargain with our timely alerts!';
    String t3 = 'Email Address';
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: cWhite,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              use.svgIcon(StaticData.logo, 28.0, 28.0, cGreen),
              GestureDetector(
                onTap: () => Get.back(),
                child: use.svgIcon(StaticData.quit, 20.0, 20.0, cBlack),
              ),
            ],
          ),
          content: SizedBox(
            height: scrnsize.height * 0.21,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                txt.textWidget(t1, 14.0, FontWeight.w600, cBlack),
                StaticData.gap2,
                txt.textWidget(t2, 8.0, FontWeight.w500, cBlack),
                StaticData.gap3,
                txt.textWidget(t3, 8.0, FontWeight.w500, cBlack),
                StaticData.gap1,
                UserInputSection(
                  text: 'mail.com',
                  icn: StaticData.mail,
                  type: TextInputType.emailAddress,
                  height_: 0.058,
                  width_: 0.95,
                  controller: emailController,
                  r: 5.0,
                ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                if (emailController.text.isEmpty) {
                  const SnackBarRepo(
                      txt: 'Please enter email!', bg: Colors.red);
                } else if (emailController.text.isNotEmpty) {
                  String email = emailController.text;
                  httpClient.insertEmail(id, email);
                  Get.back();
                }
              },
              child: Container(
                height: scrnsize.height * 0.055,
                width: scrnsize.width,
                decoration: BoxDecoration(
                  color: cBlack,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: txt.textWidget('Track', 12.0, FontWeight.w600, cWhite),
              ),
            ),
          ],
        );
      },
    );
  }
}
