import 'dart:math';
import 'package:test/test.dart';
import './ex17.dart';

int getTreeHeight<T extends num>(BinaryNode<T> node) {
  if (node == null) return 0;
  return 1 + max(getTreeHeight(node.left), getTreeHeight(node.right));
}

bool isTreeBalanced<T extends num>(BinaryNode<T> node) {
  if (node == null) return true;
  int hDiff = (getTreeHeight(node.left) - getTreeHeight(node.right)).abs();
  if (hDiff <= 1 && isTreeBalanced(node.left) && isTreeBalanced(node.right)) {
    return true;
  }
  return false;
}

void main() {
  test('Test a Tree not balanced', () {
    final tree = new Tree<int>();
    tree.insert(10);
    tree.insert(5);
    tree.insert(13);
    tree.insert(15);
    tree.insert(14);
    tree.insert(12);

    /*
                       10
                      /  \
                    5    13
                        /  \
                      12    15
                          /
                        14
    */

    expect(isTreeBalanced(tree.root), isFalse);
    expect(isTreeBalanced(tree.search(13)), isTrue);
  });

  test('Test a Tree balanced', () {
    final tree = new Tree<int>();
    tree.insert(10);
    tree.insert(5);
    tree.insert(13);
    tree.insert(12);
    tree.insert(15);
    tree.insert(14);
    tree.insert(7);

    /*
                       10
                    /     \
                  5       13
                   \     /  \
                    7  12   15
                           /
                        14
    */

    expect(isTreeBalanced(tree.root), isTrue);
  });

  test('Test another Tree balanced', () {
    final tree = new Tree<int>();
    tree.insert(10);
    tree.insert(5);
    tree.insert(4);
    tree.insert(13);
    tree.insert(12);
    tree.insert(15);
    tree.insert(7);

    /*
                       10
                    /     \
                  5       13
                /  \     /  \
              4     7  12   15
    */

    expect(isTreeBalanced(tree.root), isTrue);
  });
}
