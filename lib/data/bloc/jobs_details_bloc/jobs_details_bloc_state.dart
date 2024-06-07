part of 'jobs_details_bloc_bloc.dart';

@immutable
sealed class JobsDetailsBlocState {}

final class JobsDetailsBlocInitial extends JobsDetailsBlocState {}

final class JobsDetailsBlocLoading extends JobsDetailsBlocState {}

final class JobsDetailsBlocLoaded extends JobsDetailsBlocState {
  final JobsDetailsModel jobsdetails;

  JobsDetailsBlocLoaded({required this.jobsdetails});
}

final class JobsDetailsBlocError extends JobsDetailsBlocState {
  final String error;

  JobsDetailsBlocError({required this.error});
}
