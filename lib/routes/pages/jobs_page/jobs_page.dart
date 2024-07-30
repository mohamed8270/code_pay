import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/interface/custom_button.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/common/widgets/reusable/user_input_section.dart';
import 'package:code_pay/routes/pages/jobs_page/reusable/jobs_data_card.dart';
import 'package:code_pay/common/widgets/reusable/shimmer_effect.dart';
import 'package:code_pay/data/bloc/jobs_data/jobs_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onJobClicked(String id) {
      Get.toNamed('/jobdetails', arguments: id);
    }

    // controller
    var jobsearch = TextEditingController();
    var txt = TextFond();
    final scrnSize = MediaQuery.sizeOf(context);
    var icn = ReusableClass();

    return Scaffold(
      backgroundColor: cbGrey,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0,
            toolbarHeight: scrnSize.height * 0.08,
            automaticallyImplyLeading: false,
            excludeHeaderSemantics: false,
            scrolledUnderElevation: 0,
            floating: true,
            pinned: true,
            centerTitle: false,
            snap: false,
            backgroundColor: cWhite,
            leading: Padding(
              padding: const EdgeInsets.all(13),
              child: icn.svgIcon(StaticData.menu, 12.0, 12.0, cGreen),
            ),
            title: txt.textWidget(
                'Your perfect job here!', 12.0, FontWeight.w600, cBlack),
            bottom: AppBar(
              backgroundColor: cWhite,
              elevation: 0,
              scrolledUnderElevation: 0,
              toolbarHeight: scrnSize.height * 0.085,
              flexibleSpace: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserInputSection(
                    text: 'Search perfect job',
                    icn: StaticData.search,
                    type: TextInputType.url,
                    height_: 0.058,
                    width_: 0.7,
                    r: 8,
                    controller: jobsearch,
                  ),
                  StaticData.gap2,
                  CustomBtn(
                    click: () {},
                    h: 0.058,
                    w: 0.21,
                    bg: cBlack,
                    txt: 'Find a job',
                    txts: 10.0,
                    txtcolor: cWhite,
                    r: 8,
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BlocBuilder<JobsDataBloc, JobsDataState>(
                  builder: (context, state) {
                    if (state is JobDataLoading) {
                      return const Center(child: LinearProgressShimmer());
                    } else if (state is JobDataError) {
                      return Text(state.error);
                    } else if (state is JobDataLoaded) {
                      return ListView.builder(
                        itemCount: state.jobs.length,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final output = state.jobs.first;
                          return JobsDataCard(
                            jobname: output.jobname.toString(),
                            companyname: output.jobcompany.toString(),
                            days: output.jobposted.toString(),
                            views: output.jobviews.toString(),
                            apply: output.jobapplied.toString(),
                            jobsalary: output.jobsalary.toString(),
                            description: output.jobdescription.toString(),
                            click: () => onJobClicked(output.id),
                            applyclick: () {},
                          );
                        },
                      );
                    }
                    return const Text('Server Busy');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
