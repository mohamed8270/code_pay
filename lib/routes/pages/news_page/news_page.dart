import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/routes/pages/news_page/widgets/news_page_webview.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: NewsPageWebview(weburl: 'https://techcrunch.com/'),
    );
  }
}


// BlocBuilder<NewsDataBloc, NewsDataState>(
//         builder: (context, state) {
//           if (state is NewsDataLoading) {
//             return use.circularLoading();
//           } else if (state is NewsDataError) {
//             return NewsCardError(p: state.error);
//           } else if (state is NewsDataLoaded) {
//             int count = state.news.reversed.length;
//             return ListView.builder(
//               itemCount: count,
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               itemBuilder: (context, i) {
//                 final data = state.news[i];
//                 return NewsCardRepo(
//                   url: data.urlToImage,
//                   h1: data.title,
//                   p1: data.author,
//                 );
//               },
//             );
//           }
//           return use.circularLoading();
//         },
//       ),