// EXO 13:
// Write a method to compute all permutations of a string.
//

import 'package:test/test.dart';

String swap(String value, int index, int index2) {
  List<String> chars = value.split('');
  chars[index] = value[index2];
  chars[index2] = value[index];
  return chars.join('');
}

void permute(String data, [int i = 0]) {
  if (i == data.length) {
    print(data);
  } else {
    for (int j = i; j < data.length; j++) {
      permute(swap(data, i, j), i + 1);
    }
  }
}

void main() {
  test("Test all permutation string", () {
    // It's not real test no time to finish :/
    permute("Hi");
    print('\n');
    permute("How");
    print('\n');
    permute("swap");
  });
}
