import 'package:code_pay/common/widgets/reusable/shimmer_effect.dart';
import 'package:code_pay/data/bloc/jobs_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<JobsDataBloc, JobsDataState>(
        builder: (context, state) {
          if (state is JobDataLoading) {
            return const LinearProgressShimmer();
          }
          return const Text('');
        },
      ),
    );
  }
}
