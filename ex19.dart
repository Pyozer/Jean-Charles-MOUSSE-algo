import 'package:test/test.dart';
import './ex17.dart';

BinaryNode<T> createNodes<T extends num>(List<T> sortedArray) {
  if ((sortedArray?.length ?? 0) == 0) return null;

  final middleIndex = (sortedArray.length / 2).floor();
  
  final node = new BinaryNode<T>(sortedArray[middleIndex]);
  node.left = createNodes(sortedArray.sublist(0, middleIndex));
  node.right = createNodes(sortedArray.sublist(middleIndex + 1));
  return node;
}

Tree<T> createTreeFromSortedArray<T extends num>(List<T> sortedArray) {
  final tree = new Tree<T>();
  tree.root = createNodes(sortedArray);

  return tree;
}

void main() {
  test('Test a Tree created from sorted Array of 1 element', () {
    final tree = createTreeFromSortedArray([10]);

    /*
          10
        /   \
      null  null
    */
    expect(tree.root.value, equals(10));
    expect(tree.root.left, isNull);
    expect(tree.root.right, isNull);
  });

  test('Test a Tree created from sorted Array of 2 elements', () {
    final tree = createTreeFromSortedArray([10, 12]);

    /*
          12
        /   \
      10   null
    */
    expect(tree.root.value, equals(12));
    expect(tree.root.left.value, equals(10));
    expect(tree.root.right, isNull);
  });

  test('Test a Tree created from sorted Array of 3 elements', () {
    final tree = createTreeFromSortedArray([10, 12, 20]);

    /*
          12
        /   \
      10    20
    */
    expect(tree.root.value, equals(12));
    expect(tree.root.left.value, equals(10));
    expect(tree.root.right.value, equals(20));
  });

  test('Test a Tree created from sorted Array of 4 elements', () {
    final tree = createTreeFromSortedArray([1, 2, 3, 4]);

    /*
            3
         /   \
       2      4
      /
     1
    */
    expect(tree.root.value, equals(3));
    expect(tree.root.left.value, equals(2));
    expect(tree.root.left.left.value, equals(1));
    expect(tree.root.right.value, equals(4));
  });

  test('Test a Tree created from sorted Array of 5 elements', () {
    final tree = createTreeFromSortedArray([1, 5, 9, 13, 17]);

    /*
            9
         /   \
       5      17
      /      /
     1      13
    */
    expect(tree.root.value, equals(9));
    expect(tree.root.left.value, equals(5));
    expect(tree.root.left.left.value, equals(1));
    expect(tree.root.right.value, equals(17));
    expect(tree.root.right.left.value, equals(13));
  });

  test('Test a Tree created from sorted Array of 6 elements', () {
    final tree = createTreeFromSortedArray([1, 5, 9, 13, 17, 21]);

    /*
            13
         /   \
       5      21
      /\     /
     1  9   17
    */
    expect(tree.root.value, equals(13));
    expect(tree.root.left.value, equals(5));
    expect(tree.root.left.left.value, equals(1));
    expect(tree.root.left.right.value, equals(9));

    expect(tree.root.right.value, equals(21));
    expect(tree.root.right.left.value, equals(17));
  });

  test('Test a Tree created from sorted Array of 7 elements', () {
    final tree = createTreeFromSortedArray([1, 5, 9, 13, 17, 21, 25]);

    /*
            13
         /   \
       5      21
      /\     / \
     1  9   17  25
    */
    expect(tree.root.value, equals(13));
    expect(tree.root.left.value, equals(5));
    expect(tree.root.left.left.value, equals(1));
    expect(tree.root.left.right.value, equals(9));

    expect(tree.root.right.value, equals(21));
    expect(tree.root.right.left.value, equals(17));
    expect(tree.root.right.right.value, equals(25));
  });

  test('Test a Tree created from sorted Array of 8 elements', () {
    final tree = createTreeFromSortedArray([1, 5, 9, 13, 17, 21, 25, 29]);

    /*
              17
            /   \
           9      25
          /\     / \
         5 13   21 29
       /
     1
    */
    expect(tree.root.value, equals(17));
    expect(tree.root.left.value, equals(9));
    expect(tree.root.left.left.value, equals(5));
    expect(tree.root.left.left.left.value, equals(1));
    expect(tree.root.left.right.value, equals(13));

    expect(tree.root.right.value, equals(25));
    expect(tree.root.right.left.value, equals(21));
    expect(tree.root.right.right.value, equals(29));
  });
}
