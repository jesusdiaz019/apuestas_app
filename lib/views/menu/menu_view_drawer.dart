import 'package:apuestas_app/design/icons.dart';
import 'package:apuestas_app/views/menu/menu_view.dart';
import 'package:apuestas_app/views/pages/home_bloc.dart';
import 'package:apuestas_app/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:apuestas_app/drawer/drawer_items.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MenuViewDrawer extends StatefulWidget {
  @override
  _MenuViewDrawerState createState() => _MenuViewDrawerState();
}

class _MenuViewDrawerState extends State<MenuViewDrawer> {
  final bloc = HomeBloc();
  final homepage = HomePage();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? 10 : 0),
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              InkWell(
                child: DrawerItems(
                  onPressed: () {
                    HomePageStl.homePageKey.currentState.tabController
                        .animateTo(0);

                    Navigator.of(context).pop();
                  },
                  title: "Home",
                  icon: Icons.home_outlined,
                ),
                onTap: () {
                  HomePageStl.homePageKey.currentState.tabController
                      .animateTo(0);

                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 10),
              InkWell(
                child: DrawerItems(
                  onPressed: () {
                    HomePageStl.homePageKey.currentState.tabController
                        .animateTo(1);

                    Navigator.of(context).pop();
                  },
                  title: "Deportes",
                  icon: Icons.sports_soccer_outlined,
                ),
                onTap: () {
                  HomePageStl.homePageKey.currentState.tabController
                      .animateTo(1);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 10),
              InkWell(
                child: DrawerItems(
                  onPressed: () {
                    HomePageStl.homePageKey.currentState.tabController
                        .animateTo(2);
                    Navigator.of(context).pop();
                  },
                  title: "Apuestas en vivo",
                  icon: Icons.attach_money_outlined,
                ),
                onTap: () {
                  HomePageStl.homePageKey.currentState.tabController
                      .animateTo(2);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 10),
              InkWell(
                child: DrawerItems(
                  onPressed: () {
                    HomePageStl.homePageKey.currentState.tabController
                        .animateTo(3);
                    Navigator.of(context).pop();
                  },
                  title: "Promociones",
                  icon: LocalIcons.gift,
                ),
                onTap: () {
                  HomePageStl.homePageKey.currentState.tabController
                      .animateTo(3);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 10),
              InkWell(
                child: DrawerItems(
                  onPressed: () {
                    HomePageStl.homePageKey.currentState.tabController
                        .animateTo(4);
                    Navigator.of(context).pop();
                  },
                  title: "Deportes Virtuales",
                  icon: Icons.sports_esports_outlined,
                ),
                onTap: () {
                  HomePageStl.homePageKey.currentState.tabController
                      .animateTo(4);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 10),
              InkWell(
                child: DrawerItems(
                  onPressed: () {
                    HomePageStl.homePageKey.currentState.tabController
                        .animateTo(5);
                    Navigator.of(context).pop();
                  },
                  title: "Blog",
                  icon: Icons.find_in_page_outlined,
                ),
                onTap: () {
                  HomePageStl.homePageKey.currentState.tabController
                      .animateTo(5);
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
