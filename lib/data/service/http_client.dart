import 'dart:convert';

import 'package:code_pay/bindings/models/jobs_data_model.dart';
import 'package:code_pay/bindings/models/jobs_details_model.dart';
import 'package:code_pay/bindings/models/news_data_model.dart';
import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/widgets/interface/status_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HttpClientFetch extends GetxController {
  // fetching jobs data
  Future<List<JobsDataModel>> fetchJobsData() async {
    String url = dotenv.env['JOBS_DATA_URL'].toString();

    try {
      http.Response response = await http.get(Uri.tryParse(url)!);
      List<dynamic> jobsres = jsonDecode(response.body);
      List<JobsDataModel> jobsdata =
          jobsres.map((dynamic e) => JobsDataModel.fromJson(e)).toList();
      return jobsdata;
    } catch (e) {
      throw Exception(e);
    }
  }

  // fetching jobs details using ID
  Future<JobsDetailsModel> fetchJobsDetails(String id) async {
    String url = dotenv.env['JOBS_DETAILS_URL'].toString();

    try {
      http.Response response = await http.get(Uri.tryParse('$url$id')!);
      if (response.statusCode == 200) {
        final jobsdetailres = jsonDecode(response.body);
        final jobsdetaildata = JobsDetailsModel.fromJson(jobsdetailres);
        return jobsdetaildata;
      } else {
        throw Exception('Internal Server Error!');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // scrape jobs data from URL
  Future<void> scrapeJobData(String url) async {
    String nodeurl = dotenv.env['JOBS_SCRAPE_URL'].toString();

    try {
      http.Response res = await http.post(
        Uri.tryParse(nodeurl)!,
        body: jsonEncode({'url': url}),
        headers: {'Content-Type': 'application/json'},
      );

      if (res.statusCode == 200) {
        const SnackBarRepo(txt: 'Data uploaded successfuly', bg: cGreen);
      } else if (res.statusCode == 500) {
        const SnackBarRepo(txt: 'Internal server error', bg: Colors.red);
      } else if (res.statusCode == 404) {
        const SnackBarRepo(txt: '404 Not found', bg: Colors.red);
      } else {
        throw Exception('An unexcepted error occured!');
      }
    } catch (e) {
      const SnackBarRepo(txt: 'An error occured in scraping', bg: Colors.red);
    }
  }

  // fetch news data
  Future<List<NewsModel>> fetchNewsData() async {
    String url = dotenv.env['NEWS_URL'].toString();

    try {
      http.Response res = await http.get(Uri.tryParse(url)!);
      if (res.statusCode == 200) {
        List<dynamic> listres = jsonDecode(res.body);
        List<NewsModel> output =
            listres.map((dynamic e) => NewsModel.fromJson(e)).toList();
        return output;
      } else {
        throw Exception('InternaL Server Error');
      }
    } catch (e) {
      throw Exception('An unexcepted error occured!: $e');
    }
  }
}
