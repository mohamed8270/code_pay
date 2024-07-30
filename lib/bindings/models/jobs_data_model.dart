class JobsDataModel {
  final String id;
  final String url;
  final String jobname;
  final String jobcompany;
  final String jobplace;
  final String jobexperience;
  final String jobsalary;
  final String jobposted;
  final String jobviews;
  final String jobapplied;
  final String jobdescription;
  final String jobtype;
  final String jobindustry;
  final String jobfunction;
  final List<dynamic> jobrole;
  final List<dynamic> jobskills;
  final String jobcompanyurl;
  final String jobsource;
  final String jobapply;
  final String jobquickapply;
  final int jobpostedvalue;
  final int jobappliedvalue;
  final int jobviewsvalue;
  final List<PostedHistory> postedhistory;
  final List<AppliedHistory> appliedhistory;
  final List<ViewsHistory> viewshistory;
  final List users;
  final String timestamps;

  JobsDataModel(
      {required this.id,
      required this.url,
      required this.jobname,
      required this.jobcompany,
      required this.jobplace,
      required this.jobexperience,
      required this.jobsalary,
      required this.jobposted,
      required this.jobviews,
      required this.jobapplied,
      required this.jobdescription,
      required this.jobtype,
      required this.jobindustry,
      required this.jobfunction,
      required this.jobrole,
      required this.jobskills,
      required this.jobcompanyurl,
      required this.jobsource,
      required this.jobapply,
      required this.jobquickapply,
      required this.jobpostedvalue,
      required this.jobappliedvalue,
      required this.jobviewsvalue,
      required this.postedhistory,
      required this.appliedhistory,
      required this.viewshistory,
      required this.users,
      required this.timestamps});

  factory JobsDataModel.fromJson(Map<String, dynamic> json) {
    print(
      (json['postedHistory'] as List<dynamic>)
          .map((e) => PostedHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
    return JobsDataModel(
      id: json['_id'],
      url: json['url'],
      jobname: json['jobName'],
      jobcompany: json['jobCompany'],
      jobplace: json['jobPlace'],
      jobexperience: json['jobExperience'],
      jobsalary: json['jobSalary'],
      jobposted: json['jobPosted'],
      jobviews: json['jobViews'],
      jobapplied: json['jobApplied'],
      jobdescription: json['jobDescription'],
      jobtype: json['jobType'],
      jobindustry: json['jobIndustry'],
      jobfunction: json['jobFunction'],
      jobrole: json['jobRole'],
      jobskills: json['jobSkillsets'],
      jobcompanyurl: json['jobCompanyUrl'],
      jobsource: json['jobSource'],
      jobapply: json['jobApply'],
      jobquickapply: json['jobQuickApply'],
      jobpostedvalue: json['jobPostedValue'],
      jobappliedvalue: json['jobAppliedValue'],
      jobviewsvalue: json['jobViewsValue'],
      postedhistory: (json['postedHistory'] as List<dynamic>)
          .map((e) => PostedHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      appliedhistory: (json['appliedHistory'] as List<dynamic>)
          .map((e) => AppliedHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      viewshistory: (json['viewsHistory'] as List<dynamic>)
          .map((e) => ViewsHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: json['users'],
      timestamps: json['createdAt'],
    );
  }
}

class PostedHistory {
  final int? posted;
  final String date;
  final String id;

  PostedHistory({required this.date, required this.id, this.posted});

  factory PostedHistory.fromJson(Map<String, dynamic> json) {
    return PostedHistory(
      posted: (json['posted'] as int?)?.toInt(),
      date: json['Date'],
      id: json['_id'],
    );
  }
}

class AppliedHistory {
  final int? applied;
  final String date;
  final String id;

  AppliedHistory({this.applied, required this.date, required this.id});

  factory AppliedHistory.fromJson(Map<String, dynamic> json) {
    return AppliedHistory(
      applied: (json['applied'] as int?)?.toInt(),
      date: json['Date'],
      id: json['_id'],
    );
  }
}

class ViewsHistory {
  final int? views;
  final String date;
  final String id;

  ViewsHistory({this.views, required this.date, required this.id});

  factory ViewsHistory.fromJson(Map<String, dynamic> json) {
    print((json['views'] as int?)?.toInt());
    return ViewsHistory(
      views: (json['views'] as int?)?.toInt(),
      date: json['Date'],
      id: json['_id'],
    );
  }
}
