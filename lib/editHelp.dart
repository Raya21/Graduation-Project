import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:index/creditional.dart';

class EditHelp extends StatefulWidget {
  final String value;
  final String value1;
  final String value2;
  const EditHelp(
      {super.key,
      required this.value,
      required this.value1,
      required this.value2});

  @override
  State<EditHelp> createState() => _EditHelpState();
}

class _EditHelpState extends State<EditHelp> {
  TextEditingController helpCon = TextEditingController();
  Future editHelp() async {
    var url = "http://" + IPADDRESS + "/handinhand/edithelp.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": widget.value,
      "oldhelp": widget.value1,
      "help": helpCon.text,
      "id": widget.value2
    });
    var data = await json.decode(response.body);
    if (data == "Success") {
      //emailvalue=emailcontroller.text;
      //print(emailvalue);
      Fluttertoast.showToast(
          msg: "Edited Successfully".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(value:emailvalue)));
    } else {
      Fluttertoast.showToast(
          msg: "Edit Faild".tr,
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
    helpCon.text = widget.value1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Help".tr,
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
                style: TextStyle(fontSize: 20),
                /*decoration: InputDecoration.collapsed(
                    hintText: widget.value1,
                    hintStyle: TextStyle(color: Colors.black)),*/
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
                editHelp();
              },
              child: Text(
                "Update".tr,
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
