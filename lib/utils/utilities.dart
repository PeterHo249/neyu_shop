import 'dart:math';

String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}

String formatNumber(double number) {
  int temp = number as int;
  String res = "$temp";

  var charList = res.split('').reversed;
  res = "";
  int index = 0;
  for (var char in charList) {
    if (index != 0 && index % 3 == 0) res = '.' + res;
    res = char + res;
    index += 1;
  }

  return res;
}
