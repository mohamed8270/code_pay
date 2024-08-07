// ignore_for_file: avoid_print

// empty text check
String emptyString(txt) {
  if (txt != '') {
    return txt;
  }
  return 'Not Specified';
}

// extract popularity
String popularityPercent(String posteddata, appliedata, viewsdata) {
  String pStr = posteddata.replaceAll(RegExp(r'[^0-9]'), '');
  String aStr = appliedata.replaceAll(RegExp(r'[^0-9]'), '');
  String vStr = viewsdata.replaceAll(RegExp(r'[^0-9]'), '');

  int posted = int.parse(pStr);
  int applied = int.parse(aStr);
  int views = int.parse(vStr);

  print([posted, applied, views]);
  double normalizedViews = views / 100;
  double normalizedApplied = applied / 100;
  double first = (normalizedViews + (2 * normalizedApplied));
  double second = (posted + 1);
  double third = first / second;

  double popularityScore = (third * 100).clamp(0, 100).toDouble();
  String output = popularityScore.toStringAsFixed(2);
  String res = '$output% ${emojiType(output)}';
  return res;
}

// emoji fitting
String emojiType(String txt) {
  var val = double.parse(txt);
  if (val >= 20.0) {
    return 'Begginers choice ✨';
  } else if (val >= 50.0) {
    return 'Freshers favourite 👍';
  } else if (val >= 70.0) {
    return 'Intermediate dev ⚡';
  } else if (val >= 100.0) {
    return 'Top tier 🖥️';
  } else if (val >= 130.0) {
    return 'Titan 🔥';
  } else {
    return 'Peoples choice 👍';
  }
}
