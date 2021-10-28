// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_final_fields, use_key_in_widget_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, unused_import, avoid_web_libraries_in_flutter, camel_case_types, unused_element, prefer_const_declarations, unused_field, curly_braces_in_flow_control_structures, unused_local_variable

import 'dart:developer';

import 'package:fashapp/pages/home.dart';
import 'package:fashapp/provider/product.dart';

import '../models/authentication.dart';

import 'login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';

class RIKeys {
  static final riKey1 = const Key('__RIKEY1__');
  static final riKey2 = const Key('__RIKEY2__');
  static final riKey3 = const Key('__RIKEY3__');
}

class Singup_Screen extends StatefulWidget {
  static const routeName = '/signup';
  @override
  _SingupState createState() => _SingupState();
}

class _SingupState extends State<Singup_Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = TextEditingController();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  bool hidePass = true;
  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('An Error Occured'),
              content: Text(msg),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    await Provider.of<Authentication>(context, listen: false)
        .Singup_Screen('email', 'password');
    Navigator.of(context).pushReplacementNamed(HomePage_Screen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: new Text(
          "SignUp",
          style: TextStyle(color: Colors.red.shade900),
        ),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Login.routeName);
            },
            child: Row(
              children: [
                Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(Icons.person)
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20.0, // has the effect of softening the shadow
                  )
                ],
              ),
              child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(16.0),
                      //   child: Container(
                      //       alignment: Alignment.topCenter,
                      //       child: Image.asset(
                      //         'images/logo.png',
                      //         width: 260.0,
                      //       )),
                      // ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.3),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _name,
                                decoration: InputDecoration(
                                    hintText: "Full name",
                                    icon: Icon(Icons.person_outline),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _email,
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    icon: Icon(Icons.alternate_email),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex =
                                        new RegExp(pattern.toString());
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email address is valid';
                                    else
                                      return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.3),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _password,
                                obscureText: hidePass,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "The password field cannot be empty";
                                  } else if (value.length < 6) {
                                    return "the password has to be at least 6 characters long";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    setState(() {
                                      hidePass = !hidePass;
                                    });
                                  }),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black,
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('signup faild'),
                                  ));
                                  return;
                                }
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "Sign up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "I already have an account",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ))),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
