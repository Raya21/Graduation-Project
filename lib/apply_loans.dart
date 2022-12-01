import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

//late String idglo;
late String emailglo;

class applyLoans extends StatefulWidget {
  //const applyLoans({super.key});
  final String value;
  const applyLoans({Key? key, required this.value}) : super(key: key);

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
    emailglo = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Loans Request".tr,
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
            emailglo = widget.value;
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
          child: Column(
        children: [
          Text(
            "Conditions:".tr,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Divider(
            height: 20,
            thickness: 2,
          ),
          Text(
            "t1_q".tr,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "t2_q".tr,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "t3_q".tr,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "t4_q".tr,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "t5_q".tr,
            style: TextStyle(fontSize: 20),
          ),
        ],
      )),
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
            "Notes:".tr,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Divider(
            height: 20,
            thickness: 2,
          ),
          Text(
            "t6_q".tr,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "t7_q".tr,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "t8_q".tr,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          /* Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("loans_request");
                },
                child: Text(
                  "Apply for a loan".tr,
                  style: TextStyle(fontSize: 20),
                )),
          )*/
        ])));
  }
}

class attachments extends StatefulWidget {
  const attachments({super.key});

  @override
  State<attachments> createState() => _attachmentsState();
}

class _attachmentsState extends State<attachments> {
  late File _image1;
  final picker1 = ImagePicker();
  late File _image2;
  final picker2 = ImagePicker();
  late File _image3;
  final picker3 = ImagePicker();
  late File _image4;
  final picker4 = ImagePicker();
  late File _image5;
  final picker5 = ImagePicker();
  late File _image6;
  final picker6 = ImagePicker();
  late File _image7;
  final picker7 = ImagePicker();
  late File _image8;
  final picker8 = ImagePicker();
  late File _image9;
  final picker9 = ImagePicker();
  late File _image10;
  final picker10 = ImagePicker();

  Future choiceImage1() async {
    var pickedImage = await picker1.getImage(source: ImageSource.gallery);
    setState(() {
      _image1 = File(pickedImage!.path);
    });
  }

  Future choiceImage2() async {
    var pickedImage = await picker2.getImage(source: ImageSource.gallery);
    setState(() {
      _image2 = File(pickedImage!.path);
    });
  }

  Future choiceImage3() async {
    var pickedImage = await picker3.getImage(source: ImageSource.gallery);
    setState(() {
      _image3 = File(pickedImage!.path);
    });
  }

  Future choiceImage4() async {
    var pickedImage = await picker4.getImage(source: ImageSource.gallery);
    setState(() {
      _image4 = File(pickedImage!.path);
    });
  }

  Future choiceImage5() async {
    var pickedImage = await picker5.getImage(source: ImageSource.gallery);
    setState(() {
      _image5 = File(pickedImage!.path);
    });
  }

  Future choiceImage6() async {
    var pickedImage = await picker6.getImage(source: ImageSource.gallery);
    setState(() {
      _image6 = File(pickedImage!.path);
    });
  }

  Future choiceImage7() async {
    var pickedImage = await picker7.getImage(source: ImageSource.gallery);
    setState(() {
      _image7 = File(pickedImage!.path);
    });
  }

  Future choiceImage8() async {
    var pickedImage = await picker8.getImage(source: ImageSource.gallery);
    setState(() {
      _image8 = File(pickedImage!.path);
    });
  }

  Future choiceImage9() async {
    var pickedImage = await picker9.getImage(source: ImageSource.gallery);
    setState(() {
      _image9 = File(pickedImage!.path);
    });
  }

  Future choiceImage10() async {
    var pickedImage = await picker10.getImage(source: ImageSource.gallery);
    setState(() {
      _image10 = File(pickedImage!.path);
    });
  }

