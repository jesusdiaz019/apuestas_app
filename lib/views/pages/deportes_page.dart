import 'package:apuestas_app/design/responsive_layout.dart';
import 'package:apuestas_app/widgets/slider.dart';
import 'package:flutter/material.dart';

class DeportesPage extends StatefulWidget {
  @override
  _DeportesPageState createState() => _DeportesPageState();
}

class _DeportesPageState extends State<DeportesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 75,
          ),
          SizedBox(
            height: 1200,
            child: Column(
              children: [
                Expanded(
                  flex: ResponsiveLayout.isIphone(context) ? 6 : 10,
                  child: SliderWidget(),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
