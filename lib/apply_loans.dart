import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:index/contactus.dart';
import 'package:index/creditional.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

//late String idglo;
late String emailglobal;
int flag = 0;
late int loan_id;
late String lname;
late String quali;
late String percent;
late List<String> attach;
//bool _isVisible = false;
//bool _SaveButton_isVisible = true;
var flages;
late List<File> _image;

class applyLoans extends StatefulWidget {
  //const applyLoans({super.key});
  final String value, value1, value2, value3, emailv;
  final int loan_id;
  const applyLoans(
      {Key? key,
      required this.loan_id,
      required this.value,
      required this.value1,
      required this.value2,
      required this.value3,
      required this.emailv})
      : super(key: key);

  @override
  State<applyLoans> createState() => _applyLoansState();
}

class _applyLoansState extends State<applyLoans> {
  var x = "alignment".tr;
  int _currentIndex = 0;
  List<Widget> pages = [Qualifications(), LoanPercent(), attachments()];
  @override
  void initState() {
    super.initState();
    loan_id = widget.loan_id;
    lname = widget.value;
    quali = widget.value1;
    percent = widget.value2;
    attach = widget.value3.split(',');
    emailglobal = widget.emailv;
    _image = [
      File("1"),
      File("1"),
      File("1"),
      File("1"),
      File("1"),
      File("1"),
      File("1"),
      File("1"),
      File("1"),
      File("1"),
      File("1"),
      File("1"),
      File("1"),
      File("1"),
      File("1"),
      File("1"),
      File("1"),
      File("1")
    ];

    flages = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

    print(_image.elementAt(0));
    for (int y = 0; y < attach.length - 1; y++) {}
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
            label: "Loan Percentage".tr,
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
          "Loan Conditions:".tr,
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

class LoanPercent extends StatefulWidget {
  const LoanPercent({super.key});

  @override
  State<LoanPercent> createState() => _LoanPercentState();
}

class _LoanPercentState extends State<LoanPercent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
          child: Column(children: [
        Text(
          "Loan Percentage:".tr,
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
  //var _image = [];
  var i = attach.length - 1;
  // List<File> _image = [];
  final picker = ImagePicker();
  Future choiceImage(int index) async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    //if(pickedImage==null) return;

    setState(() {
      _image[index] = File(pickedImage!.path);
      flages[index] = 1;
      //_image.insert(index, File(pickedImage!.path));
    });

    //print(_image);
  }

  Future uploadImage() async {
    final uri =
        await Uri.parse("http://" + IPADDRESS + "/handinhand2/lupload.php");
    var request1;
    for (int i = 0; i < attach.length - 1; i++) {
      request1 = http.MultipartRequest('POST', uri);
      request1.fields['num_attach'] = (attach.length - 1).toString();
      request1.fields['loan_id'] = loan_id.toString();
      request1.fields['email'] = emailglobal;
      request1.fields['lname'] = lname;
      request1.fields['attach_name'] = attach[i];

      var pic1 = await http.MultipartFile.fromPath("image", _image[i].path);
      request1.files.add(pic1);

      var response1 = await request1.send();

      var data = await json.decode(await response1.stream.bytesToString());
      print(data);
      //var data = await json.decode(await response1.stream.bytesToString());

      if (i == attach.length - 2) {
        if (data == "already attached") {
          Fluttertoast.showToast(
              msg: "Attachments are attached before!".tr,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16);
          flag = 1;
        } else if (response1.statusCode == 200) {
          Fluttertoast.showToast(
              msg: "Images have been attached successfully".tr,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Color.fromARGB(255, 203, 158, 211),
              textColor: Colors.purple,
              fontSize: 16);
          flag = 1;

          // setState(() {
          //   _isVisible = true;
          //   _SaveButton_isVisible = false;
          // });
        } else {
          Fluttertoast.showToast(
              msg: "Failed to attach Images".tr,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16);
          print("Images Not Uploaded");
        }
      }
    }
  }

  Future requestLoan() async {
    print(loan_id.toString());
    print(emailglobal);
    print(lname);
    var url = "http://" + IPADDRESS + "/handinhand2/requestLoan.php";
    var response = await http.post(Uri.parse(url), body: {
      "loan_id": loan_id.toString(),
      "email": emailglobal,
      "lname": lname,
    });
    print(response.body);
    var data = await json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "The request has been submitted successfully".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
    } else if (data == "Failed") {
      Fluttertoast.showToast(
          msg: "Submission failed".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    } else if (data == "no profile data") {
      Fluttertoast.showToast(
          msg: "Be sure to enter profile data!".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    } else if (data == "submitted before") {
      Fluttertoast.showToast(
          msg: "The loan request has been submitted before!".tr,
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
            "To apply for the loan, please upload the following attachments:"
                .tr,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: attach.length - 1,
            itemBuilder: (context, index) {
              // h2(index.toString());
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      attach[index],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    //visible: _SaveButton_isVisible,
                    child: TextButton(
                        onPressed: () {
                          choiceImage(index);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.attach_file,
                              color: Colors.purple,
                            ),
                            Text(
                              "Pick Image".tr,
                              style:
                                  TextStyle(color: Colors.purple, fontSize: 20),
                            ),
                          ],
                        )),
                  ),
                  Container(
                      child: flages?[index] == 0
                          ? Text(
                              'No Image Selected'.tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          : Image.file(_image[index])),
                  // Image.file(_image[index])
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Visibility(
          //visible: _SaveButton_isVisible,
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  var count = 0;
                  for (int i = 0; i < attach.length - 1; i++) {
                    if (flages[i] == 1) {
                      count++;
                    }
                  }

                  if (count != attach.length - 1) {
                    Fluttertoast.showToast(
                        msg: "Be sure to attach all the attachments!".tr,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16);
                  } else {
                    uploadImage();
                  }
                },
                child: Text(
                  "Save".tr,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Visibility(
          //visible: _isVisible,
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  if (flag == 0) {
                    Fluttertoast.showToast(
                        msg: "Be sure to attach and save all the attachments!"
                            .tr,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16);
                  } else
                    requestLoan();
                },
                child: Text(
                  "Loan Request".tr,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ),
        )
      ])),
    );
  }
}
