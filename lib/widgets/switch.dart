import 'package:flutter/material.dart';

class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1,
      child: Switch(
        onChanged: toggleSwitch,
        value: isSwitched,
        activeColor: Colors.blue,
        activeTrackColor: Colors.yellow,
        inactiveThumbColor: Colors.redAccent,
        inactiveTrackColor: Colors.orange,
      ),
    );
  }
}
