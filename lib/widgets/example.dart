import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class BounceScrollBehavior extends ScrollBehavior {
  @override
  getScrollPhysics(_) => const BouncingScrollPhysics();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollConfiguration(
        behavior: BounceScrollBehavior(),
        child: MainScreen(),
      ),
    );
  }
}

class HomeExploreScreen extends StatefulWidget {
  final AnimationController animationController;

  const HomeExploreScreen({Key key, this.animationController})
      : super(key: key);

  @override
  _HomeExploreScreenState createState() => _HomeExploreScreenState();
}

class _HomeExploreScreenState extends State<HomeExploreScreen> {
  @override
  void initState() {
    widget.animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.animationController,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 40 * (1.0 - widget.animationController.value), 0.0),
            child: Container(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Stack(
                  children: <Widget>[
                    NestedScrollView(
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverPersistentHeader(
                            pinned: true,
                            delegate: ContestTabHeader(
                                (MediaQuery.of(context).size.width)),
                          ),
                        ];
                      },
                      body: Container(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                height: 800,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        color: Colors.orange,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100),
                                    Container(
                                        color: Colors.blue,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100),
                                    Container(
                                        color: Colors.red,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100),
                                    Container(
                                        color: Colors.green,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100),
                                    Container(
                                        color: Colors.orange,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100),
                                    Container(
                                        color: Colors.blue,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100),
                                    Container(
                                        color: Colors.red,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100),
                                    Container(
                                        color: Colors.green,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100),
                                  ],
                                ));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  final double heightValue;

  ContestTabHeader(
    this.heightValue,
  );

  @override
  double get maxExtent => heightValue;

  @override
  double get minExtent => heightValue / 3;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var minValue = (shrinkOffset < heightValue - heightValue / 3
        ? shrinkOffset
        : heightValue / 3);
    return SizedBox(
        height: heightValue - minValue,
        child: Container(
          color: Colors.red,
          child: Center(
            child: Text('Test Sliver\nTest Sliver\nTest Sliver',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
          ),
        ));
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  Widget indexView = HomeExploreScreen();

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    indexView = HomeExploreScreen(
      animationController: animationController,
    );
    animationController..forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: indexView,
      ),
    );
  }
}
