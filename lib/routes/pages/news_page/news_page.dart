import 'package:code_pay/bindings/models/news_data_model.dart';
import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/data/bloc/news_data/news_data_bloc.dart';
import 'package:code_pay/routes/pages/news_page/widgets/news_card_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var txt = TextFond();
    var use = ReusableClass();
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
          if (state is NewsDataLoading) {
            return use.circularLoading();
          } else if (state is NewsDataError) {
          } else if (state is NewsDataLoaded) {
            int count = state.news.reversed.length;
            return ListView.builder(
              itemCount: count,
              itemBuilder: (context, i) {
                List<NewsModel> data = state.news;
                return NewsCardRepo(
                  url: data[i].urlToImage,
                  h1: data[i].title,
                  p1: data[i].author,
                );
              },
            );
          }
          return use.circularLoading();
        },
      ),
    );
  }
}
