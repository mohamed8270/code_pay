import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/common/widgets/reusable/shimmer_effect.dart';
import 'package:code_pay/data/bloc/jobs_details/jobs_details_bloc_bloc.dart';
import 'package:code_pay/routes/pages/job_details_page/job_details_page_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class JobsDetailsPage extends StatelessWidget {
  const JobsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.sizeOf(context);

    var icn = ReusableClass();
    var txt = TextFond();

    final String id = ModalRoute.of(context)!.settings.arguments as String;
    context.read<JobsDetailsBloc>().add(FetchJobsDetailsEvent(id: id));

    return Scaffold(
      backgroundColor: cWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: cWhite,
            border: Border(
              bottom: BorderSide(width: 1.3, color: cBlack.withOpacity(0.05)),
            ),
          ),
          alignment: Alignment.center,
          child: AppBar(
            backgroundColor: cWhite,
            scrolledUnderElevation: 0,
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: icn.svgIcon(StaticData.back, 11.0, 11.0, cGreen),
              ),
            ),
            title: txt.textWidget(
                'Job details & Analytics  ✨', 13.0, FontWeight.w600, cBlack),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: BlocBuilder<JobsDetailsBloc, JobsDetailsBlocState>(
          builder: (context, state) {
            if (state is JobsDetailsBlocLoading) {
              return const LinearProgressShimmer();
            } else if (state is JobsDetailsBlocError) {
              return Text(state.error);
            } else if (state is JobsDetailsBlocLoaded) {
              final output = state.jobsdetails;
              return JobDetailsPageRepo(
                jobname: output.jobname.toString(),
                jobplace: output.jobplace.toString(),
                jobcompany: output.jobcompany.toString(),
                jobposted: output.jobposted.toString(),
                jobapplied: output.jobapplied.toString(),
                jobveiwed: output.jobviews.toString(),
                joblocation: output.jobplace.toString(),
                experience: output.jobexperience.toString(),
                description: output.jobdescription.toString(),
                jobtype: output.jobtype.toString(),
                jobindustry: output.jobindustry.toString(),
                jobfunction: output.jobfunction.toString(),
                skills: output.jobskills.toList(),
                jobsource: output.jobsource.toString(),
                jobapply: output.jobapply.toString(),
                companyurl: output.jobcompanyurl.toString(),
                jobsalary: output.jobsalary.toString(),
                roles: output.jobrole.toList(),
                postedHistory: output.postedhistory,
                appliedHistory: output.appliedhistory,
                viewsHistory: output.viewshistory,
              );
            }
            return const Center(
              child: SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  strokeAlign: 3,
                  strokeCap: StrokeCap.round,
                  color: cBlack,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
