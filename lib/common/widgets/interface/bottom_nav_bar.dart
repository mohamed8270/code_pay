import 'package:code_pay/bindings/controllers/navigation_controller.dart';
import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
            color: cWhite,
            border: Border(
              top: BorderSide(width: 1.3, color: cBlack.withOpacity(0.05)),
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: navigate.selectedIndex.value,
            onTap: (i) => navigate.selectedIndex.value = i,
            backgroundColor: cWhite,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedItemColor: cGreen,
            unselectedItemColor: cBlack,
            selectedLabelStyle: GoogleFonts.poppins(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: cGreen,
                height: 1.9),
            unselectedLabelStyle: GoogleFonts.poppins(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: cBlack,
                height: 1.9),
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
                icon: reusable.svgIconOutline(StaticData.scopeOutline),
                activeIcon: reusable.svgIconFilled(StaticData.scopeFilled),
                label: 'Scope',
              ),
              BottomNavigationBarItem(
                icon: reusable.svgIconOutline(StaticData.settingOutline),
                activeIcon: reusable.svgIconFilled(StaticData.settingFilled),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
