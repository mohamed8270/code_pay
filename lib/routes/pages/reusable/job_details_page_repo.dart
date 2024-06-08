import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
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
    final text = TextFond();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text.textWidget(jobcompany, 18.0, Weight.w6, cBlack),
        StaticData.gap1,
        text.textWidget(jobname, 16.0, Weight.w5, cGrey),
        StaticData.gap3,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            text.textWidget(joblocation, 14.0, Weight.w5, cGrey),
            const Icon(Icons.trip_origin_rounded, size: 12, color: cGrey),
            text.textWidget(experience, 14.0, Weight.w5, cGrey),
            const Icon(Icons.trip_origin_rounded, size: 12, color: cGrey),
            text.textWidget(jobsalary, 14.0, Weight.w5, cGrey),
          ],
        ),
        StaticData.gap3,
      ],
    );
  }
}
