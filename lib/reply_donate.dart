import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:index/creditional.dart';

class ReplyDonate extends StatefulWidget {
  final String value;
  final String value1;
  final String value2;
  final String value3;
  final String value4;
  final String value5;
  final String value6;
  const ReplyDonate({
    super.key,
    required this.value,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
    required this.value5,
    required this.value6,
  });

  @override
  State<ReplyDonate> createState() => _ReplyDonateState();
}

class _ReplyDonateState extends State<ReplyDonate> {
  TextEditingController original = TextEditingController();
  TextEditingController remaining = TextEditingController();
  TextEditingController todonate = TextEditingController();
  Future donate() async {

    var url = "http://" + IPADDRESS + "/handinhand/donate.php";
    var response = await http.post(Uri.parse(url), body: {
      "donoremail": widget.value,
      "donateID": widget.value1,
      "email": widget.value2,
      "original": original.text,
      "remaining": remaining.text,
      "todonate": todonate.text
    });
    var data = await json.decode(response.body);
    if (data == "Success") {
      //emailvalue=emailcontroller.text;
      //print(emailvalue);
      Fluttertoast.showToast(
          msg: "Donated Successfully".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(value:emailvalue)));
    } else {
      Fluttertoast.showToast(
          msg: "Donated Faild".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.value3 == 'money') {
      original.text = widget.value4;
    } else {
      original.text = widget.value5;
    }
    remaining.text = widget.value6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Donate".tr,
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
            Text(
              "The original amount of money:".tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: original,
              keyboardType: TextInputType.number,
              cursorColor: Colors.purple,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.purple, width: 2))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "The remaining amount of money:".tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: remaining,
              keyboardType: TextInputType.number,
              cursorColor: Colors.purple,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.purple, width: 2))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "The amount you want to donate:".tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: todonate,
              keyboardType: TextInputType.number,
              cursorColor: Colors.purple,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.purple, width: 2))),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    donate();
                  },
                  child: Text(
                    "Donate".tr,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
