import 'dart:math' as math;

String calcResult(List<String> data) {
  var hasSquare = data.indexOf("^2");
  while (hasSquare != -1) {
    if (hasSquare != -1) {
      var result = math.pow(getValueAt(data, hasSquare - 1), 2);
      print("pow result...$result");
      data.removeRange(hasSquare - 1, hasSquare + 1);
      data.insert(hasSquare - 1, "$result");
      print(data);
      hasSquare = data.indexOf("^2");
    }
  }
  var hasDivide = data.indexOf("/");
  while (hasDivide != -1) {
    if (hasDivide != -1) {
      var divisor = getValueAt(data, hasDivide + 1);
      if (divisor == 0) {
        return "infinify";
      }
      var result = getValueAt(data, hasDivide - 1) / divisor;
      print("div result...$result");
      data.removeRange(hasDivide - 1, hasDivide + 2);
      data.insert(hasDivide - 1, "$result");
      hasDivide = data.indexOf("/");
    }
  }

  var hasMult = data.indexOf("*");
  while (hasMult != -1) {
    if (hasMult != -1) {
      var result =
          getValueAt(data, hasMult - 1) * getValueAt(data, hasMult + 1);
      print("mult result...$result");
      data.removeRange(hasMult - 1, hasMult + 2);
      data.insert(hasMult - 1, "$result");
      hasMult = data.indexOf("*");
    }
  }

  var hasAdd = data.indexOf("+");
  while (hasAdd != -1) {
    if (hasAdd != -1) {
      var result = getValueAt(data, hasAdd - 1) + getValueAt(data, hasAdd + 1);
      print("mult result...$result");
      data.removeRange(hasAdd - 1, hasAdd + 2);
      data.insert(hasAdd - 1, "$result");
      hasAdd = data.indexOf("+");
    }
  }

  var hasSub = data.indexOf("-");
  while (hasSub != -1) {
    if (hasSub != -1) {
      var result = getValueAt(data, hasSub - 1) + getValueAt(data, hasSub + 1);
      print("mult result...$result");
      data.removeRange(hasSub - 1, hasSub + 2);
      data.insert(hasSub - 1, "$result");
      hasSub = data.indexOf("-");
    }
  }

  if (data.length == 1) {
    return data.first;
  }

  return "0";
}

double getValueAt(List<String> d, int i) {
  return double.tryParse(d[i]);
}
