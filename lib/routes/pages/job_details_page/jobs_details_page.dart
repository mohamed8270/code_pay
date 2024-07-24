import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/common/widgets/reusable/shimmer_effect.dart';
import 'package:code_pay/data/bloc/jobs_details_bloc/jobs_details_bloc_bloc.dart';
import 'package:code_pay/routes/pages/job_details_page/job_details_page_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      backgroundColor: cbGrey,
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
            leading: Padding(
              padding: const EdgeInsets.all(13),
              child: icn.svgIcon(StaticData.menu, 12.0, 12.0, cGreen),
            ),
            title: txt.textWidget(
                'Your perfect job here!', 12.0, FontWeight.w600, cBlack),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              BlocBuilder<JobsDetailsBloc, JobsDetailsBlocState>(
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
                      skills: output.jobskills,
                      jobsource: output.jobsource.toString(),
                      companyurl: output.jobcompanyurl.toString(),
                      jobsalary: output.jobsalary.toString(),
                      roles: output.jobrole,
                    );
                  }
                  return const Text('Server busy');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
