import 'package:code_pay/routes/pages/home_page/home_page.dart';
import 'package:code_pay/routes/pages/jobs_page/jobs_page.dart';
import 'package:code_pay/routes/pages/scope_page/scope_page.dart';
import 'package:code_pay/routes/pages/settings_page/settings_page.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    const JobsPage(),
    const ScopePage(),
    const SettingsPage(),
  ];
}
