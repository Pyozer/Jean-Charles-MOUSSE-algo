import 'package:test/test.dart';

typedef bool SortCallback<T>(T a, T b);

class Graph<T> {
  Map<T, List<T>> _adjencies = new Map();

  void addNode(T value) {
    this._adjencies[value] = [];
  }

  void addNodeFromArray(List<T> values) {
    values.forEach(this.addNode);
  }

  void addEdge(T origin, T sibling) {
    this._adjencies[origin].add(sibling);
    this._adjencies[sibling].add(origin);
  }

  void removeNode(T value) {
    this._adjencies[value].forEach((edge) {
      this._adjencies[edge].remove(value);
    });
    this._adjencies[value].clear(); // Useless because of remove next ?
    this._adjencies.remove(value);
  }

  void removeEdge(T origin, T sibling) {
    this._adjencies[origin].remove(sibling);
    this._adjencies[sibling].remove(origin);
  }

  List<T> sort(SortCallback<T> callback) {
    return this._adjencies.keys.toList()
      ..sort((a, b) {
        if (callback(a, b)) return -1;
        return 1;
      });
  }

  List<T> getNodeEdges(T value) {
    return this._adjencies[value];
  }

  void dump() {
    this._adjencies.forEach((key, values) {
      print("$key -> ${values.join(' ')}");
    });
  }
}

void main() {
  test('Test Graph', () {
    final g = new Graph<int>();

    g.addNodeFromArray([1, 2, 4, 5, 6, 7, 8, 10, 13, 42]);
    g.addEdge(1, 2);
    g.addEdge(1, 13);
    g.addEdge(1, 6);
    g.addEdge(1, 7);
    g.addEdge(1, 5);

    expect(g.getNodeEdges(1), equals([2, 13, 6, 7, 5]));

    g.addEdge(2, 4);
    g.addEdge(5, 10);
    g.addEdge(5, 8);
    g.addEdge(4, 8);
    g.addEdge(8, 42);

    expect(g.getNodeEdges(2), equals([1, 4]));
    expect(g.getNodeEdges(5), equals([1, 10, 8]));
    expect(g.getNodeEdges(4), equals([2, 8]));
    expect(g.getNodeEdges(8), equals([5, 4, 42]));

    g.dump();

    g.removeNode(5);

    expect(g.getNodeEdges(5), isNull);
    expect(g.getNodeEdges(8), equals([4, 42])); // No more 5 as edge
    expect(g.getNodeEdges(1), equals([2, 13, 6, 7])); // No more 5 as edge

    g.removeEdge(1, 13);
    g.removeEdge(8, 42);

    final graphSortedAsc = g.sort((a, b) => a < b);
    expect(graphSortedAsc, equals([1, 2, 4, 6, 7, 8, 10, 13, 42]));
    print('g.sort(<): ${graphSortedAsc}');

    final graphSortedDesc = g.sort((a, b) => a > b);
    expect(graphSortedDesc, equals([42, 13, 10, 8, 7, 6, 4, 2, 1]));
    print('g.sort(>): ${graphSortedDesc}');
  });
}
