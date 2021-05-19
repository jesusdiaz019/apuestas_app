import 'package:apuestas_app/views/menu/menu_view.dart';
import 'package:flutter/material.dart';
import 'package:apuestas_app/views/login/login_view.dart';
import 'package:apuestas_app/views/example.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [
        const Locale('en'),
        const Locale('fr'),
        const Locale('es'),
      ],
      home: MenuView(),
    );
  }
}
