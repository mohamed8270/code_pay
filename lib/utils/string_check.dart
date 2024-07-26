// empty text check
String emptyString(txt) {
  if (txt != '') {
    return txt;
  }
  return 'Not Specified';
}

// extract popularity
String popularityPercent(double posted, applied, views) {
  double k = 2.0;
  double kConstant = k * applied;
  double first = views + kConstant;
  double second = posted + 1;

  double popularityScore = first / second;
  String output = popularityScore.toStringAsFixed(4);
  String res = '$output ${emojiType(output)}';
  return res;
}

// emoji fitting
String emojiType(String txt) {
  var val = double.parse(txt);
  if (val >= 20.0) {
    return 'Begginers choice 🙂';
  } else if (val >= 50.0) {
    return 'Freshers favourite 😊';
  } else if (val >= 70.0) {
    return 'Intermediate dev 🤗';
  } else if (val >= 100.0) {
    return 'Top tier 😎';
  } else {
    return 'Peoples choice 👍';
  }
}
