import 'package:apuestas_app/design/icons.dart';
import 'package:apuestas_app/design/responsive_layout.dart';
import 'package:apuestas_app/views/pages/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          child: Column(
            children: [
              Visibility(
                visible: bloc.loading,
                child: Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    alignment: Alignment.topCenter,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Visibility(
                visible: !bloc.loading,
                child: Expanded(
                  flex: 1,
                  child: GridView.builder(
                    itemCount: bloc.fixtures.length,
                    itemBuilder: (context, index) {
                      final fixture = bloc.fixtures[index];
                      print(fixture.ligaId);
                      return _buildFixtures(fixture);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                      mainAxisExtent: 110,
                      crossAxisCount:
                          !ResponsiveLayout.isIphone(context) ? 4 : 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFixtures(fixture) {
    String fecha = DateFormat("yyyy-MM-dd  KK:mm a").format(fixture.fecha);
    return Container(
      color: Theme.of(context).accentColor,
      child: Card(
          margin: EdgeInsets.all(1),
          child: ListTile(
            leading: Image(
              image: NetworkImage(fixture.equipos.local[0].logo),
            ),
            trailing: Image(
              image: NetworkImage(fixture.equipos.visitante[0].logo),
            ),
            title: Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      fecha,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      fixture.equipos.local[0].name +
                          " vs " +
                          fixture.equipos.visitante[0].name,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      fixture.estadio,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Lugar: " + fixture.lugar,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void updateList(String id) {
    setState(() {
      bloc.onTapLiga(id);
    });
  }
}
