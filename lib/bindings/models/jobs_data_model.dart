class JobsDataModel {
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
  final double jobpostedvalue;
  final double jobappliedvalue;
  final double jobviewsvalue;
  final List postedhistory;
  final List appliedhistory;
  final List users;
  final String timestamps;

  JobsDataModel(
      {required this.url,
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
      required this.users,
      required this.timestamps});

  factory JobsDataModel.fromJson(Map<String, dynamic> json) {
    return JobsDataModel(
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
      postedhistory: json['postedHistory'],
      appliedhistory: json['appliedHistory'],
      users: json['users'],
      timestamps: json['timestamps'],
    );
  }
}
