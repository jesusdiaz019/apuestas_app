import 'package:apuestas_app/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:apuestas_app/design/responsive_layout.dart';
import 'package:apuestas_app/views/menu/menu_view_drawer.dart';

class MenuView extends StatefulWidget {
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        body: ResponsiveLayout(
      iphone: HomePageStl(),
      ipad: Row(
        children: [
          Expanded(
            flex: _size.width < 800 ? 6 : 7,
            child: HomePageStl(),
          ),
        ],
      ),
      ipadTurned: Row(
        children: [
          Expanded(
            flex: _size.width < 900 ? 5 : 4,
            child: HomePageStl(),
          ),
        ],
      ),
      macbook: Row(
        children: [
          Expanded(
            flex: _size.width > 1340 ? 3 : 6,
            child: HomePageStl(),
          ),
        ],
      ),
    ));
  }
}
