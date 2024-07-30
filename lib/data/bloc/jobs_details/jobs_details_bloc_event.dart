part of 'jobs_details_bloc_bloc.dart';

abstract class JobsDetailsBlocEvent {}

class FetchJobsDetailsEvent extends JobsDetailsBlocEvent {
  final String id;

  FetchJobsDetailsEvent({required this.id});
}
