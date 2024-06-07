import 'package:bloc/bloc.dart';
import 'package:code_pay/bindings/models/jobs_details_model.dart';
import 'package:code_pay/data/repository/api_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'jobs_details_bloc_event.dart';
part 'jobs_details_bloc_state.dart';

class JobsDetailsBloc extends Bloc<JobsDetailsBlocEvent, JobsDetailsBlocState> {
  final repository = Get.put(ApiRepository());
  JobsDetailsBloc() : super(JobsDetailsBlocInitial()) {
    on<JobsDetailsBlocEvent>((event, emit) async {
      emit(JobsDetailsBlocLoading());
      try {
        final jobsdetailsout = await repository.getJobsDetails(id);
        emit(JobsDetailsBlocLoaded(jobsdetails: jobsdetailsout));
      } catch (e) {
        emit(JobsDetailsBlocError(error: e.toString()));
      }
    });
  }
}
