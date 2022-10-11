import 'dart:convert';

import 'package:drift/drift.dart';

import 'connection/connection.dart' as impl;

part 'database.g.dart';

@DriftDatabase(include: {
  'sql/schema.drift',
  'sql/queries.drift',
  'sql/delete-edge.drift',
  'sql/delete-node.drift',
  'sql/insert-edge.drift',
  'sql/insert-node.drift',
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
  'sql/update-node.drift',
})
class GraphDatabase extends _$GraphDatabase {
  GraphDatabase({
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

  Future<void> addGraphData(Map<String, dynamic> data) {
    return transaction(() async {
      final localNodes = ((data['nodes'] ?? []) as List<dynamic>)
          .map((e) => NodesCompanion.insert(body: Value(jsonEncode(e))))
          .toList();
      final localEdges = ((data['edges'] ?? []) as List<dynamic>)
          .map((e) => EdgesCompanion.insert(
                source: Value(e['from']),
                target: Value(e['to']),
              ))
          .toList();
      await batch((batch) {
        batch.insertAll(nodes, localNodes);
        batch.insertAll(edges, localEdges);
      });
    });
  }
}
