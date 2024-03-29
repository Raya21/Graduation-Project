import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:index/creditional.dart';
import 'package:index/reset_password.dart';
import 'package:http/http.dart' as http;
import 'package:index/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
//Import firestore database
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firestore = FirebaseFirestore.instance;

final _formKey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String _errorMessage = '';
  late String emailvalue;
  var Token;

  getToken() async {
    Token = await FirebaseMessaging.instance.getToken();
    print(Token);
  }

  void initState() {
    super.initState();
    getToken();
  }

  Future login() async {
    var url = "http://" + IPADDRESS + "/handinhand2/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": emailcontroller.text,
      "password": passwordcontroller.text,
      "device_token": Token,
    });
    var data = await json.decode(response.body);
    print(data['message']);
    if (data['message'] == "Success") {
      emailvalue = emailcontroller.text;
      print(emailvalue);
      Fluttertoast.showToast(
          msg: "Login Successful".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);

      createUser(email: emailvalue, token: Token);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              Home(value: emailvalue, id: int.parse(data['id']))));
    } else {
      Fluttertoast.showToast(
          msg: "Email or Password Incorrect!".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  Future createUser({required String email, required String token}) async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(emailvalue);

    final json = {'email': email, 'device_token': token};

    ///create doc and write data
    await docUser.set(json);
  }

  Future updateUser({required String email, required String token}) async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(emailvalue);

    ///update doc token
    await docUser.update({
      'device_token': token,
    });
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
            key: _formKey,
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
                    "Welcome!".tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: "Comic_Neue",
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
                      children: [
                        TextFormField(
                          controller: emailcontroller,
                          cursorColor: Colors.white,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email, color: Colors.pink),
                              hintText: "Email".tr,
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pink)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pink))),
                          onChanged: (val) {
                            validateEmail(val);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _errorMessage,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passwordcontroller,
                          cursorColor: Colors.white,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.password, color: Colors.pink),
                              hintText: "Password".tr,
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pink)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pink))),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: ElevatedButton(
                              onPressed: () {
                                login();
                              },
                              child: Text(
                                "Login".tr,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(300, 50),
                                  backgroundColor: Colors.white,
                                  foregroundColor:
                                      Color.fromARGB(255, 216, 51, 122),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  textStyle: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400))),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed("forget_password");
                            },
                            child: Text(
                              "Forget Password?".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 65),
                          child: Text(
                            "Don't have an account?".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed("sign_up");
                              },
                              child: Text(
                                "Create".tr,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(150, 50),
                                  backgroundColor: Colors.white,
                                  foregroundColor:
                                      Color.fromARGB(255, 216, 51, 122),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  textStyle: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500))),
                        )
                      ],
                    )))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email can not be empty".tr;
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address".tr;
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }
}
