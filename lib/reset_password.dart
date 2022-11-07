import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:index/login.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final _formKey = GlobalKey<FormState>();
  String _errorMessage = '';
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController oldpasswordcontroller = TextEditingController();

  Future resetpassword() async {
    var url = "http://192.168.1.10/handinhand/forget_password.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": emailcontroller.text,
      "oldpassword": oldpasswordcontroller.text,
      "newpassword": newpasswordcontroller.text,
    });

    var data = await json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Password Updated Successfully".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Reset Password".tr,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailcontroller,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.purple),
                                hintText: "E-mail".tr,
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 20),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2))),
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
                            height: 20,
                          ),
                          TextFormField(
                            controller: oldpasswordcontroller,
                            obscureText: true,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.password, color: Colors.purple),
                                hintText: "Old password".tr,
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 20),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: newpasswordcontroller,
                            obscureText: true,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.password, color: Colors.purple),
                                hintText: "New password".tr,
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 20),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2))),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            child: ElevatedButton(
                                onPressed: () {
                                  resetpassword();
                                },
                                child: Text(
                                  "Confirm".tr,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(150, 50),
                                    backgroundColor: Colors.purple,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    textStyle: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w400))),
                          ),
                        ],
                      )))
            ],
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
