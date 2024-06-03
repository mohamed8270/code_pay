import 'package:code_pay/bindings/models/jobs_data_model.dart';
import 'package:code_pay/data/service/http_client.dart';
import 'package:get/get.dart';

class ApiRepository extends GetxController {
  final fetchJobs = Get.put(HttpClientFetch());

  Future<List<JobsDataModel>> getJobs() {
    return fetchJobs.fetchJobsData();
  }
}
