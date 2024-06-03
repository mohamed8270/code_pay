import 'dart:convert';

import 'package:code_pay/bindings/models/jobs_data_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HttpClientFetch extends GetxController {
  // fetching jobs data
  Future<List<JobsDataModel>> fetchJobsData() async {
    String url = dotenv.env['JOBS_DATA_URL'].toString();

    try {
      http.Response response = await http.get(Uri.tryParse(url)!);
      if (response.statusCode == 200) {
        List<dynamic> jobsres = jsonDecode(response.body);

        List<JobsDataModel> jobsdata =
            jobsres.map((dynamic e) => JobsDataModel.fromJson(e)).toList();
        return jobsdata;
      } else {
        throw Exception('Internal Server Error!');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
