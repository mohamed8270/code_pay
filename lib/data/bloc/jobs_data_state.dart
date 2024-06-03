part of 'jobs_data_bloc.dart';

@immutable
sealed class JobsDataState {}

final class JobsDataInitial extends JobsDataState {}

final class JobDataLoading extends JobsDataState {}

final class JobDataLoaded extends JobsDataState {
  final List<JobsDataModel> jobs;

  JobDataLoaded({required this.jobs});
}

final class JobDataError extends JobsDataState {}
