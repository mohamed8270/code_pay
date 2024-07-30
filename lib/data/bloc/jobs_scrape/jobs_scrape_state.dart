part of 'jobs_scrape_bloc.dart';

@immutable
sealed class JobsScrapeState {}

final class JobsScrapeInitial extends JobsScrapeState {}

final class JobsScrapeBlocLoading extends JobsScrapeState {}

final class JobsScrapeBlocLoaded extends JobsScrapeState {}

final class JobsScrapeBlocError extends JobsScrapeState {
  final String error;

  JobsScrapeBlocError({required this.error});
}
