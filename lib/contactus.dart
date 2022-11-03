import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController subjectController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  Future sendEmail(
      String name, String subject, String email, String message) async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_6qgggu4";
    const templateId = "template_e9d230o";
    const userId = "user_yZApJfr0tKNHzsarg";
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_subject': subject,
            'user_email': email,
            'user_message': message,
          }
        }));
    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Contact Us",
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
                controller: nameController,
                cursorColor: Colors.purple,
                keyboardType: TextInputType.name,
                style: TextStyle(fontSize: 20),
                focusNode: myFocusNode,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.purple),
                    hintText: "Name",
                    hintStyle:
                        TextStyle(color: Colors.grey.shade500, fontSize: 20),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: subjectController,
                cursorColor: Colors.purple,
                style: TextStyle(fontSize: 20),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.subject, color: Colors.purple),
                    hintText: "Subject",
                    hintStyle:
                        TextStyle(color: Colors.grey.shade500, fontSize: 20),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 20),
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.purple),
                    hintText: "Email",
                    hintStyle:
                        TextStyle(color: Colors.grey.shade500, fontSize: 20),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple))),
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'Required*';
                  } else if (!EmailValidator.validate(email)) {
                    return 'Please enter a valid Email';
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
                    hintText: "Message",
                    hintStyle:
                        TextStyle(color: Colors.grey.shade500, fontSize: 20),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple))),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await sendEmail(
                          nameController.text,
                          subjectController.text,
                          emailController.text,
                          messageController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        response == 200
                            ? const SnackBar(
                                content: Text('Message Sent!'),
                                backgroundColor: Colors.green)
                            : const SnackBar(
                                content: Text('Failed to send message!'),
                                backgroundColor: Colors.red),
                      );
                      Future.delayed(Duration(microseconds: 500), () {
                        //call back after 500  microsecon
                        nameController.clear();
                        subjectController.clear();
                        emailController.clear();
                        messageController.clear();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    "Send",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
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
                    "Reset",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
