import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final nameController = TextEditingController();
  final subjectController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  Future sendEmail()async{
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_6qgggu4";
    const templateId = "template_e9d230o";
    const userId = "user_yZApJfr0tKNHzsarg";
    final response = await http.post(url,
    headers: {'Content-Type':'application/json'},
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params':{
        'user_name':nameController.text,
        'user_subject':subjectController.text,
        'user_message': messageController.text,
        'user_email': emailController.text
      }
      })
    );
    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Contact Us"),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), 
        onPressed: () {  
          Navigator.pop(context);
        },),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                      controller: nameController,
                      cursorColor: Colors.purple,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.purple),
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)
                        )
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: subjectController,
                      cursorColor: Colors.purple,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.subject, color: Colors.purple),
                        hintText: "Subject",
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)
                        )
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: emailController,
                      cursorColor: Colors.purple,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.purple),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)
                        )
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: messageController,
                      cursorColor: Colors.purple,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.message, color: Colors.purple),
                        hintText: "Message",
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)
                        )
                      ),
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(
                      onPressed: (){
                        sendEmail();
                      }, 
                      style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(vertical: 13,horizontal: 22),
                shape: RoundedRectangleBorder( 
                  borderRadius: BorderRadius.circular(30)
              ),
              ),
                    child: Text("Send",style: TextStyle(fontSize: 20,color: Colors.white),))
            ],),
          )
          ),
      ),
    );
  }
}