  Future uploadImage() async {
    print(emailglo);
    final uri = await Uri.parse("http://192.168.1.105/handinhand/upload.php");
    //image 1
    var request1 = http.MultipartRequest('POST', uri);
    request1.fields['email'] = emailglo;
    var pic1 = await http.MultipartFile.fromPath("image", _image1.path);
    request1.files.add(pic1);
    var response1 = await request1.send();
    //image 2
    var request2 = http.MultipartRequest('POST', uri);
    request2.fields['email'] = emailglo;
    var pic2 = await http.MultipartFile.fromPath("image", _image2.path);
    request2.files.add(pic2);
    var response2 = await request2.send();
    //image 3
    var request3 = http.MultipartRequest('POST', uri);
    request3.fields['email'] = emailglo;
    var pic3 = await http.MultipartFile.fromPath("image", _image3.path);
    request3.files.add(pic3);
    var response3 = await request3.send();
    //image 4
    var request4 = http.MultipartRequest('POST', uri);
    request4.fields['email'] = emailglo;
    var pic4 = await http.MultipartFile.fromPath("image", _image4.path);
    request4.files.add(pic4);
    var response4 = await request4.send();
    //image 5
    var request5 = http.MultipartRequest('POST', uri);
    request5.fields['email'] = emailglo;
    var pic5 = await http.MultipartFile.fromPath("image", _image5.path);
    request5.files.add(pic5);
    var response5 = await request5.send();
    //image 6
    var request6 = http.MultipartRequest('POST', uri);
    request6.fields['email'] = emailglo;
    var pic6 = await http.MultipartFile.fromPath("image", _image6.path);
    request6.files.add(pic6);
    var response6 = await request6.send();
    //image 7
    var request7 = http.MultipartRequest('POST', uri);
    request7.fields['email'] = emailglo;
    var pic7 = await http.MultipartFile.fromPath("image", _image7.path);
    request7.files.add(pic7);
    var response7 = await request7.send();
    //image 8
    var request8 = http.MultipartRequest('POST', uri);
    request8.fields['email'] = emailglo;
    var pic8 = await http.MultipartFile.fromPath("image", _image8.path);
    request8.files.add(pic8);
    var response8 = await request8.send();
    //image 9
    var request9 = http.MultipartRequest('POST', uri);
    request9.fields['email'] = emailglo;
    var pic9 = await http.MultipartFile.fromPath("image", _image9.path);
    request9.files.add(pic9);
    var response9 = await request9.send();
    //image 10
    var request10 = http.MultipartRequest('POST', uri);
    request10.fields['email'] = emailglo;
    var pic10 = await http.MultipartFile.fromPath("image", _image10.path);
    request10.files.add(pic10);
    var response10 = await request10.send();
    // if (pic1 == Null &&
    //     pic2 == Null &&
    //     pic3 == Null &&
    //     pic4 == Null &&
    //     pic5 == Null &&
    //     pic6 == Null &&
    //     pic7 == Null &&
    //     pic8 == Null &&
    //     pic9 == Null &&
    //     pic10 == Null) {
    //   Fluttertoast.showToast(
    //       msg: "You must pick all files".tr,
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Color.fromARGB(255, 203, 158, 211),
    //       textColor: Colors.purple,
    //       fontSize: 16);
    // }
    if (response1.statusCode == 200 &&
        response2.statusCode == 200 &&
        response3.statusCode == 200 &&
        response4.statusCode == 200 &&
        response5.statusCode == 200 &&
        response6.statusCode == 200 &&
        response7.statusCode == 200 &&
        response8.statusCode == 200 &&
        response9.statusCode == 200 &&
        response10.statusCode == 200) {
          Fluttertoast.showToast(
          msg: "Files Uploaded".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
      print("Images Uploaded");
    } else {
      Fluttertoast.showToast(
          msg: "Files Not Uploaded".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
      print("Images Not Uploaded");
    }
  }

  Future requestLoan() async {
    var url = "http://192.168.1.105/handinhand/request.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": emailglo,
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
          child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Attachments".tr,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 20,
            thickness: 2,
          ),
          Align(
            child: Text(
              "t0_a".tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "1. ID Card".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () {
                choiceImage1();
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
            height: 10,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "2. Student Card".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () {
                choiceImage2();
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
            height: 10,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "3. Transcript for the last semester".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () {
                choiceImage3();
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
            height: 10,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "t7_a".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () {
                choiceImage4();
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
            height: 10,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "5. ID card of the head of the family, showing the family members"
                  .tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () {
                choiceImage5();
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
            height: 10,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "t1_a".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () {
                choiceImage6();
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
            height: 10,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "t2_a".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () {
                choiceImage7();
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
            height: 10,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "t3_a".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () {
                choiceImage8();
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
            height: 10,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "t4_a".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () {
                choiceImage9();
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
            height: 10,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "t5_a".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () {
                choiceImage10();
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
                onPressed: (() {
                  uploadImage();
                }),
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
                  requestLoan();
                },
                child: Text(
                  "Loan Request".tr,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      )),
    );
  }
}
