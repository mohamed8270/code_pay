import 'package:code_pay/bindings/controllers/navigation_controller.dart';
import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // reusable
    final reusable = Get.put(ReusableClass());
    // navigate controller
    final navigate = Get.put(NavigationController());

    return Obx(
      () => Scaffold(
        body: navigate.screens[navigate.selectedIndex.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              top: BorderSide(width: 1.5, color: cGrey.withOpacity(0.05)),
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: 0,
            onTap: (i) => navigate.selectedIndex.value = i,
            backgroundColor: cWhite,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: reusable.svgIconOutline(StaticData.homeOutline),
                activeIcon: reusable.svgIconFilled(StaticData.homeFilled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: reusable.svgIconOutline(StaticData.caseOutline),
                activeIcon: reusable.svgIconFilled(StaticData.caseFilled),
                label: 'Jobs',
              ),
              BottomNavigationBarItem(
                icon: reusable.svgIconOutline(StaticData.profileOutline),
                activeIcon: reusable.svgIconFilled(StaticData.profileFilled),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
