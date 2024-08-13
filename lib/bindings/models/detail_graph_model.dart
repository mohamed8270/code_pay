// views vs applied graph class
class ViewsvsApplied {
  final String date;
  final int viewsgraph;
  final int appliedgraph;

  ViewsvsApplied({
    required this.viewsgraph,
    required this.appliedgraph,
    required this.date,
  });
}

// views vs post graph class
class ViewsvsPost {
  final String date;
  final int viewsgraph;
  final int postedgraph;

  ViewsvsPost(
      {required this.date,
      required this.viewsgraph,
      required this.postedgraph});
}

// salary graph class
class SalaryGraphClass {
  final String jobname;
  final int salary;

  SalaryGraphClass({required this.jobname, required this.salary});
}

// skills graph class
class SkillsGraphClass {
  final String skills;
  final String mapper;
  final int count;

  SkillsGraphClass({
    required this.skills,
    required this.count,
    required this.mapper,
  });
}
