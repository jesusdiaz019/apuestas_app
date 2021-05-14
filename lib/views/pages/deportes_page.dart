import 'package:apuestas_app/views/layouts/footer.dart';
import 'package:apuestas_app/views/layouts/header.dart';
import 'package:apuestas_app/views/layouts/home/left_layout.dart';
import 'package:apuestas_app/views/menu/menu_view_drawer.dart';
import 'package:apuestas_app/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DeportesPage extends StatefulWidget {
  const DeportesPage({
    Key key,
  }) : super(key: key);

  @override
  _DeportesPageState createState() => _DeportesPageState();
}

class _DeportesPageState extends State<DeportesPage>
    with TickerProviderStateMixin {
  ScrollController _scrollController;
  Key _scrollKey;
  bool _showInfobar = true;
  bool _showAppbar = true;
  bool isScrollingDown = false;
  bool isSwitched = false;
  bool _showSlider = true;
  bool isBarShow = true;
  int sizeScreen = 0;
  TabController _tabController;

  final List<Tab> _tabs = [
    Tab(
      icon: Icon(Icons.home_outlined),
    ),
    Tab(
      child: Text('Deportes'),
    ),
    Tab(
      child: Text('Apuestas en vivo'),
    ),
    Tab(
      child: Text('Promociones'),
    ),
    Tab(
      child: Text('Deportes Virtuales'),
    ),
    Tab(
      child: Text('Blog'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
    _tabController.index = 1;
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        setState(() {});
      } else {
        _showAppbar = true;
        _showInfobar = true;
        _showSlider = false;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
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
                HeaderLayout(_showAppbar, _showInfobar, _tabs, _tabController),
                Expanded(
                  flex: 3,
                  child: Scrollbar(
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height - 115,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: LeftLayout(),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: LeftLayout(),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: LeftLayout(),
                                ),
                              ],
                            ),
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
