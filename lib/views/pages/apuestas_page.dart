import 'package:apuestas_app/design/icons.dart';
import 'package:apuestas_app/views/pages/home_bloc.dart';
import 'package:flutter/material.dart';

class ApuestasPage extends StatefulWidget {
  const ApuestasPage({
    Key key,
  }) : super(key: key);
  @override
  ApuestasPageState createState() => ApuestasPageState();
}

class ApuestasPageState extends State<ApuestasPage> {
  final bloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: bloc,
        builder: (context, child) {
          return Container(
            margin: EdgeInsets.only(top: 135),
            color: Theme.of(context).accentColor,
            child: ListView.builder(
              itemCount: bloc.fixtures.length,
              itemBuilder: (context, index) {
                final fixture = bloc.fixtures[index];
                print(fixture.liga);
                return _buildFixtures(fixture);
              },
            ),
          );
        });
  }

  Widget _buildFixtures(fixture) {
    return Container(
      color: Theme.of(context).accentColor,
      child: Card(
          child: ListTile(
        subtitle: Text(fixture.fecha.toString()),
      )),
    );
  }

  void updateList(String id) {
    setState(() {
      bloc.onTapLiga(id);
    });
  }
}
