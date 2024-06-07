import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/shimmer_effect.dart';
import 'package:code_pay/common/widgets/reusable/user_input_section.dart';
import 'package:code_pay/data/bloc/jobs_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // controller
    var searchController = TextEditingController();
    return Scaffold(
      backgroundColor: cGrey2,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: StaticData.p2, right: StaticData.p2),
          child: Column(
            children: [
              UserInputSection(
                txt: 'Search',
                icn: 'https://www.svgrepo.com/show/498380/search-normal-1.svg',
                type: TextInputType.url,
                height_: 0.071,
                width_: 0.95,
                controller: searchController,
              ),
              BlocBuilder<JobsDataBloc, JobsDataState>(
                builder: (context, state) {
                  if (state is JobDataLoading) {
                    return const LinearProgressShimmer();
                  } else if (state is JobDataError) {
                    return Text(state.error);
                  }
                  return Column(
                    children: [],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
