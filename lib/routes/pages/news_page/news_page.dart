import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/data/bloc/news_data/news_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var txt = TextFond();
    return Scaffold(
      backgroundColor: cbGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: cWhite,
            border: Border(
              bottom: BorderSide(width: 1.3, color: cBlack.withOpacity(0.05)),
            ),
          ),
          alignment: Alignment.center,
          child: AppBar(
            backgroundColor: cWhite,
            scrolledUnderElevation: 0,
            title:
                txt.textWidget('Tech News  📜', 13.0, FontWeight.w600, cBlack),
          ),
        ),
      ),
      body: BlocBuilder<NewsDataBloc, NewsDataState>(
        builder: (context, state) {
          return ListView();
        },
      ),
    );
  }
}
