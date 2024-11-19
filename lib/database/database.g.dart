// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Nodes extends Table with TableInfo<Nodes, Node> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Nodes(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      generatedAs: GeneratedAs(
          const CustomExpression('json_extract(body, \'\$.id\')'), false),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints:
          'GENERATED ALWAYS AS (json_extract(body, \'\$.id\')) VIRTUAL NOT NULL UNIQUE');
  @override
  List<GeneratedColumn> get $columns => [body, id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nodes';
  @override
  VerificationContext validateIntegrity(Insertable<Node> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Node map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Node(
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body']),
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
    );
  }

  @override
  Nodes createAlias(String alias) {
    return Nodes(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Node extends DataClass implements Insertable<Node> {
  final String? body;
  final String id;
  const Node({this.body, required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String>(body);
    }
    return map;
  }

  NodesCompanion toCompanion(bool nullToAbsent) {
    return NodesCompanion(
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
    );
  }

  factory Node.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Node(
      body: serializer.fromJson<String?>(json['body']),
      id: serializer.fromJson<String>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'body': serializer.toJson<String?>(body),
      'id': serializer.toJson<String>(id),
    };
  }

  Node copyWith({Value<String?> body = const Value.absent(), String? id}) =>
      Node(
        body: body.present ? body.value : this.body,
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('Node(')
          ..write('body: $body, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(body, id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Node && other.body == this.body && other.id == this.id);
}

class NodesCompanion extends UpdateCompanion<Node> {
  final Value<String?> body;
  final Value<int> rowid;
  const NodesCompanion({
    this.body = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NodesCompanion.insert({
    this.body = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<Node> custom({
    Expression<String>? body,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (body != null) 'body': body,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NodesCompanion copyWith({Value<String?>? body, Value<int>? rowid}) {
    return NodesCompanion(
      body: body ?? this.body,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NodesCompanion(')
          ..write('body: $body, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Edges extends Table with TableInfo<Edges, Edge> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Edges(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _targetMeta = const VerificationMeta('target');
  late final GeneratedColumn<String> target = GeneratedColumn<String>(
      'target', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _propertiesMeta =
      const VerificationMeta('properties');
  late final GeneratedColumn<String> properties = GeneratedColumn<String>(
      'properties', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [source, target, properties];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'edges';
  @override
  VerificationContext validateIntegrity(Insertable<Edge> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    }
    if (data.containsKey('target')) {
      context.handle(_targetMeta,
          target.isAcceptableOrUnknown(data['target']!, _targetMeta));
    }
    if (data.containsKey('properties')) {
      context.handle(
          _propertiesMeta,
          properties.isAcceptableOrUnknown(
              data['properties']!, _propertiesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {source, target, properties},
      ];
  @override
  Edge map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Edge(
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source']),
      target: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}target']),
      properties: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}properties']),
    );
  }

  @override
  Edges createAlias(String alias) {
    return Edges(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'UNIQUE(source, target, properties)ON CONFLICT REPLACE',
        'FOREIGN KEY(source)REFERENCES nodes(id)',
        'FOREIGN KEY(target)REFERENCES nodes(id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class Edge extends DataClass implements Insertable<Edge> {
  final String? source;
  final String? target;
  final String? properties;
  const Edge({this.source, this.target, this.properties});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    if (!nullToAbsent || target != null) {
      map['target'] = Variable<String>(target);
    }
    if (!nullToAbsent || properties != null) {
      map['properties'] = Variable<String>(properties);
    }
    return map;
  }

  EdgesCompanion toCompanion(bool nullToAbsent) {
    return EdgesCompanion(
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
      target:
          target == null && nullToAbsent ? const Value.absent() : Value(target),
      properties: properties == null && nullToAbsent
          ? const Value.absent()
          : Value(properties),
    );
  }

  factory Edge.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Edge(
      source: serializer.fromJson<String?>(json['source']),
      target: serializer.fromJson<String?>(json['target']),
      properties: serializer.fromJson<String?>(json['properties']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'source': serializer.toJson<String?>(source),
      'target': serializer.toJson<String?>(target),
      'properties': serializer.toJson<String?>(properties),
    };
  }

  Edge copyWith(
          {Value<String?> source = const Value.absent(),
          Value<String?> target = const Value.absent(),
          Value<String?> properties = const Value.absent()}) =>
      Edge(
        source: source.present ? source.value : this.source,
        target: target.present ? target.value : this.target,
        properties: properties.present ? properties.value : this.properties,
      );
  Edge copyWithCompanion(EdgesCompanion data) {
    return Edge(
      source: data.source.present ? data.source.value : this.source,
      target: data.target.present ? data.target.value : this.target,
      properties:
          data.properties.present ? data.properties.value : this.properties,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Edge(')
          ..write('source: $source, ')
          ..write('target: $target, ')
          ..write('properties: $properties')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(source, target, properties);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Edge &&
          other.source == this.source &&
          other.target == this.target &&
          other.properties == this.properties);
}

class EdgesCompanion extends UpdateCompanion<Edge> {
  final Value<String?> source;
  final Value<String?> target;
  final Value<String?> properties;
  final Value<int> rowid;
  const EdgesCompanion({
    this.source = const Value.absent(),
    this.target = const Value.absent(),
    this.properties = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EdgesCompanion.insert({
    this.source = const Value.absent(),
    this.target = const Value.absent(),
    this.properties = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<Edge> custom({
    Expression<String>? source,
    Expression<String>? target,
    Expression<String>? properties,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (source != null) 'source': source,
      if (target != null) 'target': target,
      if (properties != null) 'properties': properties,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EdgesCompanion copyWith(
      {Value<String?>? source,
      Value<String?>? target,
      Value<String?>? properties,
      Value<int>? rowid}) {
    return EdgesCompanion(
      source: source ?? this.source,
      target: target ?? this.target,
      properties: properties ?? this.properties,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (target.present) {
      map['target'] = Variable<String>(target.value);
    }
    if (properties.present) {
      map['properties'] = Variable<String>(properties.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EdgesCompanion(')
          ..write('source: $source, ')
          ..write('target: $target, ')
          ..write('properties: $properties, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class NodeEntries extends Table
    with
        TableInfo<NodeEntries, NodeEntry>,
        VirtualTableInfo<NodeEntries, NodeEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  NodeEntries(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [body];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'node_entries';
  @override
  VerificationContext validateIntegrity(Insertable<NodeEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  NodeEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NodeEntry(
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
    );
  }

  @override
  NodeEntries createAlias(String alias) {
    return NodeEntries(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs => 'fts5(body, content=nodes, content_rowid=id)';
}

class NodeEntry extends DataClass implements Insertable<NodeEntry> {
  final String body;
  const NodeEntry({required this.body});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['body'] = Variable<String>(body);
    return map;
  }

  NodeEntriesCompanion toCompanion(bool nullToAbsent) {
    return NodeEntriesCompanion(
      body: Value(body),
    );
  }

  factory NodeEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NodeEntry(
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'body': serializer.toJson<String>(body),
    };
  }

  NodeEntry copyWith({String? body}) => NodeEntry(
        body: body ?? this.body,
      );
  NodeEntry copyWithCompanion(NodeEntriesCompanion data) {
    return NodeEntry(
      body: data.body.present ? data.body.value : this.body,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NodeEntry(')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => body.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is NodeEntry && other.body == this.body);
}

class NodeEntriesCompanion extends UpdateCompanion<NodeEntry> {
  final Value<String> body;
  final Value<int> rowid;
  const NodeEntriesCompanion({
    this.body = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NodeEntriesCompanion.insert({
    required String body,
    this.rowid = const Value.absent(),
  }) : body = Value(body);
  static Insertable<NodeEntry> custom({
    Expression<String>? body,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (body != null) 'body': body,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NodeEntriesCompanion copyWith({Value<String>? body, Value<int>? rowid}) {
    return NodeEntriesCompanion(
      body: body ?? this.body,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NodeEntriesCompanion(')
          ..write('body: $body, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$GraphDatabase extends GeneratedDatabase {
  _$GraphDatabase(QueryExecutor e) : super(e);
  $GraphDatabaseManager get managers => $GraphDatabaseManager(this);
  late final Nodes nodes = Nodes(this);
  late final Edges edges = Edges(this);
  late final NodeEntries nodeEntries = NodeEntries(this);
  late final Trigger nodesInsert = Trigger(
      'CREATE TRIGGER nodes_insert AFTER INSERT ON nodes BEGIN INSERT INTO node_entries ("rowid", body) VALUES (new.id, new.body);END',
      'nodes_insert');
  late final Trigger nodesDelete = Trigger(
      'CREATE TRIGGER nodes_delete AFTER DELETE ON nodes BEGIN INSERT INTO node_entries (node_entries, "rowid", body) VALUES (\'delete\', old.id, old.body);END',
      'nodes_delete');
  late final Trigger nodesUpdate = Trigger(
      'CREATE TRIGGER nodes_update AFTER UPDATE ON nodes BEGIN INSERT INTO node_entries (node_entries, "rowid", body) VALUES (\'delete\', new.id, new.body);INSERT INTO node_entries ("rowid", body) VALUES (new.id, new.body);END',
      'nodes_update');
  late final Index idIdx =
      Index('id_idx', 'CREATE INDEX IF NOT EXISTS id_idx ON nodes (id)');
  late final Index sourceIdx = Index(
      'source_idx', 'CREATE INDEX IF NOT EXISTS source_idx ON edges (source)');
  late final Index targetIdx = Index(
      'target_idx', 'CREATE INDEX IF NOT EXISTS target_idx ON edges (target)');
  Future<int> updateNode(String var1, String var2) {
    return customUpdate(
      'UPDATE nodes SET body = json(?1) WHERE id = ?2',
      variables: [Variable<String>(var1), Variable<String>(var2)],
      updates: {nodes},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<String> traverse(String source) {
    return customSelect(
        'WITH RECURSIVE traverse (id) AS (SELECT ?1 UNION SELECT source FROM edges JOIN traverse ON target = id UNION SELECT target FROM edges JOIN traverse ON source = id) SELECT id FROM traverse',
        variables: [
          Variable<String>(source)
        ],
        readsFrom: {
          edges,
        }).map((QueryRow row) => row.read<String>('id'));
  }

  Selectable<TraverseWithBodiesResult> traverseWithBodies(String source) {
    return customSelect(
        'WITH RECURSIVE traverse (x, y, obj) AS (SELECT ?1, \'()\', \'{}\' UNION SELECT id, \'()\', body FROM nodes JOIN traverse ON id = x UNION SELECT source, \'<-\', properties FROM edges JOIN traverse ON target = x UNION SELECT target, \'->\', properties FROM edges JOIN traverse ON source = x) SELECT x, y, obj FROM traverse',
        variables: [
          Variable<String>(source)
        ],
        readsFrom: {
          nodes,
          edges,
        }).map((QueryRow row) => TraverseWithBodiesResult(
          x: row.read<String>('x'),
          y: row.read<String>('y'),
          obj: row.read<String>('obj'),
        ));
  }

  Selectable<TraverseWithBodiesOutboundResult> traverseWithBodiesOutbound(
      String source) {
    return customSelect(
        'WITH RECURSIVE traverse (x, y, obj) AS (SELECT ?1, \'()\', \'{}\' UNION SELECT id, \'()\', body FROM nodes JOIN traverse ON id = x UNION SELECT target, \'->\', properties FROM edges JOIN traverse ON source = x) SELECT x, y, obj FROM traverse',
        variables: [
          Variable<String>(source)
        ],
        readsFrom: {
          nodes,
          edges,
        }).map((QueryRow row) => TraverseWithBodiesOutboundResult(
          x: row.read<String>('x'),
          y: row.read<String>('y'),
          obj: row.read<String>('obj'),
        ));
  }

  Selectable<TraverseWithBodiesInboundResult> traverseWithBodiesInbound(
      String source) {
    return customSelect(
        'WITH RECURSIVE traverse (x, y, obj) AS (SELECT ?1, \'()\', \'{}\' UNION SELECT id, \'()\', body FROM nodes JOIN traverse ON id = x UNION SELECT source, \'<-\', properties FROM edges JOIN traverse ON target = x) SELECT x, y, obj FROM traverse',
        variables: [
          Variable<String>(source)
        ],
        readsFrom: {
          nodes,
          edges,
        }).map((QueryRow row) => TraverseWithBodiesInboundResult(
          x: row.read<String>('x'),
          y: row.read<String>('y'),
          obj: row.read<String>('obj'),
        ));
  }

  Selectable<String> traverseOutbound(String source) {
    return customSelect(
        'WITH RECURSIVE traverse (id) AS (SELECT ?1 UNION SELECT target FROM edges JOIN traverse ON source = id) SELECT id FROM traverse',
        variables: [
          Variable<String>(source)
        ],
        readsFrom: {
          edges,
        }).map((QueryRow row) => row.read<String>('id'));
  }

  Selectable<String> traverseInbound(String source) {
    return customSelect(
        'WITH RECURSIVE traverse (id) AS (SELECT ?1 UNION SELECT source FROM edges JOIN traverse ON target = id) SELECT id FROM traverse',
        variables: [
          Variable<String>(source)
        ],
        readsFrom: {
          edges,
        }).map((QueryRow row) => row.read<String>('id'));
  }

  Selectable<SearchNodeResult> searchNode(String query) {
    return customSelect(
        'SELECT"r"."body" AS "nested_0.body", "r"."id" AS "nested_0.id" FROM node_entries INNER JOIN nodes AS r ON r.id = node_entries."rowid" WHERE node_entries MATCH ?1 ORDER BY rank',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          nodeEntries,
          nodes,
        }).asyncMap((QueryRow row) async => SearchNodeResult(
          r: await nodes.mapFromRow(row, tablePrefix: 'nested_0'),
        ));
  }

  Selectable<String?> searchNodeById(String var1) {
    return customSelect('SELECT body FROM nodes WHERE id = ?1', variables: [
      Variable<String>(var1)
    ], readsFrom: {
      nodes,
    }).map((QueryRow row) => row.readNullable<String>('body'));
  }

  Selectable<Edge> searchEdges(String? var1, String? var2) {
    return customSelect(
        'SELECT * FROM edges WHERE source = ?1 UNION SELECT * FROM edges WHERE target = ?2',
        variables: [
          Variable<String>(var1),
          Variable<String>(var2)
        ],
        readsFrom: {
          edges,
        }).asyncMap(edges.mapFromRow);
  }

  Selectable<Edge> searchEdgesOutbound(String? var1) {
    return customSelect('SELECT * FROM edges WHERE target = ?1', variables: [
      Variable<String>(var1)
    ], readsFrom: {
      edges,
    }).asyncMap(edges.mapFromRow);
  }

  Selectable<Edge> searchEdgesInbound(String? var1) {
    return customSelect('SELECT * FROM edges WHERE source = ?1', variables: [
      Variable<String>(var1)
    ], readsFrom: {
      edges,
    }).asyncMap(edges.mapFromRow);
  }

  Future<int> insertNode(String text) {
    return customInsert(
      'INSERT INTO nodes VALUES (json(?1))',
      variables: [Variable<String>(text)],
      updates: {nodes},
    );
  }

  Future<int> insertEdge(String source, String target, String body) {
    return customInsert(
      'INSERT INTO edges VALUES (?1, ?2, json(?3))',
      variables: [
        Variable<String>(source),
        Variable<String>(target),
        Variable<String>(body)
      ],
      updates: {edges},
    );
  }

  Future<int> deleteNode(String var1) {
    return customUpdate(
      'DELETE FROM nodes WHERE id = ?1',
      variables: [Variable<String>(var1)],
      updates: {nodes},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteEdge(String? var1, String? var2) {
    return customUpdate(
      'DELETE FROM edges WHERE source = ?1 OR target = ?2',
      variables: [Variable<String>(var1), Variable<String>(var2)],
      updates: {edges},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Node> getAllNodes() {
    return customSelect('SELECT * FROM nodes', variables: [], readsFrom: {
      nodes,
    }).asyncMap(nodes.mapFromRow);
  }

  Selectable<Edge> getAllEdges() {
    return customSelect('SELECT * FROM edges', variables: [], readsFrom: {
      edges,
    }).asyncMap(edges.mapFromRow);
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        nodes,
        edges,
        nodeEntries,
        nodesInsert,
        nodesDelete,
        nodesUpdate,
        idIdx,
        sourceIdx,
        targetIdx
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('nodes',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('node_entries', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('nodes',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('node_entries', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('nodes',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('node_entries', kind: UpdateKind.insert),
            ],
          ),
        ],
      );
}

typedef $NodesCreateCompanionBuilder = NodesCompanion Function({
  Value<String?> body,
  Value<int> rowid,
});
typedef $NodesUpdateCompanionBuilder = NodesCompanion Function({
  Value<String?> body,
  Value<int> rowid,
});

class $NodesFilterComposer extends Composer<_$GraphDatabase, Nodes> {
  $NodesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));
}

class $NodesOrderingComposer extends Composer<_$GraphDatabase, Nodes> {
  $NodesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));
}

class $NodesAnnotationComposer extends Composer<_$GraphDatabase, Nodes> {
  $NodesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);
}

class $NodesTableManager extends RootTableManager<
    _$GraphDatabase,
    Nodes,
    Node,
    $NodesFilterComposer,
    $NodesOrderingComposer,
    $NodesAnnotationComposer,
    $NodesCreateCompanionBuilder,
    $NodesUpdateCompanionBuilder,
    (Node, BaseReferences<_$GraphDatabase, Nodes, Node>),
    Node,
    PrefetchHooks Function()> {
  $NodesTableManager(_$GraphDatabase db, Nodes table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $NodesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $NodesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $NodesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String?> body = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NodesCompanion(
            body: body,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String?> body = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NodesCompanion.insert(
            body: body,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $NodesProcessedTableManager = ProcessedTableManager<
    _$GraphDatabase,
    Nodes,
    Node,
    $NodesFilterComposer,
    $NodesOrderingComposer,
    $NodesAnnotationComposer,
    $NodesCreateCompanionBuilder,
    $NodesUpdateCompanionBuilder,
    (Node, BaseReferences<_$GraphDatabase, Nodes, Node>),
    Node,
    PrefetchHooks Function()>;
typedef $EdgesCreateCompanionBuilder = EdgesCompanion Function({
  Value<String?> source,
  Value<String?> target,
  Value<String?> properties,
  Value<int> rowid,
});
typedef $EdgesUpdateCompanionBuilder = EdgesCompanion Function({
  Value<String?> source,
  Value<String?> target,
  Value<String?> properties,
  Value<int> rowid,
});

class $EdgesFilterComposer extends Composer<_$GraphDatabase, Edges> {
  $EdgesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get target => $composableBuilder(
      column: $table.target, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get properties => $composableBuilder(
      column: $table.properties, builder: (column) => ColumnFilters(column));
}

class $EdgesOrderingComposer extends Composer<_$GraphDatabase, Edges> {
  $EdgesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get target => $composableBuilder(
      column: $table.target, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get properties => $composableBuilder(
      column: $table.properties, builder: (column) => ColumnOrderings(column));
}

class $EdgesAnnotationComposer extends Composer<_$GraphDatabase, Edges> {
  $EdgesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get target =>
      $composableBuilder(column: $table.target, builder: (column) => column);

  GeneratedColumn<String> get properties => $composableBuilder(
      column: $table.properties, builder: (column) => column);
}

class $EdgesTableManager extends RootTableManager<
    _$GraphDatabase,
    Edges,
    Edge,
    $EdgesFilterComposer,
    $EdgesOrderingComposer,
    $EdgesAnnotationComposer,
    $EdgesCreateCompanionBuilder,
    $EdgesUpdateCompanionBuilder,
    (Edge, BaseReferences<_$GraphDatabase, Edges, Edge>),
    Edge,
    PrefetchHooks Function()> {
  $EdgesTableManager(_$GraphDatabase db, Edges table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $EdgesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $EdgesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $EdgesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String?> source = const Value.absent(),
            Value<String?> target = const Value.absent(),
            Value<String?> properties = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EdgesCompanion(
            source: source,
            target: target,
            properties: properties,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String?> source = const Value.absent(),
            Value<String?> target = const Value.absent(),
            Value<String?> properties = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EdgesCompanion.insert(
            source: source,
            target: target,
            properties: properties,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $EdgesProcessedTableManager = ProcessedTableManager<
    _$GraphDatabase,
    Edges,
    Edge,
    $EdgesFilterComposer,
    $EdgesOrderingComposer,
    $EdgesAnnotationComposer,
    $EdgesCreateCompanionBuilder,
    $EdgesUpdateCompanionBuilder,
    (Edge, BaseReferences<_$GraphDatabase, Edges, Edge>),
    Edge,
    PrefetchHooks Function()>;
typedef $NodeEntriesCreateCompanionBuilder = NodeEntriesCompanion Function({
  required String body,
  Value<int> rowid,
});
typedef $NodeEntriesUpdateCompanionBuilder = NodeEntriesCompanion Function({
  Value<String> body,
  Value<int> rowid,
});

class $NodeEntriesFilterComposer
    extends Composer<_$GraphDatabase, NodeEntries> {
  $NodeEntriesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));
}

class $NodeEntriesOrderingComposer
    extends Composer<_$GraphDatabase, NodeEntries> {
  $NodeEntriesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));
}

class $NodeEntriesAnnotationComposer
    extends Composer<_$GraphDatabase, NodeEntries> {
  $NodeEntriesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);
}

class $NodeEntriesTableManager extends RootTableManager<
    _$GraphDatabase,
    NodeEntries,
    NodeEntry,
    $NodeEntriesFilterComposer,
    $NodeEntriesOrderingComposer,
    $NodeEntriesAnnotationComposer,
    $NodeEntriesCreateCompanionBuilder,
    $NodeEntriesUpdateCompanionBuilder,
    (NodeEntry, BaseReferences<_$GraphDatabase, NodeEntries, NodeEntry>),
    NodeEntry,
    PrefetchHooks Function()> {
  $NodeEntriesTableManager(_$GraphDatabase db, NodeEntries table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $NodeEntriesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $NodeEntriesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $NodeEntriesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> body = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NodeEntriesCompanion(
            body: body,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String body,
            Value<int> rowid = const Value.absent(),
          }) =>
              NodeEntriesCompanion.insert(
            body: body,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $NodeEntriesProcessedTableManager = ProcessedTableManager<
    _$GraphDatabase,
    NodeEntries,
    NodeEntry,
    $NodeEntriesFilterComposer,
    $NodeEntriesOrderingComposer,
    $NodeEntriesAnnotationComposer,
    $NodeEntriesCreateCompanionBuilder,
    $NodeEntriesUpdateCompanionBuilder,
    (NodeEntry, BaseReferences<_$GraphDatabase, NodeEntries, NodeEntry>),
    NodeEntry,
    PrefetchHooks Function()>;

class $GraphDatabaseManager {
  final _$GraphDatabase _db;
  $GraphDatabaseManager(this._db);
  $NodesTableManager get nodes => $NodesTableManager(_db, _db.nodes);
  $EdgesTableManager get edges => $EdgesTableManager(_db, _db.edges);
  $NodeEntriesTableManager get nodeEntries =>
      $NodeEntriesTableManager(_db, _db.nodeEntries);
}

class TraverseWithBodiesResult {
  final String x;
  final String y;
  final String obj;
  TraverseWithBodiesResult({
    required this.x,
    required this.y,
    required this.obj,
  });
}

class TraverseWithBodiesOutboundResult {
  final String x;
  final String y;
  final String obj;
  TraverseWithBodiesOutboundResult({
    required this.x,
    required this.y,
    required this.obj,
  });
}

class TraverseWithBodiesInboundResult {
  final String x;
  final String y;
  final String obj;
  TraverseWithBodiesInboundResult({
    required this.x,
    required this.y,
    required this.obj,
  });
}

class SearchNodeResult {
  final Node r;
  SearchNodeResult({
    required this.r,
  });
}
