import 'package:apuestas_app/models/entry.dart';
import 'package:apuestas_app/models/entrys.dart';
import 'package:flutter/material.dart';

class LeftLayout extends StatefulWidget {
  @override
  _LeftLayoutState createState() => _LeftLayoutState();
}

class _LeftLayoutState extends State<LeftLayout> {
  final entrys = Entry;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: data.map((entry) => EntryWidget(entry: entry)).toList(),
      ),
    );
  }
}

class EntryWidget extends StatelessWidget {
  final Entry entry;

  const EntryWidget({
    Key key,
    @required this.entry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = entry.title;
    final children = entry.children;
    return Theme(
      data: ThemeData(
        accentColor: Color(0xFF00B5B8),
      ),
      child: ExpansionTile(
        backgroundColor: Colors.white,
        title: Text(title),
        children: children.map((entry) => EntryWidget(entry: entry)).toList(),
      ),
    );
  }
}
