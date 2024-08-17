import 'package:code_pay/bindings/models/jobs_data_model.dart';
import 'package:code_pay/bindings/models/jobs_details_model.dart';
import 'package:code_pay/bindings/models/news_data_model.dart';
import 'package:code_pay/data/service/http_client.dart';
import 'package:get/get.dart';

class ApiRepository extends GetxController {
  final fetchJobs = Get.put(HttpClientFetch());

  // fetch job all data
  Future<List<JobsDataModel>> getJobs() {
    return fetchJobs.fetchJobsData();
  }

  // fetch jobs details
  Future<JobsDetailsModel> getJobsDetails(id) {
    return fetchJobs.fetchJobsDetails(id);
  }

  // scrape job data
  Future<void> scrapeJobs(url) {
    return fetchJobs.scrapeJobData(url);
  }

  // news data
  Future<List<NewsModel>> newsData() {
    return fetchJobs.fetchNewsData();
  }
}
