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

String permute(String data, [int i = 0]) {
  if (i == data.length) return data;
  return [
    for (int j = i; j < data.length; j++) permute(swap(data, i, j), i + 1)
  ].join(',');
}

void main() {
  test("Test all permutation string", () {
    expect(permute("Hi"), equals('Hi,iH'));
    expect(permute("How"), equals('How,Hwo,oHw,owH,woH,wHo'));
    expect(permute("swap"), equals('swap,swpa,sawp,sapw,spaw,spwa,wsap,wspa,wasp,waps,wpas,wpsa,awsp,awps,aswp,aspw,apsw,apws,pwas,pwsa,paws,pasw,psaw,pswa'));
  });
}
