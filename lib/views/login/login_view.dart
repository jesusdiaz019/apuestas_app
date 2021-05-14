import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var media;
  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/hlogin.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 500,
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: media.width * 0.05),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.disabled,
                        autocorrect: false,
                        enableSuggestions: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Usuario',
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        style: TextStyle(fontSize: 20.0),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo es obligatorio';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
