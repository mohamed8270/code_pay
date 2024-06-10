import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/widgets/interface/bottom_nav_bar.dart';
import 'package:code_pay/data/bloc/jobs_data_bloc.dart';
import 'package:code_pay/data/bloc/jobs_details_bloc/jobs_details_bloc_bloc.dart';
import 'package:code_pay/routes/pages/home_page.dart';
import 'package:code_pay/routes/pages/jobs_page.dart';
import 'package:code_pay/routes/pages/profile_page.dart';
import 'package:code_pay/routes/pages/reusable/jobs_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final jobsfetch = Get.put(FetchJobsDataEvent());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => JobsDataBloc()..add(jobsfetch)),
        BlocProvider(create: (context) => JobsDetailsBloc())
      ],
      child: GetMaterialApp(
        title: 'Code Pay',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: cWhite),
          useMaterial3: true,
        ),
        routes: {
          '/homepage': (c) => const HomePage(),
          '/jobspage': (c) => const JobsPage(),
          '/profile': (c) => const ProfilePage(),
          '/jobdetails': (c) => const JobsDetailsPage(),
        },
        home: const BottomNavBar(),
      ),
    );
  }
}
