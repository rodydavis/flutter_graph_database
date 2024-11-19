import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graph_database/flutter_graph_database.dart' as db;
import 'package:graphview/GraphView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Graph Database',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final database = db.GraphDatabase(NativeDatabase.memory());
  Graph graph = Graph();
  Algorithm builder = FruchtermanReingoldAlgorithm();

  final nodes = <String, db.Node>{};
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadData());
  }

  @override
  void reassemble() {
    super.reassemble();
    loadData();
  }

  void setLoadedState(bool value) {
    if (mounted) {
      setState(() {
        loaded = value;
      });
    }
  }

  Future<void> addDummyData() async {
    // Load example data
    try {
      await database.deleteAll();
      await database.addGraphData({
        "nodes": [
          {
            "id": '1',
            "label": 'circle',
          },
          {
            "id": '2',
            "label": 'ellipse',
          },
          {
            "id": '3',
            "label": 'database',
          },
          {
            "id": '4',
            "label": 'box',
          },
          {
            "id": '5',
            "label": 'diamond',
          },
          {
            "id": '6',
            "label": 'dot',
          },
          {
            "id": '7',
            "label": 'square',
          },
          {
            "id": '8',
            "label": 'triangle',
          },
          {
            "id": '9',
            "label": "star",
          },
        ],
        "edges": [
          {"from": '1', "to": '2'},
          {"from": '2', "to": '3'},
          {"from": '2', "to": '4'},
          {"from": '2', "to": '5'},
          {"from": '5', "to": '6'},
          {"from": '5', "to": '7'},
          {"from": '6', "to": '8'},
          {"from": '2', "to": '8'},
          {"from": '1', "to": '8'},
          {"from": '1', "to": '7'},
          {"from": '1', "to": '6'},
          {"from": '1', "to": '5'},
          {"from": '1', "to": '4'},
          {"from": '1', "to": '3'},
          {"from": '1', "to": '9'},
          {"from": '9', "to": '8'},
          {"from": '9', "to": '5'},
          {"from": '9', "to": '3'},
        ]
      });
      loadData();
    } catch (e) {
      debugPrint('Error loading example data: $e');
    }
  }

  Future<void> loadData() async {
    setLoadedState(false);

    final nodeMap = <String, Node>{};
    this.nodes.clear();
    graph = Graph();
    builder = FruchtermanReingoldAlgorithm();

    // Load graph data
    final nodes = await database.getAllNodes().get();
    final edges = await database.getAllEdges().get();

    for (final node in nodes) {
      final newNode = Node.Id(node.id);
      nodeMap[node.id] = newNode;
      this.nodes[node.id] = node;
      graph.addNode(newNode);
    }
    for (final edge in edges) {
      final source = nodeMap[edge.source];
      final target = nodeMap[edge.target];
      if (source != null && target != null) {
        graph.addEdge(source, target);
      }
    }

    setLoadedState(true);
  }

  Widget buildNode(Node node) {
    final dbNode = nodes[node.key!.value];
    final data = jsonDecode(dbNode?.body ?? '{}') as Map<String, dynamic>;
    final label = data['label'] ?? '';
    return SizedBox(
      width: 80,
      height: 80,
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Graph Database'),
        actions: [
          IconButton(
            icon: const Icon(Icons.restore),
            onPressed: addDummyData,
          ),
        ],
      ),
      body: !loaded
          ? const Center(child: CircularProgressIndicator())
          : nodes.isEmpty
              ? const Center(child: Text('No Data Loaded'))
              : LayoutBuilder(builder: (context, dimens) {
                  return SizedBox.expand(
                    child: InteractiveViewer(
                      constrained: false,
                      boundaryMargin: EdgeInsets.symmetric(
                        horizontal: dimens.maxWidth * 0.75,
                        vertical: dimens.maxHeight * 0.75,
                      ),
                      minScale: 0.01,
                      maxScale: 5.6,
                      child: GraphView(
                        key: UniqueKey(),
                        graph: graph,
                        algorithm: builder,
                        paint: Paint()
                          ..color = Colors.green
                          ..strokeWidth = 1
                          ..style = PaintingStyle.stroke,
                        builder: buildNode,
                      ),
                    ),
                  );
                }),
    );
  }
}
