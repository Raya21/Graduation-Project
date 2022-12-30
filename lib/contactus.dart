import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:index/creditional.dart';

late String emailv;

class ContactUs extends StatefulWidget {
  final String value;
  const ContactUs({Key? key, required this.value}) : super(key: key);
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  var x = "alignment".tr;
  int _currentIndex = 0;
  List<Widget> pages = [sendContact(), MsgFromAdmin()];
  @override
  void initState() {
    super.initState();
    emailv = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us".tr,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.purple,
        selectedItemColor: Color.fromARGB(255, 218, 136, 233),
        unselectedItemColor: Colors.white,
        onTap: (val) {
          setState(() {
            _currentIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: "Send Messages".tr,
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages From Admin".tr,
            backgroundColor: Colors.purple,
          ),
        ],
      ),
      body: pages.elementAt(_currentIndex),
    );
  }
}

class sendContact extends StatefulWidget {
  const sendContact({super.key});

  @override
  State<sendContact> createState() => _sendContactState();
}

class _sendContactState extends State<sendContact> {
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
    return Container(
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
                  hintText: "Name".tr,
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
                  hintText: "Subject".tr,
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
                  hintText: "Email".tr,
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
                  hintText: "Message".tr,
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
                  "Send".tr,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 10,
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
                  "Reset",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))
          ],
        ),
      )),
    );
  }
}

class MsgFromAdmin extends StatefulWidget {
  const MsgFromAdmin({super.key});

  @override
  State<MsgFromAdmin> createState() => _MsgFromAdminState();
}

class _MsgFromAdminState extends State<MsgFromAdmin> {
  Future GetMessages() async {
    print(emailv);
    var url = "http://" + IPADDRESS + "/handinhand/appmsgsfromadmin.php";
    var res = await http.post(Uri.parse(url), body: {
      "email": emailv,
    });
    print(res.body);
    var red = json.decode(res.body);
    if (red == "No data") {
      print("No data");
      return;
    } else
      return red;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetMessages(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? ListView.builder(
                itemCount:
                    snapshot.data[0] == "No data" ? 0 : snapshot.data.length,
                itemBuilder: (cts, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 198, 126, 211),
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        title: Text(
                          "${snapshot.data[i]["subject"]}",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${snapshot.data[i]["from_email"]}",
                          style: TextStyle(fontSize: 20),
                        ),
                        leading: Container(
                          child: Image.asset(
                            "lib/imgs/adminmsg.png",
                            width: 50,
                            height: 100,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MSGs(
                                    fromemail:
                                        "${snapshot.data[i]["from_email"]}",
                                    subject: "${snapshot.data[i]["subject"]}",
                                    msg: "${snapshot.data[i]["message"]}",
                                    emailv: emailv,
                                  )));
                        },
                      ),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class MSGs extends StatefulWidget {
  final String fromemail, subject, msg, emailv;
  const MSGs(
      {Key? key,
      required this.fromemail,
      required this.subject,
      required this.msg,
      required this.emailv})
      : super(key: key);

  @override
  State<MSGs> createState() => _MSGsState();
}

class _MSGsState extends State<MSGs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.subject,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
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
            child: Column(children: [

          Row(children: [
            Text("From:".tr, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(width: 5,),
            Text(
            widget.fromemail,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          ],),
          Divider(
            height: 20,
            thickness: 2,
          ),
          Align(
            child: Text(
              widget.msg,
              style: TextStyle(fontSize: 22),
            ),
          ),
        ])),
      ),
    );
  }
}
