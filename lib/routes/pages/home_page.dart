import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/custom_app_bar.dart';
import 'package:code_pay/common/widgets/reusable/user_input_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // text widget
    final text = TextFond();
    var searchController = TextEditingController();
    return Scaffold(
      backgroundColor: cGrey2,
      body: Padding(
        padding: EdgeInsets.only(left: StaticData.p2, right: StaticData.p2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            text.textWidget(StaticData.heroText, 34.0, Weight.w6, cBlack),
            StaticData.gap2,
            UserInputSection(
              txt: 'Search',
              icn: 'https://www.svgrepo.com/show/498380/search-normal-1.svg',
              type: TextInputType.url,
              height_: 0.075,
              width_: 0.95,
              controller: searchController,
            ),
          ],
        ),
      ),
    );
  }
}
