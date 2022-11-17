import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ContactUs extends StatefulWidget {
  final int id;
  const ContactUs({super.key, required this.id});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  final subjectController = TextEditingController();
  late final messageController = TextEditingController();

  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  Future send() async {
    var url = "http://192.168.1.10/handinhand/contactus.php";
    var response = await http.post(Uri.parse(url), body: {
      "id": widget.id.toString(),
      "topic": subjectController.text,
      "message": messageController.text,
    });
    var data = await json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Sent Successfully".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
      _formKey.currentState!.reset();
      myFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Contact Us".tr,
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
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: subjectController,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.subject, color: Colors.purple),
                    hintText: "Subject".tr,
                    hintStyle:
                        TextStyle(color: Colors.grey.shade500, fontSize: 20),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Required'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: messageController,
                keyboardType: TextInputType.multiline,
                style: TextStyle(fontSize: 20),
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.message, color: Colors.purple),
                    hintText: "Message".tr,
                    hintStyle:
                        TextStyle(color: Colors.grey.shade500, fontSize: 20),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple))),
                maxLines: 5,
                minLines: 1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Required'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      send();
                    } else {
                      Fluttertoast.showToast(
                          msg: "One of the text fields is empty!".tr,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    "Send".tr,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    _formKey.currentState!.reset();
                    myFocusNode.requestFocus();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    "Reset".tr,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
