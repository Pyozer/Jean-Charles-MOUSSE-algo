// EXO 06:
// Implement an algorithm to find the nth to last element of a singly linked list.
//

import 'package:test/test.dart';
import './ex04.dart';

LinkedList<T> findNthToLast<T>(LinkedList<T> list, int n) {
  if (list.length == 0 && n == 0) return new LinkedList<T>();
  if (n >= list.length) throw new IndexError(n, list);
  // Find the nth element
  Node<T> nodeN = list.head;
  for (int i = 0; i < n; i++) {
    nodeN = nodeN.next;
  }
  LinkedList<T> sublist = new LinkedList<T>();
  sublist.appendToTail(nodeN.value);

  // Add next elements in sublist
  Node<T> nodeEnd = nodeN.next;
  while (nodeEnd != null) {
    sublist.appendToTail(nodeEnd.value);
    nodeEnd = nodeEnd.next;
  }
  return sublist;
}

void main() {
  test("Test findNthToLast with basic LinkedList", () {
    LinkedList<String> list = new LinkedList<String>();
    list.appendToTail("Head");
    list.appendToTail("MyValue1");
    list.appendToTail("MyValue2");
    list.appendToTail("MyValue3");
    list.appendToTail("MyValue4");
    list.appendToTail("Tail");
    expect(list.length, equals(6));

    LinkedList<String> sublist = findNthToLast(list, 3);
    expect(sublist.length, equals(3));
    expect(sublist.head.value, equals("MyValue3"));
    expect(sublist.head.next.value, equals("MyValue4"));
    expect(sublist.head.next.next.value, equals("Tail"));
  });

  test("Test findNthToLast with empty LinkedList", () {
    LinkedList<String> list = new LinkedList<String>();

    LinkedList<String> sublist = findNthToLast(list, 0);
    expect(sublist.length, equals(0));

    expect(() => findNthToLast(list, 5), throwsA(TypeMatcher<IndexError>()));

    list.appendToTail("Hello");
    expect(findNthToLast(list, 0).length, equals(1));
    expect(() => findNthToLast(list, 1), throwsA(TypeMatcher<IndexError>()));
  });
}
