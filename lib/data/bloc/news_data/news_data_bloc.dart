import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_data_event.dart';
part 'news_data_state.dart';

class NewsDataBloc extends Bloc<NewsDataEvent, NewsDataState> {
  NewsDataBloc() : super(NewsDataInitial()) {
    on<NewsDataEvent>((event, emit) {});
  }
}
