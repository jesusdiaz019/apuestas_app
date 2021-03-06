import 'package:apuestas_app/common/debouncer.dart';
import 'package:apuestas_app/design/icons.dart';
import 'package:apuestas_app/design/responsive_layout.dart';
import 'package:apuestas_app/models/data_ligas.dart';
import 'package:apuestas_app/views/layouts/login.dart';
import 'package:apuestas_app/views/layouts/login_bloc.dart';
import 'package:apuestas_app/views/menu/menu_view_drawer.dart';
import 'package:apuestas_app/views/pages/apuestas_page.dart';
import 'package:apuestas_app/views/pages/deportes_page.dart';
import 'package:apuestas_app/views/pages/home_bloc.dart';
import 'package:apuestas_app/widgets/slider.dart';
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
  GlobalKey<ApuestasPageState> _keyApuestas = GlobalKey();
  final _scrollbarLeft = ScrollController();
  final bloc = HomeBloc();
  final login = LoginBloc();
  final _pageController = PageController(initialPage: 0);
  bool _homeTab = true;
  bool _deportTab = false;
  bool _apuestaTab = false;
  bool _promTab = false;
  bool _deportvirTab = false;
  String _liga = "";
  String _pais = "";
  bool _showLigaBar = false;
  AlertDialog dialog = AlertDialog(
    scrollable: true,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    content: Builder(builder: (context) {
      return LoginLayout();
    }),
  );
  @override
  Widget build(BuildContext context) {
    bloc.onSearch();
    return SafeArea(
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        drawerScrimColor: Colors.transparent,
        drawer: Container(
          margin: EdgeInsets.only(top: 135),
          alignment: Alignment.bottomLeft,
          width: 200,
          child: Drawer(
            child: Scrollbar(
              controller: _scrollbarLeft,
              isAlwaysShown: true,
              showTrackOnHover: true,
              child: ListView.builder(
                controller: _scrollbarLeft,
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  final paisligas = bloc.ligas[index];
                  return ListTile(
                    title: _header(paisligas.pais),
                    subtitle: Column(
                      children: _buildItems(paisligas.ligas, paisligas.pais),
                    ),
                  );
                },
                itemCount: bloc.ligas.length,
              ),
            ),
          ),
        ),
        endDrawer: Container(
          color: Colors.white,
          width: 180,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: ListTile(
                    title: Text("Home"),
                    leading: Icon(
                      Icons.home_outlined,
                    ),
                    onTap: () {
                      _pageController.animateToPage(0,
                          duration: Duration(seconds: 1),
                          curve: Curves.easeOutSine);
                      setState(() {
                        _showLigaBar = false;
                        Navigator.pop(context);
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: ListTile(
                    title: Text("Deportes"),
                    leading: Icon(
                      Icons.sports_soccer_outlined,
                    ),
                    onTap: () {
                      _pageController.animateToPage(1,
                          duration: Duration(seconds: 1),
                          curve: Curves.easeOutSine);
                      setState(() {
                        _showLigaBar = true;
                        Navigator.pop(context);
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: ListTile(
                    title: Text("Apuestas en vivo"),
                    leading: Icon(
                      Icons.attach_money_outlined,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: ListTile(
                    title: Text("Promociones"),
                    leading: Icon(
                      LocalIcons.gift,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: ListTile(
                    title: Text("Deportes Virtuales"),
                    leading: Icon(
                      Icons.sports_esports_outlined,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            PageView.builder(
              itemBuilder: (context, index) {
                return _buildPage(index);
              },
              itemCount: 2,
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
            ),
            Container(
              height: 75,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: InkWell(
                        child: Text("ADVANTAGE"),
                      ),
                    ),
                    flex: 5,
                  ),
                  Visibility(
                    visible: ResponsiveLayout.isIphone(context) ? false : true,
                    child: Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              child: Container(
                                decoration: _homeTab
                                    ? BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 3,
                                          ),
                                        ),
                                      )
                                    : BoxDecoration(),
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 12.0,
                                  ),
                                  child: Icon(
                                    Icons.home_outlined,
                                  ),
                                ),
                              ),
                              onTap: () {
                                _pageController.animateToPage(0,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.easeOutSine);
                                setState(() {
                                  _showLigaBar = false;
                                  _homeTab = true;
                                  _deportTab = false;
                                  _apuestaTab = false;
                                  _promTab = false;
                                  _deportvirTab = false;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              child: Container(
                                decoration: _deportTab
                                    ? BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 3,
                                          ),
                                        ),
                                      )
                                    : BoxDecoration(),
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 12.0,
                                  ),
                                  child: Text(
                                    "Deportes",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                _pageController.animateToPage(1,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.easeOutSine);
                                setState(() {
                                  _showLigaBar = true;
                                  _deportTab = true;
                                  _homeTab = false;
                                  _apuestaTab = false;
                                  _promTab = false;
                                  _deportvirTab = false;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: _apuestaTab
                                  ? BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 3,
                                        ),
                                      ),
                                    )
                                  : BoxDecoration(),
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 12.0,
                                ),
                                child: Text(
                                  "Apuestas en vivo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: _promTab
                                  ? BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 3,
                                        ),
                                      ),
                                    )
                                  : BoxDecoration(),
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 12.0,
                                ),
                                child: Text(
                                  "Promociones",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: _deportvirTab
                                  ? BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 3,
                                        ),
                                      ),
                                    )
                                  : BoxDecoration(),
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 12.0,
                                ),
                                child: Text(
                                  "Deportes Virtuales",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Icon(
                        Icons.wallet_giftcard_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: IconButton(
                          icon: Icon(Icons.account_circle_outlined),
                          color: Colors.green,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return !login.isClosed ? dialog : Container();
                                });
                          }),
                    ),
                  ),
                  if (ResponsiveLayout.isIphone(context) ||
                      ResponsiveLayout.isIpad(context))
                    Expanded(
                      flex: 1,
                      child: Builder(
                        builder: (context) => IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
            _showLigaBar
                ? Container(
                    color: Color(0xFFFBFBFB),
                    margin: EdgeInsets.only(top: 75),
                    height: 60,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                color: Theme.of(context).splashColor,
                                child: Builder(
                                  builder: (context) => IconButton(
                                    icon: Icon(
                                      LocalIcons.less_than,
                                      size: 25,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    onPressed: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                  ),
                                ),
                              ),
                              onTap: () {}),
                        ),
                        Expanded(
                          flex: ResponsiveLayout.isIphone(context) ? 4 : 16,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: _routesView(),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            color: Theme.of(context).splashColor,
                            child: Icon(
                              LocalIcons.greater_than,
                              size: 25,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _routesView() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Text(
              _pais,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              " / ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _liga,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
      );

  Widget _buildPage(index) {
    Widget send;
    if (index == 0) {
      send = DeportesPage();
    } else if (index == 1) {
      send = ApuestasPage(key: _keyApuestas);
    }
    return send;
  }

  Widget _header(String name) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      );

  List<GestureDetector> _buildItems(List<Ligas> items, String pais) => items
      .map(
        (e) => GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                e.liga,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          onTap: () {
            setState(() {
              _keyApuestas.currentState.updateList(e.id);
              _liga = e.liga;
              _pais = pais;
              Navigator.pop(context);
            });
          },
        ),
      )
      .toList();
}
