import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:index/creditional.dart';

late String sname;
late String quali;
late String percent;
late String attach;
late String emailglo;

class Scholarship extends StatefulWidget {
  final String value, value1, value2, value3, emailv;
  const Scholarship(
      {Key? key,
      required this.value,
      required this.value1,
      required this.value2,
      required this.value3,
      required this.emailv})
      : super(key: key);

  @override
  State<Scholarship> createState() => _ScholarshipState();
}

class _ScholarshipState extends State<Scholarship> {
  var x = "alignment".tr;
  int _currentIndex = 0;
  List<Widget> pages = [Qualifications(), ScholarshipPercent(), attachments()];
  @override
  void initState() {
    super.initState();
    sname = widget.value;
    quali = widget.value1;
    percent = widget.value2;
    attach = widget.value3;
    emailglo = widget.emailv;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.value,
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
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            sname = widget.value;
            quali = widget.value1;
            percent = widget.value2;
            attach = widget.value3;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: "Conditions".tr,
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.percent),
            label: "Percentage".tr,
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attachment),
            label: "Attachments".tr,
            backgroundColor: Colors.purple,
          ),
        ],
      ),
      body: pages.elementAt(_currentIndex),
    );
  }
}

class Qualifications extends StatefulWidget {
  const Qualifications({super.key});

  @override
  State<Qualifications> createState() => _QualificationsState();
}

class _QualificationsState extends State<Qualifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
          child: Column(children: [
        Text(
          "Conditions:".tr,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Divider(
          height: 20,
          thickness: 2,
        ),
        Align(
          child: Text(
            quali,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ])),
    );
  }
}

class ScholarshipPercent extends StatefulWidget {
  const ScholarshipPercent({super.key});

  @override
  State<ScholarshipPercent> createState() => _ScholarshipPercentState();
}

class _ScholarshipPercentState extends State<ScholarshipPercent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
          child: Column(children: [
        Text(
          "Scholarship Percentage:".tr,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Divider(
          height: 20,
          thickness: 2,
        ),
        Align(
          child: Text(
            percent,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ])),
    );
  }
}

class attachments extends StatefulWidget {
  const attachments({super.key});

  @override
  State<attachments> createState() => _attachmentsState();
}

class _attachmentsState extends State<attachments> {
  late File _image;
  final picker = ImagePicker();
  Future choiceImage() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  Future uploadImage() async {
    final uri = await Uri.parse("http://"+IPADDRESS+"/handinhand/supload.php");
    var request1 = http.MultipartRequest('POST', uri);
    request1.fields['email'] = emailglo;
    request1.fields['sname'] = sname;
    var pic1 = await http.MultipartFile.fromPath("image", _image.path);
    request1.files.add(pic1);
    var response1 = await request1.send();
    if (response1.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "File Uploaded".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: "File Not Uploaded".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
      print("Images Not Uploaded");
    }
  }
  Future requestScholar() async {
    var url = "http://"+IPADDRESS+"/handinhand/requestScholar.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": emailglo,
      "sname": sname,
    });
    var data = await json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Submission successful".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: "Submission failed".tr,
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
    return Container(
      margin: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
          child: Column(children: [
        Text(
          "Attachments:".tr,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Divider(
          height: 20,
          thickness: 2,
        ),
        Align(
          child: Text(
            "To apply for the scholarship, please download the following attachments:"
                .tr,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          child: Text(
            attach,
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextButton(
            onPressed: () {
              choiceImage();
            },
            child: Row(
              children: [
                Icon(
                  Icons.attach_file,
                  color: Colors.purple,
                ),
                Text(
                  "Pick Files".tr,
                  style: TextStyle(color: Colors.purple, fontSize: 20),
                ),
              ],
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
                uploadImage();
              },
              child: Text(
                "Save".tr,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(
            height: 15,
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
                  requestScholar();
                },
                child: Text(
                  "Scholarship Request".tr,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          )
      ])),
    );
  }
}
