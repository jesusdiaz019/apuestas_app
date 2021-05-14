import 'package:apuestas_app/design/responsive_layout.dart';
import 'package:apuestas_app/design/styles.dart';
import 'package:apuestas_app/views/layouts/login.dart';
import 'package:apuestas_app/widgets/switch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class RegistroLayout extends StatefulWidget {
  @override
  _RegistroLayoutState createState() => _RegistroLayoutState();
}

class _RegistroLayoutState extends State<RegistroLayout> {
  var _lcontrollerUser = TextEditingController();
  var _lcontrollerPass = TextEditingController();
  FocusNode _focusRegistro;
  bool _passwordVisible = false;
  bool _reppasswordVisible = false;
  DateTime fechanacimiento = DateTime(2010, 12, 31);
  String sexoValue = '< Seleccione >';
  String paisValue = '< Seleccione >';

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
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      margin: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.isIphone(context) ? 0 : 65,
        vertical: 5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              'REGISTRAR USUARIO',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            focusNode: _focusRegistro,
            controller: _lcontrollerUser,
            decoration: InputDecoration(
              contentPadding: new EdgeInsets.only(
                top: 5,
              ),
              labelStyle: TextStyle(
                fontSize: 18.0,
              ),
              labelText: 'Nombre de usuario *',
              filled: true,
              hintText: 'Ingresa tu nombre de usuario',
              fillColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 8,
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
              labelText: 'Contraseña *',
              filled: true,
              hintText: 'Ingresa tu contraseña',
              fillColor: Colors.white,
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
            height: 8,
          ),
          TextFormField(
            controller: _lcontrollerPass,
            obscureText: !_reppasswordVisible,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: 5,
              ),
              labelStyle: TextStyle(
                fontSize: 18.0,
              ),
              labelText: 'Verificar contraseña *',
              filled: true,
              hintText: 'Vuelve a ingresar tu contraseña',
              fillColor: Colors.white,
              suffixIcon: IconButton(
                hoverColor: Colors.white,
                splashColor: Colors.white,
                icon: Icon(
                  _reppasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    _reppasswordVisible = !_reppasswordVisible;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  focusNode: _focusRegistro,
                  controller: _lcontrollerUser,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.only(
                      top: 5,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                    ),
                    labelText: 'Nombres *',
                    filled: true,
                    hintText: 'Ingresa tus nombres',
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 25.0,
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  focusNode: _focusRegistro,
                  controller: _lcontrollerUser,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.only(
                      top: 5,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                    ),
                    labelText: 'Apellidos *',
                    filled: true,
                    hintText: 'Ingresa tus apellidos',
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            focusNode: _focusRegistro,
            controller: _lcontrollerUser,
            decoration: InputDecoration(
              contentPadding: new EdgeInsets.only(
                top: 5,
              ),
              labelStyle: TextStyle(
                fontSize: 18.0,
              ),
              labelText: 'Correo electrónico *',
              filled: true,
              hintText: 'Ingresa tu correo electrónico',
              fillColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InputDecorator(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                      fontSize: 22.0,
                    ),
                    fillColor: Colors.white,
                    labelText: 'País *',
                    filled: true,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          DropdownButton(
                            value: paisValue,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            underline: Container(
                              height: 1,
                              color: Colors.white,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                paisValue = newValue;
                              });
                            },
                            items: <String>[
                              '< Seleccione >',
                              'Argentina',
                              'Bolivia',
                              'Brasil',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 25.0,
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  focusNode: _focusRegistro,
                  controller: _lcontrollerUser,
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.only(
                      top: 5,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                    ),
                    labelText: 'Teléfono Movil *',
                    filled: true,
                    hintText: 'Ingresa tu número',
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            focusNode: _focusRegistro,
            controller: _lcontrollerUser,
            decoration: InputDecoration(
              contentPadding: new EdgeInsets.only(
                top: 5,
              ),
              labelStyle: TextStyle(
                fontSize: 18.0,
              ),
              labelText: 'Dirección *',
              filled: true,
              hintText: 'Ingresa tu dirección',
              fillColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _getDatePickerEnabled(),
              ),
              SizedBox(
                width: 25.0,
              ),
              Expanded(
                flex: 1,
                child: InputDecorator(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                      fontSize: 22.0,
                    ),
                    fillColor: Colors.white,
                    labelText: 'Sexo *',
                    filled: true,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          DropdownButton(
                            value: sexoValue,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                            ),
                            underline: Container(
                              height: 1,
                              color: Colors.white,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                sexoValue = newValue;
                              });
                            },
                            items: <String>['< Seleccione >', 'Hombre', 'Mujer']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          new TextFormField(),
          SizedBox(
            height: 8,
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
                        child: textStyle('Recordar', Colors.black, 15.0),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    splashColor: Colors.white,
                    hoverColor: Colors.white,
                    child: Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15.0),
                      textAlign: TextAlign.right,
                    ),
                    onTap: () {
                      setState(() {});
                    },
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
              child: textStyle('REGISTRAR USUARIO', Colors.white, 16.0),
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
                child: textStyle('Ya tienes una cuenta?', Colors.black, 15.0),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  splashColor: Colors.white,
                  hoverColor: Colors.white,
                  child: Center(
                    child: Text(
                      'Inicia sesión aquí',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15.0),
                      textAlign: TextAlign.center,
                    ),
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

  Widget _getDatePickerEnabled() {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding: new EdgeInsets.only(
            top: 4,
          ),
          labelStyle: TextStyle(
            fontSize: 22.0,
          ),
          filled: true,
          fillColor: Colors.white,
          labelText: 'Ingresa tu fecha de nacimiento *',
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              DateFormat("d MMMM y", 'es-ES').format(fechanacimiento),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: fechanacimiento,
      firstDate: new DateTime(1900),
      lastDate: new DateTime(2021),
      locale: const Locale("es", "ES"),
    );
    if (picked != null) {
      setState(() {
        fechanacimiento = picked;
      });
    }
  }
}
