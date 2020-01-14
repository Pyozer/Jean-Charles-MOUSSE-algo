// EXO 01:
// Implement an algorithm to determine if a string has all unique characters.
// What if you can not use additional data structures?
//

import 'package:test/test.dart';

bool isOnlyUniqueChars(String value) {
  if (value.length < 2) {
    return true;
  }

  // Loop from start to end
  for (int i = 0; i < value.length; i++) {
    // Loop from next char of current to end
    for (int j = i + 1; j < value.length; j++) {
      if (value[i] == value[j]) {
        return false;
      }
    }
  }
  return true;
}

void main() {
  test("Test Anagram function", () {
    expect(isOnlyUniqueChars("Unique"), equals(true));
    expect(isOnlyUniqueChars("ItsUnique"), equals(true));
    expect(isOnlyUniqueChars("NotUNique"), equals(false));
    expect(isOnlyUniqueChars("Hello"), equals(false));
    expect(isOnlyUniqueChars("Let's rocks !"), equals(false));
  });
}
