import 'package:bloc/bloc.dart';
import 'package:code_pay/bindings/models/jobs_data_model.dart';
import 'package:code_pay/data/repository/api_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'jobs_data_event.dart';
part 'jobs_data_state.dart';

class JobsDataBloc extends Bloc<JobsDataEvent, JobsDataState> {
  final respository = Get.put(ApiRepository());
  JobsDataBloc() : super(JobsDataInitial()) {
    on<JobsDataEvent>((event, emit) async {
      emit(JobDataLoading());
      try {
        final jobsData = await respository.getJobs();
        emit(JobDataLoaded(jobs: jobsData));
      } catch (e) {
        emit(JobDataError());
      }
    });
  }
}
