import 'package:apuestas_app/design/icons.dart';
import 'package:apuestas_app/design/styles.dart';
import 'package:flutter/material.dart';

class FooterLayout extends StatefulWidget {
  @override
  _FooterLayoutState createState() => _FooterLayoutState();
}

class _FooterLayoutState extends State<FooterLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 14,
          child: Container(
            color: Theme.of(context).splashColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: textStyle('NOMBRE', Colors.white, 18.0),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: IconButton(
                              icon: Icon(
                                LocalIcons.twitter,
                                color: Colors.white,
                                size: 40,
                              ),
                              onPressed: () {}),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Icon(
                            LocalIcons.facebook_f,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Icon(
                            LocalIcons.instagram_1,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Icon(
                            LocalIcons.whatsapp,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 0.5),
                      ),
                    ),
                    child: Center(
                      child: textStyle('NOMBRE', Colors.white, 18.0),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Icon(
                            LocalIcons.cc_visa,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Icon(
                            LocalIcons.cc_mastercard,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Icon(
                            LocalIcons.cc_paypal,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Icon(
                            LocalIcons.credit_card2,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Icon(
                            LocalIcons.dollar_sign,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 150),
            color: Theme.of(context).accentColor,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: textStyle('Deportes', Colors.white, 16.0),
                      onTap: () {},
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: textStyle('Apuestas en vivo', Colors.white, 16.0),
                      onTap: () {},
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: textStyle('Promociones', Colors.white, 16.0),
                      onTap: () {},
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child:
                          textStyle('Deportes Virtuales', Colors.white, 16.0),
                      onTap: () {},
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: textStyle('Blog', Colors.white, 16.0),
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Theme.of(context).splashColor,
            padding: EdgeInsets.symmetric(horizontal: 100),
            alignment: Alignment.centerRight,
            child: textStyle('© NOMBRE_DE_LA_PAGINA 2021', Colors.white, 14.0),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 100),
            color: Theme.of(context).splashColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 12,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: textStyle('Por favor, juega con responsabilidad.',
                        Colors.white, 16.0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      LocalIcons.futbol,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
