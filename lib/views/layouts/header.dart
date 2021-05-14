import 'package:apuestas_app/design/responsive_layout.dart';
import 'package:apuestas_app/design/styles.dart';
import 'package:apuestas_app/views/layouts/login.dart';
import 'package:apuestas_app/views/layouts/login_bloc.dart';
import 'package:apuestas_app/views/layouts/registro.dart';
import 'package:apuestas_app/views/login/login_view.dart';
import 'package:apuestas_app/views/pages/home_bloc.dart';
import 'package:apuestas_app/widgets/slider.dart';
import 'package:apuestas_app/widgets/switch.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatefulWidget {
  final bool _showInfobar;
  final bool _showAppbar;
  final List<Tab> _tabs;
  final TabController _tabController;
  HeaderLayout(
      this._showAppbar, this._showInfobar, this._tabs, this._tabController);
  @override
  _HeaderLayoutState createState() => _HeaderLayoutState();
}

class _HeaderLayoutState extends State<HeaderLayout> {
  final bloc = HomeBloc();
  final login = LoginBloc();
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
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: AnimatedContainer(
              color: Theme.of(context).splashColor,
              duration: Duration(milliseconds: 400),
              height: widget._showInfobar ? 35.0 : 0.0,
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      '24 horas',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: widget._showAppbar ? 80.0 : 40.0,
              decoration: new BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Center(
                      child: InkWell(
                        child: Text('AVANTAGE'),
                        onTap: () {
                          setState(() {});
                        },
                      ),
                    ),
                    flex: 1,
                  ),
                  if (!ResponsiveLayout.isIphone(context) &&
                      !ResponsiveLayout.isIpad(context))
                    Expanded(
                      child: TabBar(
                        controller: widget._tabController,
                        labelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        indicatorColor: Theme.of(context).primaryColor,
                        tabs: widget._tabs,
                      ),
                      flex: 3,
                    ),
                  Expanded(
                    child: Row(
                      children: [
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
                                        return !login.isClosed
                                            ? dialog
                                            : Container();
                                      });
                                }),
                          ),
                        ),
                        if (ResponsiveLayout.isIphone(context) ||
                            ResponsiveLayout.isIpad(context))
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    ]);
  }
}
