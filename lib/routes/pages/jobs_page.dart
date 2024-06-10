import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/routes/pages/reusable/jobs_data_card.dart';
import 'package:code_pay/common/widgets/reusable/shimmer_effect.dart';
import 'package:code_pay/data/bloc/jobs_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onJobClicked(String id) {
      print('clicked');
      Get.toNamed('/jobdetails', arguments: id);
    }

    return Scaffold(
      backgroundColor: cGrey2,
      body: SafeArea(
        child: BlocBuilder<JobsDataBloc, JobsDataState>(
          builder: (context, state) {
            if (state is JobDataLoading) {
              return const Center(child: LinearProgressShimmer());
            } else if (state is JobDataError) {
              return Text(state.error);
            } else if (state is JobDataLoaded) {
              return Padding(
                padding: EdgeInsets.only(
                    left: StaticData.p2, right: StaticData.p2, top: 10),
                child: ListView.builder(
                  itemCount: state.jobs.length,
                  itemBuilder: (context, index) {
                    final output = state.jobs.first;
                    return JobsDataCard(
                      jobname: output.jobname.toString(),
                      companyname: output.jobcompany.toString(),
                      jobplace: output.jobplace.toString(),
                      jobsalary: output.jobsalary.toString(),
                      description: output.jobdescription.toString(),
                      click: () => onJobClicked(output.id),
                      applyclick: () {},
                    );
                  },
                ),
              );
            }
            return const Text('Server Busy');
          },
        ),
      ),
    );
  }
}
