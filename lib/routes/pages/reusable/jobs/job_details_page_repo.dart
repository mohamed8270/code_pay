import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/routes/pages/reusable/jobs/widgets/custom_tab_bar.dart';
import 'package:code_pay/utils/string_check.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    final text = TextFond();
    // reusable
    final reusable = Get.put(ReusableClass());

    final screenSize = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text.textWidget(jobname, 18.0, Weight.w7, cBlack),
        // StaticData.gap1,
        text.textWidget(jobcompany, 12.0, Weight.w5, cGrey),
        StaticData.gap3,
        reusable.detailsContainer1(
            context, joblocation, experience, emptyString(jobsalary)),
        StaticData.gap3,
        reusable.detailsContainer(context, jobposted, jobveiwed, jobapplied),
        StaticData.gap3,
        SizedBox(
          height: screenSize.height,
          child: CustomTabBar(description: description),
        ),
      ],
    );
  }
}
