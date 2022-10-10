import 'package:drift/drift.dart';

import 'connection/connection.dart' as impl;
import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(include: {
  // 'sql.drift',
  'sql/schema.drift',
  'sql/delete-edge.drift',
  'sql/delete-node.drift',
  'sql/insert-edge.drift',
  'sql/insert-node.drift',
  'sql/update-node.drift',
  'sql/search-edges-inbound.drift',
  'sql/search-edges-outbound.drift',
  'sql/search-edges.drift',
  'sql/search-node-by-id.drift',
  'sql/search-node.drift',
  'sql/traverse-inbound.drift',
  'sql/traverse-outbound.drift',
  'sql/traverse-with-bodies-inbound.drift',
  'sql/traverse-with-bodies-outbound.drift',
  'sql/traverse-with-bodies.drift',
  'sql/traverse.drift',
})
class SqLiteDatabase extends _$SqLiteDatabase {
  SqLiteDatabase({
    String dbName = 'graph_db.db',
    DatabaseConnection? connection,
    bool useWebWorker = false,
    bool logStatements = false,
  }) : super.connect(
          connection ??
              impl.connect(
                dbName,
                useWebWorker: useWebWorker,
                logStatements: logStatements,
              ),
        );

  @override
  int get schemaVersion => 1;

  // // Create Node
  // Future<int> createNode(Map<String, dynamic> data) async {
  //   final id = await into(nodes).insert(
  //     NodesCompanion.insert(
  //       data: data,
  //       created: DateTime.now(),
  //       updated: DateTime.now(),
  //     ),
  //     mode: InsertMode.insertOrReplace,
  //   );
  //   return id;
  // }

  // // Update Node
  // Future<int> updateNode(int id, Map<String, dynamic> data) async {
  //   final updated = await (update(nodes)..where((t) => t.id.equals(id))).write(
  //     NodesCompanion(
  //       data: Value(data),
  //       updated: Value(DateTime.now()),
  //     ),
  //   );
  //   return updated;
  // }

  // // Delete Node
  // Future<int> deleteNode(int id) async {
  //   final deleted = await (delete(nodes)..where((t) => t.id.equals(id))).go();
  //   return deleted;
  // }

  // // Create Edge
  // Future<int> createEdge(
  //   int from,
  //   int to, {
  //   Map<String, dynamic> data = const {},
  // }) async {
  //   final id = await into(edges).insert(
  //     EdgesCompanion.insert(
  //       data: data,
  //       from: from,
  //       to: to,
  //       created: DateTime.now(),
  //       updated: DateTime.now(),
  //     ),
  //     mode: InsertMode.insertOrReplace,
  //   );
  //   return id;
  // }

  // // Update Edge
  // Future<int> updateEdge(int id, Map<String, dynamic> data) async {
  //   final updated = await (update(edges)..where((t) => t.id.equals(id))).write(
  //     EdgesCompanion(
  //       data: Value(data),
  //       updated: Value(DateTime.now()),
  //     ),
  //   );
  //   return updated;
  // }

  // // Delete Edge
  // Future<int> deleteEdge(int id) async {
  //   final deleted = await (delete(edges)..where((t) => t.id.equals(id))).go();
  //   return deleted;
  // }

  // // Search Nodes
  // Future<List<Node>> searchNodes(String query) async {
  //   final results = await _search(query).get();
  //   return results.fold<List<Node>>(<Node>[], (prev, item) {
  //     prev.add(item.r);
  //     return prev;
  //   });
  // }

  // // Watch Nodes
  // Stream<List<Node>> watchNodes() => select(nodes).watch();

  // // Get nodes
  // Future<List<Node>> getNodes() => select(nodes).get();

  // // Get node
  // Future<Node?> getNode(int id) =>
  //     (select(nodes)..where((t) => t.id.equals(id))).getSingleOrNull();

  // // Watch Edges
  // Stream<List<Edge>> watchEdges() => select(edges).watch();

  // // Get edges
  // Future<List<Edge>> getEdges() => select(edges).get();

  // // Get edge
  // Future<Edge?> getEdge(int id) =>
  //     (select(edges)..where((t) => t.id.equals(id))).getSingleOrNull();
}
