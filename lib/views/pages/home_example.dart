import 'package:apuestas_app/views/menu/menu_view_drawer.dart';
import 'package:apuestas_app/views/pages/home_bloc.dart';
import 'package:flutter/material.dart';

class HomeExampleStl extends StatelessWidget {
  static final homeExampleKey = new GlobalKey<_HomeExampleState>();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFF00B5B8),
          accentColor: Color(0xFF38445A),
          splashColor: Color(0xFF071123),
          primarySwatch: MaterialColor(0xFF00B5B8, {
            50: Color.fromRGBO(0, 181, 184, .1),
            100: Color.fromRGBO(0, 181, 184, .2),
            200: Color.fromRGBO(0, 181, 184, .3),
            300: Color.fromRGBO(0, 181, 184, .4),
            400: Color.fromRGBO(0, 181, 184, .5),
            500: Color.fromRGBO(0, 181, 184, .6),
            600: Color.fromRGBO(0, 181, 184, .7),
            700: Color.fromRGBO(0, 181, 184, .8),
            800: Color.fromRGBO(0, 181, 184, .9),
            900: Color.fromRGBO(0, 181, 184, 1),
          }),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeExample(
          key: HomeExampleStl.homeExampleKey,
        ));
  }
}

class HomeExample extends StatefulWidget {
  const HomeExample({
    Key key,
  }) : super(key: key);
  @override
  _HomeExampleState createState() => _HomeExampleState();
}

class _HomeExampleState extends State<HomeExample> {
  final bloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: bloc.tabs.length,
        child: Scaffold(
          endDrawer: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250),
            child: MenuViewDrawer(),
          ),
          body: Stack(
            children: [
              Container(
                height: 1200,
                child: ListView(
                  children: [
                    Container(
                      height: 400,
                      color: Colors.blue,
                    ),
                    Container(
                      height: 400,
                      color: Colors.red,
                    ),
                    Container(
                      height: 400,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}
