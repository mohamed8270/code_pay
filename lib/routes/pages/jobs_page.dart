import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/jobs_data_card.dart';
import 'package:code_pay/common/widgets/reusable/shimmer_effect.dart';
import 'package:code_pay/data/bloc/jobs_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey2,
      body: SafeArea(
        child: BlocBuilder<JobsDataBloc, JobsDataState>(
          builder: (context, state) {
            if (state is JobDataLoading) {
              return const LinearProgressShimmer();
            } else if (state is JobDataError) {
              return Text(state.error);
            } else if (state is JobDataLoaded) {
              return Padding(
                padding: EdgeInsets.only(
                    left: StaticData.p2, right: StaticData.p2, top: 10),
                child: ListView.builder(
                  itemCount: state.jobs.length,
                  itemBuilder: (context, index) {
                    return JobsDataCard(
                      jobname: state.jobs.first.jobname.toString(),
                      companyname: state.jobs.first.jobcompany.toString(),
                      jobplace: state.jobs.first.jobplace.toString(),
                      jobsalary: state.jobs.first.jobsalary.toString(),
                      description: state.jobs.first.jobdescription.toString(),
                      click: () {},
                    );
                  },
                ),
              );
            }
            return const Text('');
          },
        ),
      ),
    );
  }
}
