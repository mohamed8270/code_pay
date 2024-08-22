import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/interface/custom_button.dart';
import 'package:code_pay/common/widgets/interface/popular_category.dart';
import 'package:code_pay/common/widgets/reusable/job_func.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/routes/pages/job_details_page/email_dialogue_box.dart';
import 'package:code_pay/routes/pages/job_details_page/graphs/graph_repo.dart';
import 'package:code_pay/routes/pages/jobs_page/reusable/jobs_data_card.dart';
import 'package:code_pay/routes/pages/web_view/web_view_page.dart';
import 'package:code_pay/utils/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class JobDetailsPageRepo extends StatelessWidget {
  const JobDetailsPageRepo({
    super.key,
    required this.id,
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
    required this.jobapply,
    required this.quickapply,
    required this.companyurl,
    required this.jobsalary,
    required this.roles,
    required this.postedHistory,
    required this.appliedHistory,
    required this.viewsHistory,
  });

  final String id;
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
  final List<dynamic> skills;
  final String jobsource;
  final String jobapply;
  final String quickapply;
  final String companyurl;
  final List<dynamic> roles;
  final List postedHistory;
  final List appliedHistory;
  final List viewsHistory;

  @override
  Widget build(BuildContext context) {
    // text widget
    var text = TextFond();
    // reusable
    var reusable = ReusableClass();
    var emailClass = EmailDialogueBox();

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
                  // text.textWidget(jobname, 15.0, FontWeight.w700, cBlack),
                  marqueeText(jobname, context),
                  StaticData.gap1,
                  text.textWidget(
                      jobcompany == '' ? 'Company Confidential' : jobcompany,
                      12.0,
                      FontWeight.w400,
                      cBlack.withOpacity(0.5)),
                ],
              ),
            ],
          ),
          StaticData.gap3,
          Row(
            children: [
              GestureDetector(
                onTap: () => emailClass.mailDialgoueBox(context, id),
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
                click: () => Get.to(WebViewPage(weburl: jobapply)),
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
              text.textWidget(
                  '₹ ${jobsalary == '' ? 'Not Specified' : jobsalary}',
                  14.0,
                  FontWeight.w400,
                  cGreen),
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
          PopularCategory(
            posted: jobposted,
            applied: jobapplied,
            views: jobveiwed,
            click: () => Get.to(WebViewPage(weburl: quickapply)),
          ),
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
          ExpandableText(maxLines: 800, minLines: 4, text: description),
          StaticData.gap2,
          text.textWidget('More Info', 12.0, FontWeight.w600, cBlack),
          StaticData.gap2,
          JobDataFunc(icn: StaticData.jobtype, txt1: 'JOB TYPE', txt2: jobtype),
          StaticData.gap2,
          JobDataFunc(
              icn: StaticData.function, txt1: 'FUNCTION', txt2: jobfunction),
          StaticData.gap2,
          JobDataFunc(
              icn: StaticData.industry, txt1: 'INDUSTRY', txt2: jobindustry),
          StaticData.gap2,
          JobDataFuncList(icn: StaticData.skills, txt1: 'SKILLS', data: skills),
          StaticData.gap2,
          JobDataFuncList(icn: StaticData.roles, txt1: 'ROLES', data: roles),
          StaticData.gap2,
          text.textWidget('Analytics', 12.0, FontWeight.w600, cBlack),
          StaticData.gap2,
          GraphRepoLack(applied: appliedHistory, views: viewsHistory),
          StaticData.gap2,
          GraphRepoCom(views: viewsHistory, post: postedHistory),
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

Widget marqueeText(txt, context) {
  final scrnsize = MediaQuery.sizeOf(context);
  return SizedBox(
    height: scrnsize.height * 0.03,
    width: scrnsize.width * 0.75,
    child: Marquee(
      text: txt,
      style: GoogleFonts.poppins(
          fontSize: 15, fontWeight: FontWeight.w700, color: cBlack),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 20.0,
      velocity: 100.0,
      pauseAfterRound: const Duration(seconds: 1),
      showFadingOnlyWhenScrolling: true,
      fadingEdgeStartFraction: 0.1,
      fadingEdgeEndFraction: 0.1,
      numberOfRounds: 3,
      startPadding: 0.0,
      accelerationDuration: const Duration(seconds: 1),
      accelerationCurve: Curves.linear,
      decelerationDuration: const Duration(milliseconds: 500),
      decelerationCurve: Curves.easeOut,
    ),
  );
}
