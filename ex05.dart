// EXO 04:
// Create a Linked List with 2 methods: appendToTail(v: T) and deleteNode(index: number)
//

import 'package:test/test.dart';
import './ex04.dart';

void removeDuplicate<T>(LinkedList<T> list) {
  if (list.length < 2) return;

  Node<T> currNode = list.head;
  int i = 0;
  while (currNode != null) {
    Node<T> nextNode = currNode.next;
    int j = i + 1;
    // Iterate from curr to end
    while (nextNode != null) {
      if (currNode.value == nextNode.value) {
        nextNode = nextNode.next; // Store future next before delete
        list.deleteNode(j);
      } else {
        nextNode = nextNode.next;
        j++; // Increment index only when not deleting
      }
    }
    currNode = currNode.next;
    i++;
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
