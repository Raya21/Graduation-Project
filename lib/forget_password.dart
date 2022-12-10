import 'dart:convert';

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

  bool verifyButton = false;
  late String verifyLink;
  Future checkUser() async {
    var response = await http.post(Uri.parse("http://"+IPADDRESS+"/handinhand/check.php"),
        body: {"username": email.text});
    var link = json.decode(response.body);
    if (link == "INVALIDUSER") {
      Fluttertoast.showToast(
        msg: "This user not in our database",
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 6,
      );
    } else {
      sendMAil();
      setState(() {
        verifyLink = link;
        verifyButton = true;
      });
      Fluttertoast.showToast(
        msg: "Click Verify Button To Reset Password",
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 4,
      );
    }
    print(link);
  }

  int newPass = 0;
  Future resetPassword(String verifyLink) async {
    var response = await http.post(Uri.parse(verifyLink));//in video he put verifyLink without Uri.parse but without it i got an error
    var link = json.decode(response.body);
    setState(() {
      newPass = link;
      verifyButton = false;
    });
    print(link);
    Fluttertoast.showToast(
      msg: "Your Password has been reset: $newPass",
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 4,
    );
  }

  sendMAil() async {
    String username = EMAIL;
    String password = PASS;

    final SmtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username)
      ..recipients.add("signaturesoftit@gmail.com")
      ..subject = "Password recover link: ${DateTime.now()}"
      ..html =
          "<h3>Thanks for with localhost. Please click this link to reset your password</h3>\n<p><a href='$verifyLink'>Click me to reset</a></p>";

    try {
      final SendReport = await send(message, SmtpServer);
      print("Message sent: " + SendReport.toString());
    } on MailerException catch (e) {
      print("Message not sent. \n" + e.toString());
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
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email, color: Colors.pink),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 20),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.pink, width: 2)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.pink, width: 2))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            color: Colors.pink,
                            onPressed: () {
                              checkUser();
                            },
                            child: Text(
                              "Recover Password",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        verifyButton
                            ? MaterialButton(
                                color: Colors.black,
                                onPressed: () {
                                  resetPassword(verifyLink);
                                },
                                child: Text(
                                  "Verify",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            : Container(),
                        newPass == 0
                            ? Container()
                            : Text("New Password is $newPass")
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
