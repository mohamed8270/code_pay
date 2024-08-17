part of 'news_data_bloc.dart';

@immutable
sealed class NewsDataState {}

final class NewsDataInitial extends NewsDataState {}

final class NewsDataLoading extends NewsDataState {}

final class NewsDataLoaded extends NewsDataState {
  final List<NewsModel> news;

  NewsDataLoaded({required this.news});
}

final class NewsDataError extends NewsDataState {
  final String error;

  NewsDataError({required this.error});
}
