import 'package:e_report/data.dart';

CharType getType(String l) {
  try {
    if ("$l" == "0") {
      return CharType.empty;
    }

    var isInt = int.tryParse("${l}0");

    if (isInt != null) {
      return CharType.numberInt;
    } else {
      var isNum = double.tryParse("${l}0");

      return isNum == null ? CharType.operatorSign : CharType.numberDouble;
    }
  } catch (e) {
    return CharType.empty;
  }
}

List<String> deleteLastChar(List<String> data) {
  var l = data.last;

  switch (getType(l)) {
    case CharType.operatorSign:
    case CharType.empty:
      {
        if (data.length > 1) {
          data.removeLast();
        }
        return data;
      }

      break;
    case CharType.numberDouble:
      {
        return deleteLastDigitLastChar(data);
      }
    case CharType.numberInt:
      {
        return deleteLastDigitLastChar(data);
      }
      break;
    default:
  }
  return data;
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
    print("delete empty....");
    return data;
  }

  var beforLast = data[data.length - 2];
  print("b4.....$beforLast");
  if (ldType == CharType.empty && getType(beforLast) == CharType.operatorSign) {
    data.removeLast();
    data.removeLast();
    return data;
  }

  print("b4.....$beforLast");
  data.removeLast();
  lastDigit = lastDigit.substring(0, (lastDigit.length - 1));
  data.add(lastDigit.isEmpty ? "0" : lastDigit);

  return data;
}

List<String> addOperator(List<String> data, String op) {
  data.add("$op");
  data.add("0");
  return data;
}
