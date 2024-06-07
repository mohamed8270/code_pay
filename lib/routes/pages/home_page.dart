import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/interface/custom_app_bar.dart';
import 'package:code_pay/common/widgets/interface/popular_category_card.dart';
import 'package:code_pay/common/widgets/reusable/user_input_section.dart';
import 'package:code_pay/data/repository/local_data_repositoy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // text widget
    final text = TextFond();

    // screensize
    final screenSize = MediaQuery.sizeOf(context);

    var searchController = TextEditingController();

    // popular data class
    var popularDataClass = Get.put(LocalDataRepo());
    return Scaffold(
      backgroundColor: cGrey2,
      body: Padding(
        padding: EdgeInsets.only(left: StaticData.p2, right: StaticData.p2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            text.textWidget(StaticData.heroText, 34.0, Weight.w7, cBlack),
            StaticData.gap3,
            UserInputSection(
              txt: 'Search',
              icn: 'https://www.svgrepo.com/show/498380/search-normal-1.svg',
              type: TextInputType.url,
              height_: 0.071,
              width_: 0.95,
              controller: searchController,
              list: const ['Jobs', 'Work', 'IT', 'Sales Assistant'],
            ),
            StaticData.gap6,
            text.textWidget(StaticData.title1, 22.0, Weight.w6, cBlack),
            StaticData.gap3,
            SizedBox(
              width: screenSize.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularDataClass.popularCarddata.length,
                itemBuilder: (context, index) {
                  final output = popularDataClass.popularCarddata[index];
                  return PopularCategoryCard(
                    click: () {},
                    txt: output['name'].toString(),
                  );
                },
              ),
            ),
            StaticData.gap3,
            text.textWidget(StaticData.title2, 22.0, Weight.w6, cBlack)
          ],
        ),
      ),
    );
  }
}
