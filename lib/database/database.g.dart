// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Node extends DataClass implements Insertable<Node> {
  final int id;
  final Map<String, dynamic> data;
  final DateTime created;
  final DateTime updated;
  const Node(
      {required this.id,
      required this.data,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      final converter = $NodesTable.$converter0;
      map['data'] = Variable<String>(converter.toSql(data));
    }
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  NodesCompanion toCompanion(bool nullToAbsent) {
    return NodesCompanion(
      id: Value(id),
      data: Value(data),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory Node.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Node(
      id: serializer.fromJson<int>(json['id']),
      data: serializer.fromJson<Map<String, dynamic>>(json['data']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'data': serializer.toJson<Map<String, dynamic>>(data),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  Node copyWith(
          {int? id,
          Map<String, dynamic>? data,
          DateTime? created,
          DateTime? updated}) =>
      Node(
        id: id ?? this.id,
        data: data ?? this.data,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Node(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, data, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Node &&
          other.id == this.id &&
          other.data == this.data &&
          other.created == this.created &&
          other.updated == this.updated);
}

class NodesCompanion extends UpdateCompanion<Node> {
  final Value<int> id;
  final Value<Map<String, dynamic>> data;
  final Value<DateTime> created;
  final Value<DateTime> updated;
  const NodesCompanion({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  NodesCompanion.insert({
    this.id = const Value.absent(),
    required Map<String, dynamic> data,
    required DateTime created,
    required DateTime updated,
  })  : data = Value(data),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Node> custom({
    Expression<int>? id,
    Expression<String>? data,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (data != null) 'data': data,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  NodesCompanion copyWith(
      {Value<int>? id,
      Value<Map<String, dynamic>>? data,
      Value<DateTime>? created,
      Value<DateTime>? updated}) {
    return NodesCompanion(
      id: id ?? this.id,
      data: data ?? this.data,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (data.present) {
      final converter = $NodesTable.$converter0;
      map['data'] = Variable<String>(converter.toSql(data.value));
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NodesCompanion(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class $NodesTable extends Nodes with TableInfo<$NodesTable, Node> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NodesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      data = GeneratedColumn<String>('data', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>($NodesTable.$converter0);
  final VerificationMeta _createdMeta = const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _updatedMeta = const VerificationMeta('updated');
  @override
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, data, created, updated];
  @override
  String get aliasedName => _alias ?? 'nodes';
  @override
  String get actualTableName => 'nodes';
  @override
  VerificationContext validateIntegrity(Insertable<Node> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_dataMeta, const VerificationResult.success());
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Node map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Node(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      data: $NodesTable.$converter0.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!),
      created: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  $NodesTable createAlias(String alias) {
    return $NodesTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $converter0 =
      const JsonMapper();
}

class TextEntrie extends DataClass implements Insertable<TextEntrie> {
  final String data;
  const TextEntrie({required this.data});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['data'] = Variable<String>(data);
    return map;
  }

  TextEntriesCompanion toCompanion(bool nullToAbsent) {
    return TextEntriesCompanion(
      data: Value(data),
    );
  }

  factory TextEntrie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TextEntrie(
      data: serializer.fromJson<String>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'data': serializer.toJson<String>(data),
    };
  }

  TextEntrie copyWith({String? data}) => TextEntrie(
        data: data ?? this.data,
      );
  @override
  String toString() {
    return (StringBuffer('TextEntrie(')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => data.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TextEntrie && other.data == this.data);
}

class TextEntriesCompanion extends UpdateCompanion<TextEntrie> {
  final Value<String> data;
  const TextEntriesCompanion({
    this.data = const Value.absent(),
  });
  TextEntriesCompanion.insert({
    required String data,
  }) : data = Value(data);
  static Insertable<TextEntrie> custom({
    Expression<String>? data,
  }) {
    return RawValuesInsertable({
      if (data != null) 'data': data,
    });
  }

  TextEntriesCompanion copyWith({Value<String>? data}) {
    return TextEntriesCompanion(
      data: data ?? this.data,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TextEntriesCompanion(')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }
}

class TextEntries extends Table
    with
        TableInfo<TextEntries, TextEntrie>,
        VirtualTableInfo<TextEntries, TextEntrie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TextEntries(this.attachedDatabase, [this._alias]);
  final VerificationMeta _dataMeta = const VerificationMeta('data');
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [data];
  @override
  String get aliasedName => _alias ?? 'text_entries';
  @override
  String get actualTableName => 'text_entries';
  @override
  VerificationContext validateIntegrity(Insertable<TextEntrie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  TextEntrie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TextEntrie(
      data: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
    );
  }

  @override
  TextEntries createAlias(String alias) {
    return TextEntries(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs => 'fts5(data, content=nodes, content_rowid=id)';
}

class Edge extends DataClass implements Insertable<Edge> {
  final int id;
  final Map<String, dynamic> data;
  final int from;
  final int to;
  final DateTime created;
  final DateTime updated;
  const Edge(
      {required this.id,
      required this.data,
      required this.from,
      required this.to,
      required this.created,
      required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      final converter = $EdgesTable.$converter0;
      map['data'] = Variable<String>(converter.toSql(data));
    }
    map['from'] = Variable<int>(from);
    map['to'] = Variable<int>(to);
    map['created'] = Variable<DateTime>(created);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  EdgesCompanion toCompanion(bool nullToAbsent) {
    return EdgesCompanion(
      id: Value(id),
      data: Value(data),
      from: Value(from),
      to: Value(to),
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory Edge.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Edge(
      id: serializer.fromJson<int>(json['id']),
      data: serializer.fromJson<Map<String, dynamic>>(json['data']),
      from: serializer.fromJson<int>(json['from']),
      to: serializer.fromJson<int>(json['to']),
      created: serializer.fromJson<DateTime>(json['created']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'data': serializer.toJson<Map<String, dynamic>>(data),
      'from': serializer.toJson<int>(from),
      'to': serializer.toJson<int>(to),
      'created': serializer.toJson<DateTime>(created),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  Edge copyWith(
          {int? id,
          Map<String, dynamic>? data,
          int? from,
          int? to,
          DateTime? created,
          DateTime? updated}) =>
      Edge(
        id: id ?? this.id,
        data: data ?? this.data,
        from: from ?? this.from,
        to: to ?? this.to,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Edge(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, data, from, to, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Edge &&
          other.id == this.id &&
          other.data == this.data &&
          other.from == this.from &&
          other.to == this.to &&
          other.created == this.created &&
          other.updated == this.updated);
}

class EdgesCompanion extends UpdateCompanion<Edge> {
  final Value<int> id;
  final Value<Map<String, dynamic>> data;
  final Value<int> from;
  final Value<int> to;
  final Value<DateTime> created;
  final Value<DateTime> updated;
  const EdgesCompanion({
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    this.from = const Value.absent(),
    this.to = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  EdgesCompanion.insert({
    this.id = const Value.absent(),
    required Map<String, dynamic> data,
    required int from,
    required int to,
    required DateTime created,
    required DateTime updated,
  })  : data = Value(data),
        from = Value(from),
        to = Value(to),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Edge> custom({
    Expression<int>? id,
    Expression<String>? data,
    Expression<int>? from,
    Expression<int>? to,
    Expression<DateTime>? created,
    Expression<DateTime>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (data != null) 'data': data,
      if (from != null) 'from': from,
      if (to != null) 'to': to,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  EdgesCompanion copyWith(
      {Value<int>? id,
      Value<Map<String, dynamic>>? data,
      Value<int>? from,
      Value<int>? to,
      Value<DateTime>? created,
      Value<DateTime>? updated}) {
    return EdgesCompanion(
      id: id ?? this.id,
      data: data ?? this.data,
      from: from ?? this.from,
      to: to ?? this.to,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (data.present) {
      final converter = $EdgesTable.$converter0;
      map['data'] = Variable<String>(converter.toSql(data.value));
    }
    if (from.present) {
      map['from'] = Variable<int>(from.value);
    }
    if (to.present) {
      map['to'] = Variable<int>(to.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EdgesCompanion(')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class $EdgesTable extends Edges with TableInfo<$EdgesTable, Edge> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EdgesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      data = GeneratedColumn<String>('data', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>($EdgesTable.$converter0);
  final VerificationMeta _fromMeta = const VerificationMeta('from');
  @override
  late final GeneratedColumn<int> from = GeneratedColumn<int>(
      'from', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES "nodes" ("id")');
  final VerificationMeta _toMeta = const VerificationMeta('to');
  @override
  late final GeneratedColumn<int> to = GeneratedColumn<int>(
      'to', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES "nodes" ("id")');
  final VerificationMeta _createdMeta = const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _updatedMeta = const VerificationMeta('updated');
  @override
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, data, from, to, created, updated];
  @override
  String get aliasedName => _alias ?? 'edges';
  @override
  String get actualTableName => 'edges';
  @override
  VerificationContext validateIntegrity(Insertable<Edge> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_dataMeta, const VerificationResult.success());
    if (data.containsKey('from')) {
      context.handle(
          _fromMeta, from.isAcceptableOrUnknown(data['from']!, _fromMeta));
    } else if (isInserting) {
      context.missing(_fromMeta);
    }
    if (data.containsKey('to')) {
      context.handle(_toMeta, to.isAcceptableOrUnknown(data['to']!, _toMeta));
    } else if (isInserting) {
      context.missing(_toMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Edge map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Edge(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      data: $EdgesTable.$converter0.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!),
      from: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}from'])!,
      to: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}to'])!,
      created: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      updated: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  $EdgesTable createAlias(String alias) {
    return $EdgesTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $converter0 =
      const JsonMapper();
}

abstract class _$SqLiteDatabase extends GeneratedDatabase {
  _$SqLiteDatabase(QueryExecutor e) : super(e);
  _$SqLiteDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final $NodesTable nodes = $NodesTable(this);
  late final TextEntries textEntries = TextEntries(this);
  late final Trigger nodesInsert = Trigger(
      'CREATE TRIGGER nodes_insert AFTER INSERT ON nodes BEGIN INSERT INTO text_entries ("rowid", data) VALUES (new.id, new.data);END',
      'nodes_insert');
  late final Trigger nodesDelete = Trigger(
      'CREATE TRIGGER nodes_delete AFTER DELETE ON nodes BEGIN INSERT INTO text_entries (text_entries, "rowid", data) VALUES (\'delete\', old.id, old.data);END',
      'nodes_delete');
  late final Trigger nodesUpdate = Trigger(
      'CREATE TRIGGER nodes_update AFTER UPDATE ON nodes BEGIN INSERT INTO text_entries (text_entries, "rowid", data) VALUES (\'delete\', new.id, new.data);INSERT INTO text_entries ("rowid", data) VALUES (new.id, new.data);END',
      'nodes_update');
  late final $EdgesTable edges = $EdgesTable(this);
  Selectable<SearchResult> _search(String query) {
    return customSelect(
        'SELECT"r"."id" AS "nested_0.id", "r"."data" AS "nested_0.data", "r"."created" AS "nested_0.created", "r"."updated" AS "nested_0.updated" FROM text_entries INNER JOIN nodes AS r ON r.id = text_entries."rowid" WHERE text_entries MATCH ?1 ORDER BY rank',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          textEntries,
          nodes,
        }).asyncMap((QueryRow row) async {
      return SearchResult(
        r: await nodes.mapFromRow(row, tablePrefix: 'nested_0'),
      );
    });
  }

  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [nodes, textEntries, nodesInsert, nodesDelete, nodesUpdate, edges];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('nodes',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('text_entries', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('nodes',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('text_entries', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('nodes',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('text_entries', kind: UpdateKind.insert),
            ],
          ),
        ],
      );
}

class SearchResult {
  final Node r;
  SearchResult({
    required this.r,
  });
}
