import 'package:e_report/data.dart';

CharType getType(String l) {
  try {
    if ("$l" == "0") {
      return CharType.empty;
    }
    if ("$l".contains(".")) {
      return CharType.numberDouble;
    }

    if (int.tryParse("$l") != null) {
      return CharType.numberInt;
    } else {
      return double.tryParse("$l") == null
          ? CharType.operatorSign
          : CharType.numberDouble;
    }
  } catch (e) {
    return CharType.empty;
  }
}

List<String> updateLastDigit(List<String> data, String digit) {
  if (data == null) {
    data = ["0"];
  }
  var lastDigit =
      "${data.last}" == "0" && digit != "." ? "$digit" : "${data.last}$digit";
  data.removeLast();
  data.add(lastDigit);

  return data;
}

List<String> deleteLastDigitLastChar(List<String> data) {
  if (data == null) {
    return ["0"];
  }

  var lastDigit = "${data.last}";
  CharType ldType = getType(lastDigit);

  if (ldType == CharType.empty && data.length == 1) {
    return data;
  }

  if ("$lastDigit" == "^2") {
    data.removeLast();
    return data;
  }

  if (data.length > 1) {
    var beforLast = getType(data[data.length - 2]);

    if (ldType == CharType.empty && beforLast == CharType.operatorSign) {
      data.removeLast();
      data.removeLast();
      return data;
    }
  }

  data.removeLast();
  lastDigit = lastDigit.substring(0, (lastDigit.length - 1));
  data.add(lastDigit.isEmpty ? "0" : lastDigit);

  return data;
}

List<String> addOperator(List<String> data, String op) {
  data.add("$op");
  if (op != "^2") {
    data.add("0");
  }
  return data;
}
