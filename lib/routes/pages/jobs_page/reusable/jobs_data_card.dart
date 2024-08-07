import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/interface/custom_button.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/routes/pages/jobs_page/jobs_ribbon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobsDataCard extends StatelessWidget {
  const JobsDataCard(
      {super.key,
      required this.jobname,
      required this.companyname,
      required this.jobsalary,
      required this.description,
      required this.applyclick,
      required this.click,
      required this.days,
      required this.views,
      required this.apply,
      required this.jobposted,
      required this.jobapplied,
      required this.jobviews});

  final String jobname;
  final String companyname;
  final String days;
  final String views;
  final String apply;
  final String jobsalary;
  final String jobposted;
  final String jobapplied;
  final String jobviews;
  final String description;
  final VoidCallback applyclick;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    // text widget
    var text = TextFond();
    // reusable
    var reusable = ReusableClass();
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: GestureDetector(
        onTap: click,
        child: Container(
          height: screenSize.height * 0.34,
          width: screenSize.width,
          decoration: BoxDecoration(
            color: cWhite,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1.3,
              color: cBlack.withOpacity(0.05),
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ribbonCard(jobposted, jobapplied, jobviews, context),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        reusable.svgIcon(StaticData.org, 50.0, 50.0, cBlack),
                        StaticData.gap2,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: screenSize.width * 0.71,
                              child: Text(
                                jobname,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: cBlack,
                                ),
                              ),
                            ),
                            StaticData.gap1,
                            text.textWidget(
                                companyname == ''
                                    ? 'Company Confidential'
                                    : companyname,
                                11.0,
                                FontWeight.w500,
                                cBlack.withOpacity(0.5)),
                          ],
                        ),
                      ],
                    ),
                    StaticData.gap2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        EssentialsRepo(txt: days, icn: StaticData.time),
                        EssentialsRepo(txt: views, icn: StaticData.view),
                        EssentialsRepo(txt: apply, icn: StaticData.applyicn),
                      ],
                    ),
                    StaticData.gap3,
                    SizedBox(
                        height: screenSize.height * 0.083,
                        // width: screenSize.width * 0.95,
                        child: Text(
                          description,
                          maxLines: 5,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: cBlack.withOpacity(0.5),
                            height: 1.7,
                          ),
                        )),
                    StaticData.gap3,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            text.textWidget(
                                '₹ ${jobsalary == '' ? 'Not Specified' : jobsalary}',
                                14.0,
                                FontWeight.w600,
                                cGreen),
                            StaticData.gap1,
                            text.textWidget('/Month', 10.0, FontWeight.w400,
                                cBlack.withOpacity(0.5)),
                          ],
                        ),
                        CustomBtn(
                          h: 0.04,
                          w: 0.2,
                          bg: cGreen,
                          txt: 'Apply Now',
                          txts: 10.0,
                          txtcolor: cWhite,
                          r: 6,
                          click: applyclick,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EssentialsRepo extends StatelessWidget {
  const EssentialsRepo({super.key, required this.txt, required this.icn});

  final String txt;
  final String icn;

  @override
  Widget build(BuildContext context) {
    final scrnsize = MediaQuery.sizeOf(context);
    var icon = ReusableClass();
    var text = TextFond();
    return Container(
      height: scrnsize.height * 0.04,
      width: scrnsize.width * 0.25,
      decoration: BoxDecoration(
        color: cBlack.withOpacity(0.07),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon.svgIcon(icn, 14.0, 14.0, cBlack),
          StaticData.gap1,
          text.textWidget(txt, 8.0, FontWeight.w600, cBlack)
        ],
      ),
    );
  }
}
