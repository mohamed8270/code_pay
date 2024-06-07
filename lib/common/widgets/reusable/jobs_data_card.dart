import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JobsDataCard extends StatelessWidget {
  const JobsDataCard(
      {super.key,
      required this.jobname,
      required this.companyname,
      required this.jobplace,
      required this.jobsalary,
      required this.description,
      required this.click});

  final String jobname;
  final String companyname;
  final String jobplace;
  final String jobsalary;
  final String description;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    // text widget
    final text = TextFond();
    return Container(
      height: screenSize.height * 0.5,
      width: screenSize.width,
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 1.5, color: cGrey.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: cGrey2,
                      backgroundImage: NetworkImage(''),
                    ),
                    StaticData.gap2,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text.textWidget(jobname, 14.0, Weight.w7, cBlack),
                        text.textWidget(jobplace, 12.0, Weight.w4, cGrey),
                      ],
                    ),
                  ],
                ),
                SvgPicture.network(
                  '',
                  height: 20,
                  width: 20,
                  colorFilter: const ColorFilter.mode(cBlack, BlendMode.srcIn),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
