part of 'jobs_scrape_bloc.dart';

abstract class JobsScrapeEvent {}

class ScrapeJobDataEvent extends JobsScrapeEvent {
  final String url;

  ScrapeJobDataEvent({required this.url});
}
