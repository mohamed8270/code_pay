import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  // text widget
  final text = TextFond();

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(left: StaticData.p2, right: StaticData.p2),
      child: Column(
        children: [
          Container(
            height: screenSize.height * 0.07,
            decoration: BoxDecoration(
              color: cGrey2,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                width: 1.5,
                color: cGrey.withOpacity(0.2),
              ),
            ),
            child: TabBar(
              controller: tabController,
              labelColor: cWhite,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: cGrey,
              splashBorderRadius: BorderRadius.circular(40),
              labelStyle:
                  GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w500),
              unselectedLabelStyle:
                  GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w500),
              indicator: BoxDecoration(
                color: cVoilet,
                borderRadius: BorderRadius.circular(40),
              ),
              tabs: const [
                Tab(text: 'Description'),
                Tab(text: 'Company'),
                Tab(text: 'About'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                Text('Description'),
                Text('Company'),
                Text('About'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
