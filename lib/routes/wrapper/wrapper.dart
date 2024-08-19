import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/widgets/interface/bottom_nav_bar.dart';
import 'package:code_pay/data/bloc/jobs_data/jobs_data_bloc.dart';
import 'package:code_pay/data/bloc/jobs_details/jobs_details_bloc_bloc.dart';
import 'package:code_pay/data/bloc/news_data/news_data_bloc.dart';
import 'package:code_pay/routes/pages/home_page/home_page.dart';
import 'package:code_pay/routes/pages/jobs_page/jobs_page.dart';
import 'package:code_pay/routes/pages/job_details_page/jobs_details_page.dart';
import 'package:code_pay/routes/pages/scope_page/scope_page.dart';
import 'package:code_pay/routes/pages/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final jobsfetch = Get.put(FetchJobsDataEvent());
    final newsfetch = Get.put(FecthNewsDataEvent());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => JobsDataBloc()..add(jobsfetch)),
        BlocProvider(create: (context) => JobsDetailsBloc()),
        BlocProvider(create: (context) => NewsDataBloc()..add(newsfetch)),
      ],
      child: GetMaterialApp(
        title: 'Code Pay',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: cWhite, primary: cBlack),
          useMaterial3: true,
        ),
        routes: {
          '/homepage': (c) => const HomePage(),
          '/jobspage': (c) => const JobsPage(),
          '/settingspage': (c) => const SettingsPage(),
          '/scopespage': (c) => const ScopePage(),
          '/jobdetails': (c) => const JobsDetailsPage(),
        },
        home: const BottomNavBar(),
      ),
    );
  }
}
