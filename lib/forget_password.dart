import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:index/creditional.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  TextEditingController _emailcon = new TextEditingController();
  String _errorMessage = '';
  bool _obscureText = true;

  Future RecoverPassword() async {
    var url = "http://" + IPADDRESS + "/handinhand/forget_password.php";
    var res = await http.post(Uri.parse(url), body: {
      "email": _emailcon.text,
    });
    var red = json.decode(res.body);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Recover your password!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            content: Text(red.toString(), style: TextStyle(fontSize: 20),),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Colse".tr,
                    style: TextStyle(fontSize: 20,color: Colors.purple),
                  ))
            ],
          );
        });

    /*Fluttertoast.showToast(
        msg: red.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 300,
        backgroundColor: Color.fromARGB(255, 203, 158, 211),
        textColor: Colors.purple,
        fontSize: 16);*/
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
                          controller: _emailcon,
                          cursorColor: Colors.white,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email, color: Colors.pink),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.pink, width: 2)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.pink, width: 2))),
                          onChanged: (val) {
                            validateEmail(val);
                          },
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
