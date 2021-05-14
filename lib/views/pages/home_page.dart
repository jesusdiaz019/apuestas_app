import 'package:apuestas_app/design/icons.dart';
import 'package:apuestas_app/views/layouts/footer.dart';
import 'package:apuestas_app/views/layouts/header.dart';
import 'package:apuestas_app/views/layouts/home/left_layout.dart';
import 'package:apuestas_app/views/pages/deportes_page.dart';
import 'package:apuestas_app/widgets/slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:apuestas_app/views/menu/menu_view_drawer.dart';
import 'package:flutter/scheduler.dart';

import 'home_bloc.dart';

class HomePageStl extends StatelessWidget {
  static final homePageKey = new GlobalKey<_HomePageState>();

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
        home: HomePage(
          key: HomePageStl.homePageKey,
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final bloc = HomeBloc();
  TabController tabController;
  ScrollController _scrollController;
  ScrollController _scrollControllerLeft;
  ScrollController _scrollControllerRight;
  bool _showInfobar = true;
  bool _showAppbar = true;
  bool isScrollingDown = false;
  bool isSwitched = false;
  bool isBarShow = true;
  bool _isRightShow = false;
  bool _isLeftShow = false;
  int sizeScreen = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: bloc.tabs.length);

    _scrollController = new ScrollController();
    _scrollControllerLeft = new ScrollController();
    _scrollControllerRight = new ScrollController();
    bloc.scrollViewController = new ScrollController();
    bloc.scrollViewController.addListener(() {
      if (bloc.scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          sizeScreen = 0;
          _showInfobar = false;
          setState(() {});
        }
      }

      if (bloc.scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
      if (bloc.scrollViewController.position.pixels == 0) {
        _showInfobar = true;
        sizeScreen = 35;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    bloc.scrollViewController.dispose();
    bloc.scrollViewController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: bloc.tabs.length,
      child: Scaffold(
        endDrawer: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 250),
          child: MenuViewDrawer(),
        ),
        body: Container(
          color: Colors.white,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderLayout(
                    _showAppbar, _showInfobar, bloc.tabs, tabController),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: bodyDuration()),
                        height: bodyHeight(),
                        child: TabBarView(controller: tabController, children: [
                          Scrollbar(
                            controller: bloc.scrollViewController,
                            isAlwaysShown: true,
                            showTrackOnHover: true,
                            child: ListView(
                              controller: bloc.scrollViewController,
                              children: [
                                Container(
                                  height: 550,
                                  child: SliderWidget(),
                                ),
                                Container(
                                  height: 500,
                                  child: Text('1'),
                                ),
                                Container(
                                  height: 400,
                                  child: FooterLayout(),
                                ),
                              ],
                            ),
                          ),
                          ListView(children: [
                            Container(
                              height: 600,
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 50,
                                    ),
                                    child: Row(
                                      children: [
                                        _isLeftShow
                                            ? Expanded(
                                                flex: 1,
                                                child: Scrollbar(
                                                  controller:
                                                      _scrollControllerLeft,
                                                  isAlwaysShown: true,
                                                  showTrackOnHover: true,
                                                  child: SingleChildScrollView(
                                                    controller:
                                                        _scrollControllerLeft,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          color: Colors.blue,
                                                          height: 600,
                                                          child: LeftLayout(),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        Expanded(
                                          flex: 3,
                                          child: Scrollbar(
                                              controller: _scrollController,
                                              isAlwaysShown: true,
                                              showTrackOnHover: true,
                                              child: SingleChildScrollView(
                                                controller: _scrollController,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 600,
                                                      color: Colors.blue,
                                                    ),
                                                    Container(
                                                      height: 600,
                                                      color: Colors.red,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                        _isRightShow
                                            ? Expanded(
                                                flex: 1,
                                                child: Scrollbar(
                                                  controller:
                                                      _scrollControllerRight,
                                                  isAlwaysShown: true,
                                                  showTrackOnHover: true,
                                                  child: SingleChildScrollView(
                                                    controller:
                                                        _scrollControllerRight,
                                                    child: Container(
                                                      color: Colors.blue,
                                                      height: 600,
                                                      child: LeftLayout(),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (_isLeftShow) {
                                              _isLeftShow = false;
                                            } else {
                                              _isLeftShow = true;
                                            }
                                          });
                                        },
                                        child: Icon(
                                          LocalIcons.less_than,
                                          size: 15,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(color: Colors.black),
                                          right:
                                              BorderSide(color: Colors.black),
                                          bottom:
                                              BorderSide(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (_isRightShow) {
                                              _isRightShow = false;
                                            } else {
                                              _isRightShow = true;
                                            }
                                          });
                                        },
                                        child: Icon(
                                          LocalIcons.greater_than,
                                          size: 15,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(color: Colors.black),
                                          left: BorderSide(color: Colors.black),
                                          bottom:
                                              BorderSide(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 400,
                              child: FooterLayout(),
                            ),
                          ]),
                          Text('2'),
                          Text('3'),
                          Text('4'),
                          Text('5'),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double bodyHeight() {
    double screenSize = MediaQuery.of(context).size.height;
    if (_showAppbar && _showInfobar) {
      return screenSize - 115.0;
    } else if (_showAppbar && !_showInfobar) {
      return screenSize - 80.0;
    } else if (!_showAppbar && !_showInfobar) {
      return screenSize - 40.0;
    } else {
      return screenSize - 115.0;
    }
  }

  int bodyDuration() {
    if (_showAppbar && _showInfobar) {
      return 100;
    } else {
      return 200;
    }
  }
}
