import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:index/creditional.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  TextEditingController email = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  Future RecoverPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
          showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Password reset Link sent! Check your email"),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/imgs/background.jpg"),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    "lib/imgs/logo.png",
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Recover Your Password",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Form(
                        child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: email,
                          cursorColor: Colors.white,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email, color: Colors.pink),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.pink, width: 2)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.pink, width: 2))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            color: Colors.white,
                            onPressed: () {
                              RecoverPassword();
                            },
                            child: Text(
                              "Recover Password",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, "login");
                            },
                            child: Text(
                              "Back",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink),
                            ),
                          ),
                        ),
                      ],
                    )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
