// ignore_for_file: unused_import, use_key_in_widget_constructors, unused_local_variable, recursive_getters, annotate_overrides, prefer_is_empty, unnecessary_new, prefer_const_constructors, duplicate_ignore, deprecated_member_use, prefer_const_literals_to_create_immutables, await_only_futures, non_constant_identifier_names, unused_field, unused_element, prefer_final_fields, curly_braces_in_flow_control_structures, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fashapp/pages/signup.dart';
import 'home.dart';
import 'signup.dart';
import 'package:provider/provider.dart';
import '../models/authentication.dart';
import 'package:firebase_database/firebase_database.dart';

class Login extends StatefulWidget {
  static const routeName = '/Login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  // final Map<String, String> _authData = {
  //   'email': '',
  //   'password': '',
  // };
  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('An Error Occured'),
              content: Text(msg),
              actions: [
                FlatButton(
                  child: Text('okay'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  // final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    try {
      await Provider.of<Authentication>(context, listen: false)
          .Login('email', 'password');
      Navigator.of(context).pushReplacementNamed(HomePage_Screen.routeName);
    } catch (error) {
      var errorMessage = 'Authentication Failed try again later';
      _showErrorDialog(errorMessage);
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   isSingnedIn();
  // }

  // BuildContext get context => context;

  // Future<void> isSingnedIn() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   preferences = await SharedPreferences.getInstance();
  //   isLogedin = await googleSignIn.isSignedIn();

  //   if (isLogedin) {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => HomePage_Screen()));
  //   }

  //   setState(() {
  //     loading = false;
  //   });
  // }

  // Future<void> handleSignIn() async {
  //   preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     loading = true;
  //   });

  //   GoogleSignInAccount? googleUSer = await googleSignIn.signIn();
  //   GoogleSignInAuthentication? googleSignInAuthentication =
  //       await googleUSer?.authentication;

  //   AuthCredential Authtrade = GoogleAuthProvider.credential(
  //       idToken: googleSignInAuthentication?.idToken,
  //       accessToken: googleSignInAuthentication?.accessToken);

  //   UserCredential userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(Authtrade);

  //   final user = userCredential.user;

  //   if (user != null) {
  //     final QuerySnapshot result = await FirebaseFirestore.instance
  //         .collection("users")
  //         .where("id", isEqualTo: user.uid)
  //         .get();
  //     final List<DocumentSnapshot> documents = result.docs;
  //     if (documents.length == 0) {
  //       FirebaseFirestore.instance.collection("users").doc(user.uid).set({
  //         "id": user.uid,
  //         "username": user.displayName,
  //         "profilepicture": user.photoURL,
  //       });
  //       await preferences.setString("id", user.uid);
  //       await preferences.setString("userName", user.displayName.toString());
  //       await preferences.setString("photoUrl", user.photoURL.toString());
  //     } else {
  //       await preferences.setString("id", documents[0]['id']);
  //       await preferences.setString("userName", documents[0]['userName']);
  //       await preferences.setString("photoUrl", documents[0]['photoUrl']);
  //     }
  //     Fluttertoast.showToast(msg: "login was successful");
  //     setState(() {
  //       loading = false;
  //     });
  //   } else {}
  // }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.value(value: (context) => HomePage_Screen());
    // final User = Provider.of<user>(context);

    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: new Text(
          "Login",
          style: TextStyle(color: Colors.red.shade900),
        ),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(HomePage_Screen.routeName);
            },
            child: Row(
              children: [
                Text(
                  'Signup',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(Icons.person_add)
              ],
            ),
          ),
        ],
      ),
      // body: Stack(
      //   children: [
      //     Visibility(
      //       visible: loading,
      //       child: Center(
      //         child: Container(
      //           alignment: Alignment.center,
      //           color: Colors.white.withOpacity(0.9),
      //           child: CircularProgressIndicator(

      //             valueColor: AlwaysStoppedAnimation(
      //               Colors.red,
      //             ),

      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),

      body: Stack(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius:
                          20.0, // has the effect of softening the shadow
                    )
                  ],
                ),
                child: Form(
                    key: _formKey,
                    child: ListView(children: <Widget>[
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
                            child: TextFormField(
                              controller: _email,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                icon: Icon(Icons.alternate_email),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = new RegExp(pattern.toString());
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
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.3),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _password,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                icon: Icon(Icons.lock_outline),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "The password field cannot be empty";
                                } else if (value.length < 6) {
                                  return "the password has to be at least 6 characters long";
                                }
                                return null;
                              },
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
                              onPressed: () {
                                HomePage_Screen();
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Forgot password",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Singup_Screen()));
                                  },
                                  child: Text(
                                    "Create an account",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black),
                                  ))),
                        ],
                      ),
                    ])),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
