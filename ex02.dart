// EXO 02:
// Write code to reverse a String
//

import 'package:test/test.dart';

String reverseString(String value) {
  if (value.length < 2) return value;

  String reversed = "";
  for (int i = value.length - 1; i >= 0; i--) {
    reversed += value[i];
  }
  return reversed;
}

void main() {
  test("Test reverseString function", () {
    expect(reverseString("Hello"), equals("olleH"));
    expect(reverseString("How are you"), equals("uoy era woH"));
    expect(reverseString("Laval"), equals("lavaL"));
    expect(reverseString("Reversed"), equals("desreveR"));
    expect(reverseString("Hi"), equals("iH"));
    expect(reverseString("H"), equals("H"));
    expect(reverseString(""), equals(""));
  });
}
