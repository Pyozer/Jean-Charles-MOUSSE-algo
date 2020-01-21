// EXO 05:
// Write code to remove duplicates from an unsorted linked list.
//

import 'package:test/test.dart';
import './ex04.dart';

void removeDuplicate<T>(LinkedList<T> list) {
  if (list.length < 2) return;

  Map<T, bool> scanned = {};
  Node<T> currNode = list.head;
  while (currNode != null) {
    if (scanned[currNode.value] != null) {
      list.deleteNode(currNode);
    } else {
      scanned[currNode.value] = true;
    }
    currNode = currNode.next;
  }
}

void main() {
  test("Test removeDuplicate with basic LinkedList", () {
    LinkedList<String> list = new LinkedList<String>();
    list.appendToTail("Head");
    list.appendToTail("MyValue1");
    list.appendToTail("MyValue1");
    list.appendToTail("MyValue2");
    list.appendToTail("MyValue2");
    list.appendToTail("Head");

    removeDuplicate(list);
    expect(list.length, equals(3));
    expect(list.head.value, equals("Head"));
    expect(list.head.next.value, equals("MyValue1"));
    expect(list.head.next.next.value, equals("MyValue2"));
    expect(list.head.next.next.next, isNull);

    removeDuplicate(list);
    expect(list.length, equals(3));
  });

  test("Test removeDuplicate with only duplicates values", () {
    LinkedList<String> list = new LinkedList<String>();
    list.appendToTail("Head");
    list.appendToTail("Head");
    list.appendToTail("Head");
    list.appendToTail("Head");

    removeDuplicate(list);
    expect(list.length, equals(1));
    expect(list.head.value, equals("Head"));
    expect(list.head.next, isNull);
  });
}
