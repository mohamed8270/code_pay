import 'package:code_pay/routes/pages/home_page.dart';
import 'package:code_pay/routes/pages/jobs_page.dart';
import 'package:code_pay/routes/pages/profile_page.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    const JobsPage(),
    const ProfilePage(),
  ];
}
