import 'package:apuestas_app/design/icons.dart';
import 'package:apuestas_app/views/layouts/footer.dart';
import 'package:apuestas_app/views/layouts/header.dart';
import 'package:apuestas_app/views/layouts/home/left_layout.dart';
import 'package:apuestas_app/views/pages/deportes_page.dart';
import 'package:apuestas_app/widgets/slider.dart';
import 'package:flutter/foundation.dart';
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
  bool _showInfobar = true;
  bool _showAppbar = true;
  bool isScrollingDown = false;
  bool isSwitched = false;
  bool _showSlider = true;
  bool isBarShow = true;
  bool _isRightShow = false;
  bool _isLeftShow = false;
  int sizeScreen = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: bloc.tabs.length);
    tabController.addListener(() {
      if (tabController.index == 0) {
        _showSlider = true;
        setState(() {});
      } else {
        _showAppbar = true;
        _showInfobar = true;
        _showSlider = false;
        setState(() {});
      }
    });
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
                  child: Scrollbar(
                    controller: bloc.scrollViewController,
                    isAlwaysShown: true,
                    showTrackOnHover: true,
                    child: SingleChildScrollView(
                      controller: bloc.scrollViewController,
                      child: Column(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 0),
                            height: _showSlider ? 550.0 : 0.0,
                            child: SliderWidget(),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height - 115,
                            child: TabBarView(
                                controller: tabController,
                                children: [
                                  Text('1'),
                                  Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 50),
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _isLeftShow
                                                ? Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      color: Colors.blue,
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      child: LeftLayout(),
                                                    ),
                                                  )
                                                : Container(),
                                            Expanded(
                                              flex: 3,
                                              child: LeftLayout(),
                                            ),
                                            _isRightShow
                                                ? Expanded(
                                                    flex: 1,
                                                    child: LeftLayout(),
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
                                              top: BorderSide(
                                                  color: Colors.black),
                                              right: BorderSide(
                                                  color: Colors.black),
                                              bottom: BorderSide(
                                                  color: Colors.black),
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
                                              top: BorderSide(
                                                  color: Colors.black),
                                              left: BorderSide(
                                                  color: Colors.black),
                                              bottom: BorderSide(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text('2'),
                                  Text('3'),
                                  Text('4'),
                                  Text('5'),
                                ]),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 0),
                            height: _showSlider ? 550.0 : 0.0,
                            child: FooterLayout(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
