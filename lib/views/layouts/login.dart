import 'package:apuestas_app/design/responsive_layout.dart';
import 'package:apuestas_app/design/styles.dart';
import 'package:apuestas_app/views/layouts/login_bloc.dart';
import 'package:apuestas_app/views/layouts/registro.dart';
import 'package:apuestas_app/views/pages/home_bloc.dart';
import 'package:apuestas_app/widgets/switch.dart';
import 'package:flutter/material.dart';

class LoginLayout extends StatefulWidget {
  @override
  _LoginLayoutState createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  bool _passwordVisible = false;
  var _lcontrollerUser = TextEditingController();
  var _lcontrollerPass = TextEditingController();
  FocusNode _focusLogin;
  final bloc = LoginBloc();
  final bloc2 = HomeBloc();
  var isClosed = false;

  AlertDialog dialog = AlertDialog(
    scrollable: true,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    content: Builder(builder: (context) {
      return RegistroLayout();
    }),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.isIphone(context) ? 0 : 30,
        vertical: 15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              'INICIAR SESIÓN',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextFormField(
            focusNode: _focusLogin,
            controller: _lcontrollerUser,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: 5,
              ),
              labelStyle: TextStyle(
                fontSize: 18.0,
              ),
              labelText: 'Usuario',
              filled: true,
              hintText: 'Ingresa tu usuario',
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: _lcontrollerPass,
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: 5,
              ),
              labelStyle: TextStyle(
                fontSize: 18.0,
              ),
              labelText: 'Contraseña',
              filled: true,
              hintText: 'Ingresa tu contraseña',
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.vpn_key_outlined,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                hoverColor: Colors.white,
                splashColor: Colors.white,
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: SwitchScreen(),
                      ),
                      Expanded(
                        flex: 2,
                        child: textStyle(
                          'Recordar',
                          Colors.black,
                          15.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: InkWell(
                              hoverColor: Colors.white,
                              child: Text(
                                '¿Olvidaste tu contraseña?',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15.0),
                                textAlign: TextAlign.right,
                              ),
                              onTap: () => bloc2.onChangedText()),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            child: Center(
              child: textStyle('INGRESAR', Colors.white, 16.0),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).splashColor,
              padding: const EdgeInsets.symmetric(vertical: 20),
              side: BorderSide(width: 1.0, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: textStyle(
                  'Aún no tienes una cuenta?',
                  Colors.black,
                  15.0,
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  splashColor: Colors.white,
                  hoverColor: Colors.white,
                  child: Text(
                    'Regístrate aquí',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 15.0),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    setState(() {
                      _lcontrollerUser.clear();
                      _lcontrollerPass.clear();
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return dialog;
                          });
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
