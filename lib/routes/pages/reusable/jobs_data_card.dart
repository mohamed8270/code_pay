import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/interface/custom_button.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobsDataCard extends StatelessWidget {
  const JobsDataCard(
      {super.key,
      required this.jobname,
      required this.companyname,
      required this.jobplace,
      required this.jobsalary,
      required this.description,
      required this.applyclick,
      required this.click});

  final String jobname;
  final String companyname;
  final String jobplace;
  final String jobsalary;
  final String description;
  final VoidCallback applyclick;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    // text widget
    final text = TextFond();
    // reusable
    final reusable = Get.put(ReusableClass());
    String url =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png';
    return GestureDetector(
      onTap: click,
      child: Container(
        height: screenSize.height * 0.32,
        width: screenSize.width,
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            width: 1.5,
            color: cGrey.withOpacity(0.2),
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          boxShadow: [
            BoxShadow(
              color: cBlack.withOpacity(0.03),
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
              spreadRadius: 2,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: cWhite,
                        backgroundImage: NetworkImage(url),
                      ),
                      StaticData.gap2,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text.textWidget(jobname, 15.0, Weight.w7, cBlack),
                          text.textWidget(companyname, 12.0, Weight.w4, cGrey),
                        ],
                      ),
                    ],
                  ),
                  reusable.svgIcon(StaticData.bookmark, 20.0, 20.0, cBlack)
                ],
              ),
              StaticData.gap2,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      reusable.svgIcon(StaticData.location, 18.0, 18.0, cBlack),
                      StaticData.gap1,
                      text.textWidget(
                          jobplace, 12.0, Weight.w5, cBlack.withOpacity(0.7))
                    ],
                  ),
                  StaticData.gap4,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      reusable.svgIcon(StaticData.money, 18.0, 18.0, cBlack),
                      StaticData.gap1,
                      text.textWidget(
                          jobsalary, 12.0, Weight.w5, cBlack.withOpacity(0.7))
                    ],
                  )
                ],
              ),
              StaticData.gap2,
              SizedBox(
                height: screenSize.height * 0.075,
                // width: screenSize.width * 0.95,
                child: text.textWidget(description, 12.0, Weight.w5,
                    cBlack.withOpacity(0.7), TextOverflow.fade, 1.5),
              ),
              StaticData.gap2,
              CustomButton(
                h: 0.075,
                w: 0.95,
                txt: StaticData.apply,
                color: cVoilet,
                txtcolor: cWhite,
                icncolor: cWhite,
                click: applyclick,
              )
            ],
          ),
        ),
      ),
    );
  }
}
