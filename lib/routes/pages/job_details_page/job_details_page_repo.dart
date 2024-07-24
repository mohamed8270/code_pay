import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/interface/custom_button.dart';
import 'package:code_pay/common/widgets/interface/popular_category.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/routes/pages/jobs_page/reusable/jobs_data_card.dart';
import 'package:code_pay/utils/expandable_text.dart';
import 'package:flutter/material.dart';

class JobDetailsPageRepo extends StatelessWidget {
  const JobDetailsPageRepo(
      {super.key,
      required this.jobname,
      required this.jobplace,
      required this.jobcompany,
      required this.jobposted,
      required this.jobapplied,
      required this.jobveiwed,
      required this.joblocation,
      required this.experience,
      required this.description,
      required this.jobtype,
      required this.jobindustry,
      required this.jobfunction,
      required this.skills,
      required this.jobsource,
      required this.companyurl,
      required this.jobsalary,
      required this.roles});

  final String jobname;
  final String jobplace;
  final String jobcompany;
  final String jobsalary;
  final String jobposted;
  final String jobapplied;
  final String jobveiwed;
  final String joblocation;
  final String experience;
  final String description;
  final String jobtype;
  final String jobindustry;
  final String jobfunction;
  final List skills;
  final String jobsource;
  final String companyurl;
  final List roles;

  @override
  Widget build(BuildContext context) {
    // text widget
    var text = TextFond();
    // reusable
    var reusable = ReusableClass();

    final screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StaticData.gap2,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              reusable.svgIcon(StaticData.org, 60.0, 60.0, cBlack),
              StaticData.gap2,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text.textWidget(jobname, 15.0, Weight.w7, cBlack),
                  StaticData.gap1,
                  text.textWidget(
                      jobcompany, 12.0, Weight.w4, cBlack.withOpacity(0.5)),
                ],
              ),
            ],
          ),
          StaticData.gap3,
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: screenSize.height * 0.05,
                  width: screenSize.width * 0.3,
                  decoration: BoxDecoration(
                    color: cWhite,
                    border:
                        Border.all(color: cBlack.withOpacity(0.1), width: 1.3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  alignment: Alignment.center,
                  child: text.textWidget(
                      '🔔  Get Notified', 10.0, FontWeight.w600, cBlack),
                ),
              ),
              StaticData.gap2,
              CustomBtn(
                h: 0.05,
                w: 0.25,
                bg: cGreen,
                txt: 'Apply Now',
                txts: 10.0,
                txtcolor: cWhite,
                r: 6,
                click: () {},
              ),
            ],
          ),
          StaticData.gap5,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: screenSize.height * 0.038,
                width: screenSize.width * 0.013,
                decoration: const BoxDecoration(
                  color: cGreen,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
              ),
              StaticData.gap3,
              text.textWidget('₹ $jobsalary', 14.0, FontWeight.w400, cGreen),
              StaticData.gap1,
              text.textWidget(
                  '/per annum', 11.0, FontWeight.w400, cBlack.withOpacity(0.4)),
            ],
          ),
          StaticData.gap2,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EssentialsRepo(txt: jobposted, icn: StaticData.time),
              StaticData.gap1,
              EssentialsRepo(txt: jobveiwed, icn: StaticData.view),
              StaticData.gap1,
              EssentialsRepo(txt: jobapplied, icn: StaticData.applyicn),
            ],
          ),
          StaticData.gap2,
          PopularCategory(txt: '258.98% peoples choice 👍', click: () {}),
          StaticData.gap6,
          Row(
            children: [
              JobdataRepo(icn: StaticData.location, text: joblocation),
              SizedBox(
                height: 18,
                child: VerticalDivider(
                    width: 30, thickness: 1.5, color: cBlack.withOpacity(0.3)),
              ),
              JobdataRepo(icn: StaticData.bag, text: experience),
            ],
          ),
          StaticData.gap1,
          ExpandableText(maxLines: 800, minLines: 5, text: description),
          // text.textWidget(description, 10.0, FontWeight.w500, cBlack,
          //     TextOverflow.visible, 1.9, TextAlign.justify)
        ],
      ),
    );
  }
}

class JobdataRepo extends StatelessWidget {
  const JobdataRepo({super.key, required this.icn, required this.text});

  final String icn;
  final String text;

  @override
  Widget build(BuildContext context) {
    var svg = ReusableClass();
    var txt = TextFond();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        svg.svgIcon(icn, 18.0, 18.0, cBlack),
        StaticData.gap1,
        txt.textWidget(text, 11.0, FontWeight.w500, cBlack),
      ],
    );
  }
}
