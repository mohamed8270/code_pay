import 'package:bloc/bloc.dart';
import 'package:code_pay/data/repository/api_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'jobs_scrape_event.dart';
part 'jobs_scrape_state.dart';

class JobsScrapeBloc extends Bloc<JobsScrapeEvent, JobsScrapeState> {
  final ApiRepository repository = Get.put(ApiRepository());
  JobsScrapeBloc() : super(JobsScrapeInitial()) {
    on<JobsScrapeEvent>((event, emit) async {
      emit(JobsScrapeBlocLoading());
      try {
        await repository.scrapeJobs((event as ScrapeJobDataEvent).url);
        emit(JobsScrapeBlocLoaded());
      } catch (e) {
        emit(JobsScrapeBlocError(error: e.toString()));
      }
    });
  }
}
