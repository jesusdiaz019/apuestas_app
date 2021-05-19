import 'package:apuestas_app/models/data_ligas.dart';
import 'package:apuestas_app/views/pages/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:expandable_group/expandable_group_widget.dart';

void main() {
  runApp(MyExample());
}

class MyExample extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expandable Group demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'Expandable Group demo',
        data: _generateData(),
      ),
    );
  }

  List<List<String>> _generateData() {
    int numberOfGroups = 5;
    List<List<String>> results = <List<String>>[];
    for (int i = 0; i < numberOfGroups; i++) {
      List<String> items = <String>[];
      for (int j = 0; j < numberOfGroups * 5 + i; j++) {
        items.add("Item $j in group $i");
      }
      results.add(items);
    }
    return results;
  }
}

class MyHomePage extends StatefulWidget {
  final List<List<String>> data;
  MyHomePage({Key key, this.title, this.data}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            child: Text(widget.title),
            onTap: () {
              bloc.requestSearch();
            }),
      ),
      body: ListView.builder(
          itemCount: bloc.ligas.length,
          itemBuilder: (context, index) {
            final morador = bloc.ligas[index];
            return ExpandableGroup(
              header: _header(" " + morador.pais),
              items: _buildItems(context, morador.ligas),
            );
          }),
    );
  }

  Widget _header(String name) => Text(name,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ));

  List<ListTile> _buildItems(BuildContext context, List<Ligas> items) => items
      .map((e) => ListTile(
            title: Text(e.liga),
          ))
      .toList();
}
