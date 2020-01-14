// EXO 03:
// Write a method to decide if two strings are anagrams or not.
//

import 'package:test/test.dart';

bool isAnagram(String first, String second) {
  if (first.length != second.length) return false;
  if (first.toLowerCase() == second.toLowerCase()) return true;

  String editedSecond = second.toLowerCase();
  for (int i = 0; i < first.length; i++) {
    int indexFound = editedSecond.indexOf(first[i].toLowerCase());
    if (indexFound < 0) {
      return false;
    }
    editedSecond = editedSecond.replaceRange(indexFound, indexFound + 1, '');
  }
  return true;
}

void main() {
  test("Test Anagram function", () {
    expect(isAnagram("chien", "chine"), equals(true));
    expect(isAnagram("Imaginer", "Migraine"), equals(true));
    expect(isAnagram("Parisien", "Aspirine"), equals(true));
    expect(isAnagram("police", "picole"), equals(true));
    expect(isAnagram("same", "Same"), equals(true));
    expect(isAnagram("hello", "hi"), equals(false));
    expect(isAnagram("MacOs", "Windows"), equals(false));
  });
}
