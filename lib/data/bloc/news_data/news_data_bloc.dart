import 'package:bloc/bloc.dart';
import 'package:code_pay/bindings/models/news_data_model.dart';
import 'package:code_pay/data/repository/api_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'news_data_event.dart';
part 'news_data_state.dart';

class NewsDataBloc extends Bloc<NewsDataEvent, NewsDataState> {
  final newsfetch = Get.put(ApiRepository());
  NewsDataBloc() : super(NewsDataInitial()) {
    on<NewsDataEvent>((event, emit) async {
      emit(NewsDataLoading());
      try {
        final newsdata = await newsfetch.newsData();
        emit(NewsDataLoaded(news: newsdata));
      } catch (e) {
        emit(NewsDataError(error: e.toString()));
      }
    });
  }
}
