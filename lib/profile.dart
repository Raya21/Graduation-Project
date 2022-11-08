import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

late String idglo;

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  var x = "alignment".tr;
  int _currentIndex = 0;
  List<Widget> pages = [personInfo(), contactInfo(), eduInfo(), attachments()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile".tr,
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
            icon: Icon(Icons.person),
            label: "Personal Info".tr,
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: "Contact Info".tr,
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cast_for_education),
            label: "Educational Info".tr,
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

class personInfo extends StatefulWidget {
  const personInfo({Key? key}) : super(key: key);

  @override
  State<personInfo> createState() => _personInfoState();
}

class _personInfoState extends State<personInfo> {
  final _formKey1 = GlobalKey<FormState>();
  String selectedIncome = "-";
  String selectedGender = "Male".tr;
  String selectedSS = "Single".tr;
  TextEditingController fname = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController birthplace = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController bdate = TextEditingController();
  String _errorMessage = '';

  Future person() async {
    idglo = id.text;
    var url = "http://192.168.1.106/handinhand/personInfo.php";
    var response = await http.post(Uri.parse(url), body: {
      "fname": fname.text,
      "id": id.text,
      "birthdate": bdate.text,
      "birthplace": birthplace.text,
      "city": city.text,
      "income": selectedIncome,
      "gender": selectedGender,
      "socialstatus": selectedSS
    });
    var data = await json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Saved",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: "Updated!",
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
    super.initState();
    bdate.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey1,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Person Information".tr,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                height: 20,
                thickness: 2,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "Full Name:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: fname,
                keyboardType: TextInputType.name,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "ID:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: id,
                cursorColor: Colors.purple,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.purple, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "Birth Date:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: TextFormField(
                  controller: bdate,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.purple,
                      ),
                      iconColor: Color.fromARGB(255, 184, 136, 192),
                      /*labelText: "Enter your birth date",
                labelStyle: TextStyle(color:  Colors.black,fontSize: 20),*/
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2))),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1960),
                      lastDate: DateTime(2023),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        String formattedDate =
                            DateFormat("yyyy-MM-dd").format(pickedDate);
                        bdate.text = formattedDate.toString();
                      });
                    } else {
                      print("Not selected Birth date");
                    }
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "Birth Place:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: birthplace,
                cursorColor: Colors.purple,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.purple, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "City:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: city,
                keyboardType: TextInputType.name,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.purple, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "Average Income:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20)),
                  child: DropdownButton(
                    items: [
                      "-",
                      "0-500 NIS".tr,
                      "500-1000 NIS".tr,
                      "1000-1500 NIS".tr,
                      "1500-2000 NIS".tr,
                      "2000-3000 NIS".tr,
                      "More than 3000 NIS".tr
                    ]
                        .map((e) => DropdownMenuItem(
                              child: Text("$e"),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedIncome = val!;
                      });
                    },
                    value: selectedIncome,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "Gender:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20)),
                  child: DropdownButton(
                    items: ["Male".tr, "Female".tr]
                        .map((e) => DropdownMenuItem(
                              child: Text("$e", style: TextStyle(fontSize: 20)),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedGender = val!;
                      });
                    },
                    value: selectedGender,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "Social Status:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20)),
                  child: DropdownButton(
                    items: ["Single".tr, "Married".tr]
                        .map((e) => DropdownMenuItem(
                              child: Text(
                                "$e",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedSS = val!;
                      });
                    },
                    value: selectedSS,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 22),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      person();
                    },
                    child: Text(
                      "Save".tr,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class contactInfo extends StatefulWidget {
  const contactInfo({Key? key}) : super(key: key);

  @override
  State<contactInfo> createState() => _contactInfoState();
}

class _contactInfoState extends State<contactInfo> {
  final _formKey2 = GlobalKey<FormState>();
  TextEditingController Tphone = TextEditingController();
  TextEditingController Mphone = TextEditingController();
  String _errorMessage = '';

  Future contact() async {
    var url = "http://192.168.1.106/handinhand/contactInfo.php";
    var response = await http.post(Uri.parse(url), body: {
      "id": idglo,
      "TPhone": Tphone.text,
      "MPhone": Mphone.text,
    });
    var data = await json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Saved",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: "Updated",
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
          child: Form(
        key: _formKey2,
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Contact Information".tr,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              height: 20,
              thickness: 2,
            ),
            Align(
              //alignment: Alignment.topLeft,
              child: Text(
                "Telephone Number:".tr,
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextFormField(
              controller: Tphone,
              keyboardType: TextInputType.phone,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              //alignment: Alignment.topLeft,
              child: Text(
                "Mobile Phone Number:".tr,
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextFormField(
              controller: Mphone,
              keyboardType: TextInputType.phone,
              cursorColor: Colors.purple,
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
                    contact();
                  },
                  child: Text(
                    "Save".tr,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      )),
    );
  }
}

class eduInfo extends StatefulWidget {
  const eduInfo({Key? key}) : super(key: key);

  @override
  State<eduInfo> createState() => _eduInfoState();
}

class _eduInfoState extends State<eduInfo> {
  final _formKey3 = GlobalKey<FormState>();
  String selectedBranch = "Study branch".tr;
  String selectedDegree = "Undergraduate degree".tr;
  String selectedYear = "Academic year".tr;
  TextEditingController yearofEn = TextEditingController();
  TextEditingController schoolcon = TextEditingController();
  TextEditingController gradecon = TextEditingController();
  TextEditingController uni = TextEditingController();
  TextEditingController collegecon = TextEditingController();
  TextEditingController dep = TextEditingController();
  TextEditingController gpacon = TextEditingController();
  TextEditingController uniid = TextEditingController();
  TextEditingController yearofEnUni = TextEditingController();
  String _errorMessage = '';

  Future education() async {
    var url = "http://192.168.1.106/handinhand/eduInfo.php";
    var response = await http.post(Uri.parse(url), body: {
      "id": idglo,
      "yearofEn": yearofEn.text,
      "school": schoolcon.text,
      "grade": gradecon.text,
      "university": uni.text,
      "college": collegecon.text,
      "department": dep.text,
      "gpa": gpacon.text,
      "yearofEnUni": yearofEnUni.text,
      "uniid": uniid.text,
      "branch": selectedBranch,
      "degree": selectedDegree,
      "acadmicyear": selectedYear
    });
    var data = await json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Saved",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: "Updated!",
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
            child: Form(
          key: _formKey3,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Education Information".tr,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "High Scool Information:".tr,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                height: 20,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "Year of enrollment:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: yearofEn,
                keyboardType: TextInputType.number,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "School:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: schoolcon,
                keyboardType: TextInputType.name,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "Grade:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: gradecon,
                keyboardType: TextInputType.number,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "Study Branch:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20)),
                  child: DropdownButton(
                    items: [
                      "Study branch".tr,
                      "Scientific".tr,
                      "Literary".tr,
                      "Commercial".tr,
                      "Industrial".tr
                    ]
                        .map((e) => DropdownMenuItem(
                              child: Text("$e", style: TextStyle(fontSize: 20)),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedBranch = val!;
                      });
                    },
                    value: selectedBranch,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "University Information:".tr,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                height: 20,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "Undergraduate degree:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20)),
                  child: DropdownButton(
                    items: [
                      "Undergraduate degree".tr,
                      "Diploma".tr,
                      "BA".tr,
                      "Master's".tr,
                      "PhD".tr
                    ]
                        .map((e) => DropdownMenuItem(
                              child: Text("$e", style: TextStyle(fontSize: 20)),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedDegree = val!;
                      });
                    },
                    value: selectedDegree,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "University:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: uni,
                keyboardType: TextInputType.name,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "College:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: collegecon,
                keyboardType: TextInputType.name,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "Department:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: dep,
                keyboardType: TextInputType.name,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "Academic Year:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20)),
                  child: DropdownButton(
                    items: [
                      "Academic year".tr,
                      "First".tr,
                      "Second".tr,
                      "Third".tr,
                      "Fourth".tr,
                      "Fifth".tr,
                      "Sixth".tr,
                      "Seventh".tr
                    ]
                        .map((e) => DropdownMenuItem(
                              child: Text("$e", style: TextStyle(fontSize: 20)),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedYear = val!;
                      });
                    },
                    value: selectedYear,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "GPA:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: gpacon,
                keyboardType: TextInputType.number,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "University ID:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: uniid,
                keyboardType: TextInputType.number,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                //alignment: Alignment.topLeft,
                child: Text(
                  "Year of enrollment:".tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: yearofEnUni,
                keyboardType: TextInputType.datetime,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 22),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      education();
                    },
                    child: Text(
                      "Save".tr,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        )));
  }
}

class attachments extends StatefulWidget {
  const attachments({super.key});

  @override
  State<attachments> createState() => _attachmentsState();
}

class _attachmentsState extends State<attachments> {
  FilePickerResult? result1;
  String _fileName1="";
  PlatformFile? pickedfile1;
  bool isLoading1 = false;
  File? fileToDisplay1;
  FilePickerResult? result2;
  String _fileName2="";
  PlatformFile? pickedfile2;
  bool isLoading2 = false;
  File? fileToDisplay2;
  FilePickerResult? result3;
  String _fileName3="";
  PlatformFile? pickedfile3;
  bool isLoading3 = false;
  File? fileToDisplay3;
  FilePickerResult? result4;
  String _fileName4="";
  PlatformFile? pickedfile4;
  bool isLoading4 = false;
  File? fileToDisplay4;
  FilePickerResult? result5;
  String _fileName5="";
  PlatformFile? pickedfile5;
  bool isLoading5 = false;
  File? fileToDisplay5;
  FilePickerResult? result6;
  String _fileName6="";
  PlatformFile? pickedfile6;
  bool isLoading6 = false;
  File? fileToDisplay6;
  FilePickerResult? result7;
  String _fileName7="";
  PlatformFile? pickedfile7;
  bool isLoading7 = false;
  File? fileToDisplay7;
  FilePickerResult? result8;
  String _fileName8="";
  PlatformFile? pickedfile8;
  bool isLoading8 = false;
  File? fileToDisplay8;
  FilePickerResult? result9;
  String _fileName9="";
  PlatformFile? pickedfile9;
  bool isLoading9 = false;
  File? fileToDisplay9;
  FilePickerResult? result10;
  String _fileName10="";
  PlatformFile? pickedfile10;
  bool isLoading10 = false;
  File? fileToDisplay10;
  FilePickerResult? result11;
  String _fileName11="";
  PlatformFile? pickedfile11;
  bool isLoading11 = false;
  File? fileToDisplay11;
  FilePickerResult? result12;
  String _fileName12="";
  PlatformFile? pickedfile12;
  bool isLoading12 = false;
  File? fileToDisplay12;

  String _errorMessage = '';

  Future education() async {
    var url = "http://192.168.1.106/handinhand/attachments.php";
    var response = await http.post(Uri.parse(url), body: {
      "id": idglo,
      "idcard": _fileName1,
      "hightranscript": _fileName2,
      "studentcard": _fileName3,
      "lastsemtranscript": _fileName4,
      "stucertificate": _fileName5,
      "fatheridandfammem": _fileName12,
      "medicalreport": _fileName6,
      "socialafairs": _fileName7,
      "legalforhouserented": _fileName8,
      "salaryslip": _fileName9,
      "deathcertificate": _fileName10,
      "stufamuni": _fileName11
    });
    var data;
    if(response.body.isNotEmpty) {
      data = await json.decode(response.body);
    }
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Saved",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: "Not Saved!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  void pickFile1() async {
    try {
      setState(() {
        isLoading1 = true;
      });
      result1 = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result1 != null) {
        _fileName1 = result1!.files.first.name;
        pickedfile1 = result1!.files.first;
        fileToDisplay1 = File(pickedfile1!.path.toString());

        print("File name $_fileName1");
      }
      setState(() {
        isLoading1 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void pickFile2() async {
    try {
      setState(() {
        isLoading2 = true;
      });
      result2 = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result2 != null) {
        _fileName2 = result2!.files.first.name;
        pickedfile2 = result2!.files.first;
        fileToDisplay2 = File(pickedfile2!.path.toString());

        print("File name $_fileName2");
      }
      setState(() {
        isLoading2 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void pickFile3() async {
    try {
      setState(() {
        isLoading3 = true;
      });
      result3 = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result3 != null) {
        _fileName3 = result3!.files.first.name;
        pickedfile3 = result3!.files.first;
        fileToDisplay3 = File(pickedfile3!.path.toString());

        print("File name $_fileName3");
      }
      setState(() {
        isLoading3 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void pickFile4() async {
    try {
      setState(() {
        isLoading4 = true;
      });
      result4 = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result4 != null) {
        _fileName4 = result4!.files.first.name;
        pickedfile4 = result4!.files.first;
        fileToDisplay4 = File(pickedfile4!.path.toString());

        print("File name $_fileName4");
      }
      setState(() {
        isLoading4 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void pickFile5() async {
    try {
      setState(() {
        isLoading5 = true;
      });
      result5 = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result5 != null) {
        _fileName5 = result5!.files.first.name;
        pickedfile5 = result5!.files.first;
        fileToDisplay5 = File(pickedfile5!.path.toString());

        print("File name $_fileName5");
      }
      setState(() {
        isLoading5 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void pickFile6() async {
    try {
      setState(() {
        isLoading6 = true;
      });
      result6 = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result6 != null) {
        _fileName6 = result6!.files.first.name;
        pickedfile6 = result6!.files.first;
        fileToDisplay6 = File(pickedfile6!.path.toString());

        print("File name $_fileName6");
      }
      setState(() {
        isLoading6 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void pickFile7() async {
    try {
      setState(() {
        isLoading7 = true;
      });
      result7 = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result7 != null) {
        _fileName7 = result7!.files.first.name;
        pickedfile7 = result7!.files.first;
        fileToDisplay7 = File(pickedfile7!.path.toString());

        print("File name $_fileName7");
      }
      setState(() {
        isLoading7 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void pickFile8() async {
    try {
      setState(() {
        isLoading8 = true;
      });
      result8 = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result8 != null) {
        _fileName8 = result8!.files.first.name;
        pickedfile8 = result8!.files.first;
        fileToDisplay8 = File(pickedfile8!.path.toString());

        print("File name $_fileName8");
      }
      setState(() {
        isLoading8 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void pickFile9() async {
    try {
      setState(() {
        isLoading9 = true;
      });
      result9 = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result9 != null) {
        _fileName9 = result9!.files.first.name;
        pickedfile9 = result9!.files.first;
        fileToDisplay9 = File(pickedfile9!.path.toString());

        print("File name $_fileName9");
      }
      setState(() {
        isLoading9 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void pickFile10() async {
    try {
      setState(() {
        isLoading10 = true;
      });
      result10 = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result10 != null) {
        _fileName10 = result10!.files.first.name;
        pickedfile10 = result10!.files.first;
        fileToDisplay10 = File(pickedfile10!.path.toString());

        print("File name $_fileName10");
      }
      setState(() {
        isLoading10 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void pickFile11() async {
    try {
      setState(() {
        isLoading11 = true;
      });
      result11 = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result11 != null) {
        _fileName11 = result11!.files.first.name;
        pickedfile11 = result11!.files.first;
        fileToDisplay11 = File(pickedfile11!.path.toString());

        print("File name $_fileName11");
      }
      setState(() {
        isLoading11 = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void pickFile12() async {
    try {
      setState(() {
        isLoading12 = true;
      });
      result12 = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result12 != null) {
        _fileName12 = result12!.files.first.name;
        pickedfile12 = result12!.files.first;
        fileToDisplay12 = File(pickedfile12!.path.toString());

        print("File name $_fileName12");
      }
      setState(() {
        isLoading12 = false;
      });
    } catch (e) {
      print(e);
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
            //alignment: Alignment.topLeft,
            child: Text(
              "ID Card:".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: isLoading1
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      pickFile1();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.purple,
                        ),
                        Text(
                          "Pick File".tr,
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                        ),
                      ],
                    )),
          ),
          if (pickedfile1 != null)
            SizedBox(
              height: 300,
              width: 400,
              child: Image.file(fileToDisplay1!),
            ),
          SizedBox(
            height: 15,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "High school transcripts:".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: isLoading2
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      pickFile2();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.purple,
                        ),
                        Text(
                          "Pick File".tr,
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                        ),
                      ],
                    )),
          ),
          if (pickedfile2 != null)
            SizedBox(
              height: 300,
              width: 400,
              child: Image.file(fileToDisplay2!),
            ),
          SizedBox(
            height: 15,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "Student Card:".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: isLoading3
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      pickFile3();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.purple,
                        ),
                        Text(
                          "Pick File".tr,
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                        ),
                      ],
                    )),
          ),
          if (pickedfile3 != null)
            SizedBox(
              height: 300,
              width: 400,
              child: Image.file(fileToDisplay3!),
            ),
          SizedBox(
            height: 15,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "Transcript for the last semester:".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: isLoading4
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      pickFile4();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.purple,
                        ),
                        Text(
                          "Pick File".tr,
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                        ),
                      ],
                    )),
          ),
          if (pickedfile4 != null)
            SizedBox(
              height: 300,
              width: 400,
              child: Image.file(fileToDisplay4!),
            ),
            SizedBox(
            height: 15,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "t7_a".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: isLoading12
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      pickFile12();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.purple,
                        ),
                        Text(
                          "Pick File".tr,
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                        ),
                      ],
                    )),
          ),
          if (pickedfile12 != null)
            SizedBox(
              height: 300,
              width: 400,
              child: Image.file(fileToDisplay12!),
            ),
          SizedBox(
            height: 15,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "ID card of the head of the family, showing the family members:"
                  .tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: isLoading5
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      pickFile5();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.purple,
                        ),
                        Text(
                          "Pick File".tr,
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                        ),
                      ],
                    )),
          ),
          if (pickedfile5 != null)
            SizedBox(
              height: 300,
              width: 400,
              child: Image.file(fileToDisplay5!),
            ),
          SizedBox(
            height: 15,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "t1_a".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: isLoading6
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      pickFile6();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.purple,
                        ),
                        Text(
                          "Pick File".tr,
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                        ),
                      ],
                    )),
          ),
          if (pickedfile6 != null)
            SizedBox(
              height: 300,
              width: 400,
              child: Image.file(fileToDisplay6!),
            ),
          SizedBox(
            height: 15,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "t2_a".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: isLoading7
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      pickFile7();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.purple,
                        ),
                        Text(
                          "Pick File".tr,
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                        ),
                      ],
                    )),
          ),
          if (pickedfile7 != null)
            SizedBox(
              height: 300,
              width: 400,
              child: Image.file(fileToDisplay7!),
            ),
          SizedBox(
            height: 15,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "t3_a".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: isLoading8
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      pickFile8();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.purple,
                        ),
                        Text(
                          "Pick File".tr,
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                        ),
                      ],
                    )),
          ),
          if (pickedfile8 != null)
            SizedBox(
              height: 300,
              width: 400,
              child: Image.file(fileToDisplay8!),
            ),
          SizedBox(
            height: 15,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "t4_a".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: isLoading9
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      pickFile9();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.purple,
                        ),
                        Text(
                          "Pick File".tr,
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                        ),
                      ],
                    )),
          ),
          if (pickedfile9 != null)
            SizedBox(
              height: 300,
              width: 400,
              child: Image.file(fileToDisplay9!),
            ),
          SizedBox(
            height: 15,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "t5_a".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: isLoading10
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      pickFile10();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.purple,
                        ),
                        Text(
                          "Pick File".tr,
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                        ),
                      ],
                    )),
          ),
          if (pickedfile10 != null)
            SizedBox(
              height: 300,
              width: 400,
              child: Image.file(fileToDisplay10!),
            ),
          SizedBox(
            height: 15,
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: Text(
              "t6_a".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
            //alignment: Alignment.topLeft,
            child: isLoading11
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      pickFile11();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Colors.purple,
                        ),
                        Text(
                          "Pick File".tr,
                          style: TextStyle(color: Colors.purple, fontSize: 20),
                        ),
                      ],
                    )),
          ),
          if (pickedfile11 != null)
            SizedBox(
              height: 300,
              width: 400,
              child: Image.file(fileToDisplay11!),
            ),
          SizedBox(
            height: 15,
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
                onPressed: (() {
                  education();
                }),
                child: Text(
                  "Save".tr,
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
