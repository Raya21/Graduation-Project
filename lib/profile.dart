import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

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
        backgroundColor: Theme.of(context).primaryColor,
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
        backgroundColor: Theme.of(context).primaryColor,
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
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone),
              label: "Contact Info".tr,
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.cast_for_education),
              label: "Educational Info".tr,
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.attachment),
              label: "Attachments".tr,
              backgroundColor: Theme.of(context).primaryColor),
        ],
      ),
      body: pages.elementAt(_currentIndex),
    );
  }
}

class personInfo extends StatefulWidget {
  const personInfo({super.key});

  @override
  State<personInfo> createState() => _personInfoState();
}

class _personInfoState extends State<personInfo> {
  String selectedIncome = "-";
  String selectedGender = "Male";
  String selectedSS = "Single";
  TextEditingController fname = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController birthplace = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController bdate = TextEditingController();
  String _errorMessage = '';

  Future person() async {
    var url = "http://192.168.0.112/handinhand/person.php";
    var response = await http.post(Uri.parse(url), body: {
      "fname": fname.text,
      "id": id.text,
      "birthdate": bdate.text,
      "birthplace": birthplace.text,
      "city": city.text,
      "income": selectedIncome,
      "Gender": selectedGender,
      "socialstatus": selectedSS
    });
    var data = await json.decode(json.encode(response.body));
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Personal Information".tr,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              height: 20,
              thickness: 2,
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "Full Name:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: fname,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "ID:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: id,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "Birth Date:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: TextFormField(
                controller: bdate,
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
                        borderSide: BorderSide(color: Colors.purple)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple))),
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
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "Birth Place:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: birthplace,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "City:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: city,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "Average Income:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.purple,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(5)),
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
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "Gender:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.purple,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton(
                  items: ["Male", "Female"]
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
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "Social Status:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.purple,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton(
                  items: ["Single", "Married"]
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
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    person();
                  },
                  child: Text(
                    "Save".tr,
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class contactInfo extends StatefulWidget {
  const contactInfo({super.key});

  @override
  State<contactInfo> createState() => _contactInfoState();
}

class _contactInfoState extends State<contactInfo> {
  TextEditingController Tphone = TextEditingController();
  TextEditingController Mphone = TextEditingController();
  String _errorMessage = '';

  Future contact() async {
    var url = "http://192.168.0.112/handinhand/contactInfo.php";
    var response = await http.post(Uri.parse(url), body: {
      "TPhone": Tphone.text,
      "MPhone": Mphone.text,
    });
    var data = await json.decode(json.encode(response.body));
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
          msg: "Not Saved",
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Container(
            //alignment: Alignment.topLeft,
            child: Text(
              "Telephone Number:".tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: Tphone,
            cursorColor: Colors.purple,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple))),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            //alignment: Alignment.topLeft,
            child: Text(
              "Mobile Phone Number:".tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: Mphone,
            cursorColor: Colors.purple,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple))),
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
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  contact();
                },
                child: Text(
                  "Save".tr,
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      )),
    );
  }
}

class eduInfo extends StatefulWidget {
  const eduInfo({super.key});

  @override
  State<eduInfo> createState() => _eduInfoState();
}

class _eduInfoState extends State<eduInfo> {
  String selectedBranch = "Study branch";
  String selectedDegree = "Undergraduate degree";
  String selectedYear = "Academic year";
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
    var url = "http://192.168.0.112/handinhand/education.php";
    var response = await http.post(Uri.parse(url), body: {
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
    var data = await json.decode(json.encode(response.body));
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

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Education Information".tr,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
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
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "Year of enrollment:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: yearofEn,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "School:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: schoolcon,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "Grade:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: gradecon,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "Study Branch:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.purple,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton(
                  items: [
                    "Study branch",
                    "scientific",
                    "literary",
                    "commercial",
                    "Industrial"
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
            Container(
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
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "Undergraduate degree:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.purple,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(5)),
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
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "University:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: uni,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "College:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: collegecon,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "Department:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: dep,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              // alignment: Alignment.topLeft,
              child: Text(
                "Academic Year:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.purple,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton(
                  items: [
                    "Academic year",
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
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "GPA:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: gpacon,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "University ID:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: uniid,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              //alignment: Alignment.topLeft,
              child: Text(
                "Year of enrollment:".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: yearofEnUni,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple))),
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
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    education();
                  },
                  child: Text(
                    "Save".tr,
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
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
  String? _fileName1;
  PlatformFile? pickedfile1;
  bool isLoading1 = false;
  File? fileToDisplay1;
  FilePickerResult? result2;
  String? _fileName2;
  PlatformFile? pickedfile2;
  bool isLoading2 = false;
  File? fileToDisplay2;
  FilePickerResult? result3;
  String? _fileName3;
  PlatformFile? pickedfile3;
  bool isLoading3 = false;
  File? fileToDisplay3;
  FilePickerResult? result4;
  String? _fileName4;
  PlatformFile? pickedfile4;
  bool isLoading4 = false;
  File? fileToDisplay4;

  String _errorMessage = '';

  Future education() async {
    var url = "http://192.168.0.112/handinhand/attachments.php";
    var response = await http.post(Uri.parse(url), body: {
      "idcard": _fileName1,
      "hightranscript": _fileName2,
      "studentcard": _fileName3,
      "lastsemtranscript": _fileName4,
    });
    var data = await json.decode(json.encode(response.body));
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Container(
            //alignment: Alignment.topLeft,
            child: Text(
              "ID Card:".tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
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
          Container(
            //alignment: Alignment.topLeft,
            child: Text(
              "High school transcripts:".tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
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
          Container(
            //alignment: Alignment.topLeft,
            child: Text(
              "Student Card:".tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
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
          Container(
            //alignment: Alignment.topLeft,
            child: Text(
              "Transcript for the last semester:".tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
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
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: (() {
                  education();
                }),
                child: Text(
                  "Save".tr,
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      )),
    );
  }
}
