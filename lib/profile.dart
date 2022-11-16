import 'dart:io';
import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

late String idglo;
late String emailglo;

class profile extends StatefulWidget {
  final String value;
  //const profile({super.key});
   const profile({Key? key, required this.value}) : super(key: key);
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  var x = "alignment".tr;
  int _currentIndex = 0;
  List<Widget> pages = [personInfo(), contactInfo(), eduInfo()];
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
        onTap: (val) {
          setState(() {
            _currentIndex = val;
            emailglo = widget.value;
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
    var url = "http://192.168.1.105/handinhand/personInfo.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": emailglo,
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
          msg: "Saved".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: "Updated!".tr,
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
    var url = "http://192.168.1.109/handinhand/contactInfo.php";
    var response = await http.post(Uri.parse(url), body: {
      "id": idglo,
      "TPhone": Tphone.text,
      "MPhone": Mphone.text,
    });
    var data = await json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Saved".tr,
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
    var url = "http://192.168.1.109/handinhand/eduInfo.php";
    var response = await http.post(Uri.parse(url), body: {
      "id": idglo,
      "email": emailglo,
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
          msg: "Saved".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: "Updated!".tr,
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

