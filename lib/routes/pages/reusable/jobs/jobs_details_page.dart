import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/interface/custom_app_bar.dart';
import 'package:code_pay/common/widgets/interface/custom_button.dart';
import 'package:code_pay/common/widgets/reusable/shimmer_effect.dart';
import 'package:code_pay/data/bloc/jobs_details_bloc/jobs_details_bloc_bloc.dart';
import 'package:code_pay/routes/pages/reusable/jobs/job_details_page_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class JobsDetailsPage extends StatelessWidget {
  const JobsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    String url =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png';

    final String id = ModalRoute.of(context)!.settings.arguments as String;
    context.read<JobsDetailsBloc>().add(FetchJobsDetailsEvent(id: id));

    return Scaffold(
      backgroundColor: cGrey2,
      floatingActionButton: CustomButton(
        h: 0.075,
        w: 0.95,
        txt: StaticData.apply,
        color: cVoilet,
        txtcolor: cWhite,
        icncolor: cWhite,
        click: () {},
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.32,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Stack(
                children: [
                  Container(
                    height: screenSize.height * 0.25,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      color: cVoilet,
                      // image: const DecorationImage(
                      //   image: NetworkImage(
                      //     'https://cpng.pikpng.com/pngl/s/514-5140539_ftestickers-background-pattern-lines-wave-stripes-wavy-lines.png',
                      //   ),
                      //   fit: BoxFit.cover,
                      //   filterQuality: FilterQuality.high,
                      // ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  DetailsAppBar(
                    leading: StaticData.back,
                    title: StaticData.details,
                    action: StaticData.share,
                    clicklead: () => Get.back(),
                    clickaction: () {},
                  ),
                  Positioned(
                    bottom: 10,
                    right: 50,
                    left: 50,
                    child: Container(
                      height: screenSize.height * 0.125,
                      width: screenSize.width * 0.125,
                      decoration: const BoxDecoration(
                        color: cWhite,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(23),
                        child: Image(
                          image: NetworkImage(url),
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
    );
  }
}
