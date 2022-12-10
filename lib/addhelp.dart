import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:index/creditional.dart';

class AddHelp extends StatefulWidget {
  //const AddHelp({super.key});
  final String value;
  const AddHelp({Key? key, required this.value}) : super(key: key);
  @override
  State<AddHelp> createState() => _AddHelpState();
}

class _AddHelpState extends State<AddHelp> {
  TextEditingController helpCon = TextEditingController();
  bool editmode = false;
  Future addingHelp() async {
    var url = "http://" + IPADDRESS + "/handinhand/addhelp.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": widget.value,
      "help": helpCon.text,
    });
    var data = await json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Added Successfully".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: "Add Faild".tr,
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
        title: Text(
          "Add Help".tr,
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
      body: Column(children: [
        Card(
            margin: EdgeInsets.all(10),
            color: Color.fromARGB(255, 197, 175, 201),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: helpCon,
                maxLines: 8, //or null
                decoration: InputDecoration.collapsed(
                    hintText: "Enter your text here".tr,
                    hintStyle: TextStyle(fontSize: 20, color: Colors.black)),
              ),
            )),
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
                addingHelp();
              },
              child: Text(
                "Save".tr,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ]),
    );
  }
}
