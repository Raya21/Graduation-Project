import 'dart:io';
import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:index/creditional.dart';
import 'package:index/sqldb.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

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
  void initState() {
    super.initState();
    emailglo = widget.value;
  }

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
          print(emailglo);
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
  SqlDb sqlDb = SqlDb();
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
  bool isLoading = true;

  Future getData() async {
    idglo = id.text;
    final result = await sqlDb.readData(
        "SELECT COUNT(*)  FROM 'person_info' WHERE `email`='${emailglo}'");
    final count = Sqflite.firstIntValue(result);

    if (count == 1) {
      List<Map> response = await sqlDb
          .readData("SELECT * FROM 'person_info' WHERE `email`='${emailglo}'");
      isLoading = false;
      if (this.mounted) {
        setState(() {
          fname.text = response[0]["fname"];
          id.text = response[0]["id"].toString();
          bdate.text = response[0]["birthdate"].toString();
          birthplace.text = response[0]["birthplace"];
          city.text = response[0]["city"];
          selectedIncome = response[0]["income"];
          selectedGender = response[0]["gender"];
          selectedSS = response[0]["socialstatus"];
          //Tphone.text = response[0]["tphone"].toString();
          // Mphone.text = response[0]["mphone"].toString();
        });
      }
    }
  }

  Future person() async {
    idglo = id.text;
    var url = "http://" + IPADDRESS + "/handinhand/personInfo.php";
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
    getData();
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
                style: TextStyle(fontSize: 20),
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
                style: TextStyle(fontSize: 20),
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
                  style: TextStyle(fontSize: 20),
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
                          width: 2,
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
                          width: 2,
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
                          width: 2,
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
                    onPressed: () async {
                      //await sqlDb.mydeleteDatabase();
                     idglo = id.text;

                      final result = await sqlDb.readData(
                          "SELECT COUNT(*)  FROM 'person_info' WHERE `email`='${emailglo}'");
                      final count = Sqflite.firstIntValue(result);
                      if (count == 0) {
                        int response = await sqlDb.insertData('''
                       INSERT INTO person_info (
                        `id`,
                        `email`,
                        `fname`,
                        `birthdate`,
                        `birthplace`,
                        `city`,
                        `income`,
                        `gender`,
                        `socialstatus`
                        )
                       VALUES (
                        ${idglo},
                       "${emailglo}",
                       "${fname.text}",
                       "${bdate.text}",
                       "${birthplace.text}",
                       "${city.text}",
                       "${selectedIncome}",
                       "${selectedGender}",
                       "${selectedSS}"
                        )
                       ''');
                      } else {
                        int response = await sqlDb.updateData('''
                            UPDATE person_info SET
                        id= ${idglo},
                        email="${emailglo}",
                        fname="${fname.text}",
                        birthdate="${bdate.text}",
                        birthplace="${birthplace.text}",
                        city= "${city.text}",
                        income="${selectedIncome}",
                        gender="${selectedGender}",
                        socialstatus="${selectedSS}"
                            WHERE `email`="${emailglo}"
                            ''');
                      }

                      List<Map> response =
                          await sqlDb.readData("SELECT * FROM 'person_info'");

                      print(count);
                      print("$response");
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
  SqlDb sqlDb = SqlDb();
  final _formKey2 = GlobalKey<FormState>();
  TextEditingController Tphone = TextEditingController();
  TextEditingController Mphone = TextEditingController();
  String _errorMessage = '';

  bool isLoading = true;

  Future getData() async {
    final result = await sqlDb.readData(
        "SELECT COUNT(*)  FROM 'contact_info' WHERE `email`='${emailglo}'");
    final count = Sqflite.firstIntValue(result);

    if (count == 1) {
      List<Map> response = await sqlDb
          .readData("SELECT * FROM 'contact_info' WHERE `email`='${emailglo}'");
      isLoading = false;
      if (this.mounted) {
        setState(() {
          Tphone.text = response[0]["tphone"].toString();
          Mphone.text = response[0]["mphone"].toString();
        });
      }
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future contact() async {
    print(emailglo);
    print(Tphone.text);
    print(Mphone.text);
    var url = "http://" + IPADDRESS + "/handinhand/contactInfo.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": emailglo,
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
              style: TextStyle(fontSize: 20),
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
                  onPressed: () async {
                    var studentidcard;
                    //await sqlDb.mydeleteDatabase();
                    final _studentIdCard = await sqlDb.readData(
                        "SELECT COUNT(*)  FROM 'person_info' WHERE `email`='${emailglo}'");
                    final countt = Sqflite.firstIntValue(_studentIdCard);

                    if (countt == 1) {
                      List<Map> response = await sqlDb.readData(
                          "SELECT * FROM 'person_info' WHERE `email`='${emailglo}'");
                      studentidcard = response[0]["id"].toString();
                    }
                    final result = await sqlDb.readData(
                        "SELECT COUNT(*)  FROM 'contact_info' WHERE `email`='${emailglo}'");
                    final count = Sqflite.firstIntValue(result);
                    if (count == 0) {
                      int response = await sqlDb.insertData('''
                     INSERT INTO contact_info (
                      `id` ,
                      `tphone`,
                      `mphone`,
                      `email`
                      )
                     VALUES (
                      ${studentidcard},
                     "${Tphone.text}",
                     "${Mphone.text}",
                     "${emailglo}"
                      )
                     ''');
                    } else {
                      int response = await sqlDb.updateData('''
                          UPDATE contact_info SET
                          id = ${studentidcard},
                          tphone = "${Tphone.text}",
                          mphone = "${Mphone.text}",
                          email="${emailglo}"
                          WHERE `email`="${emailglo}"
                          ''');
                    }

                    List<Map> response =
                        await sqlDb.readData("SELECT * FROM 'contact_info'");

                    print(count);
                    print("$response");

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
  SqlDb sqlDb = SqlDb();
  final _formKey3 = GlobalKey<FormState>();
  String selectedBranch = "Study branch".tr;
  String selectedDegree = "Undergraduate degree".tr;
  String selectedYear = "Academic year".tr;
  String selectedUni = "University".tr;
  String selectedCollege = "College".tr;
  TextEditingController yearofEn = TextEditingController();
  TextEditingController schoolcon = TextEditingController();
  TextEditingController gradecon = TextEditingController();
  TextEditingController dep = TextEditingController();
  TextEditingController gpacon = TextEditingController();
  TextEditingController uniid = TextEditingController();
  TextEditingController yearofEnUni = TextEditingController();
  String _errorMessage = '';
  bool isLoading = true;

  Future getData() async {
    final result = await sqlDb.readData(
        "SELECT COUNT(*)  FROM 'edu_info' WHERE `email`='${emailglo}'");
    final count = Sqflite.firstIntValue(result);

    if (count == 1) {
      List<Map> response = await sqlDb
          .readData("SELECT * FROM 'edu_info' WHERE `email`='${emailglo}'");
      isLoading = false;
      if (this.mounted) {
        setState(() {
          yearofEn.text = response[0]["uniyoe"].toString();
          schoolcon.text = response[0]["school"];
          gradecon.text = response[0]["grade"].toString();
          selectedBranch = response[0]["branch"].toString();
          selectedDegree = response[0]["unidegree"];

          selectedUni = response[0]["university"];
          selectedCollege = response[0]["college"];
          dep.text = response[0]["department"];

          selectedYear = response[0]["academicyear"];
          gpacon.text = response[0]["gpa"].toString();
          uniid.text = response[0]["uniid"].toString();
          yearofEnUni.text = response[0]["uniyoe"].toString();
        });
      }
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future education() async {
    var url = "http://" + IPADDRESS + "/handinhand/eduInfo.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": emailglo,
      "yearofEn": yearofEn.text,
      "school": schoolcon.text,
      "grade": gradecon.text,
      "university": selectedUni,
      "college": selectedCollege,
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

  Future JoinToDonors() async {
    try {
      var url = "http://" + IPADDRESS + "/handinhand/jointodonors.php";
      var response = await http.post(Uri.parse(url), body: {
        "email": emailglo,
      });
      var data = await json.decode(response.body);
      if (data == "Success") {
        Fluttertoast.showToast(
            msg: "Joined successfully".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 203, 158, 211),
            textColor: Colors.purple,
            fontSize: 16);
      } else {
        Fluttertoast.showToast(
            msg: "Join Failed! You should fill your profile info. fisrt".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
      }
    } catch (e) {
      print(e.toString());
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
                style: TextStyle(fontSize: 20),
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
                style: TextStyle(fontSize: 20),
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
                style: TextStyle(fontSize: 20),
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
                          width: 2,
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
                          width: 2,
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
              Align(
                //alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20)),
                  child: DropdownButton(
                    isExpanded: true,
                    items: [
                      "University".tr,
                      "Al-Quds University".tr,
                      "Birzeit University".tr,
                      "An-Najah National University".tr,
                      "Palestine Polytechnic University".tr,
                      "Khalel university".tr,
                      "Bethlehem University".tr,
                      "University College of Educational Sciences - Teachers' House"
                          .tr,
                      "Palestine Technical University - Kadoorie".tr,
                      "Arab American University - Jenin".tr,
                      "Al-Istiqlal University".tr,
                      "Ibn Sina College of Health Sciences".tr,
                      "Bethlehem Bible College - Technical and Vocational Education and Training"
                          .tr,
                      "Palestine Technical College - Al-Arroub".tr,
                      "Palestine Technical College - Ramallah".tr,
                      "Wajdi Nihad Abu Gharbia University College of Technology"
                          .tr,
                      "Palestine Ahliya University".tr,
                      "Al-Hajjah Andalib Al-Amad College of Nursing and Midwifery"
                          .tr,
                      "Hebron College of Nursing".tr,
                      "Abrahamic Community College".tr,
                      "Talitha National Community College".tr,
                      "Dar Al-Kalima University College of Arts and Culture".tr,
                      "Al-Quds Open University".tr,
                      "Islamic Call College - Qalqilya".tr,
                      "Faculty of Nursing, Makassed Association".tr,
                      "Family Revival College - Vocational and Technical Education and Training"
                          .tr,
                      "Caritas College of Nursing".tr,
                      "Rawda College for Professional Sciences".tr,
                      "Islamic University".tr,
                      "Al Azhar university".tr,
                      "Gaza University".tr,
                      "Al-Aqsa University".tr,
                      "Palestine University".tr,
                      "Al-Zaytoonah University of Science and Technology".tr
                    ]
                        .map((e) => DropdownMenuItem(
                              child: Text("$e", style: TextStyle(fontSize: 17)),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedUni = val!;
                      });
                    },
                    value: selectedUni,
                  ),
                ),
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
              Align(
                //alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20)),
                  child: DropdownButton(
                    isExpanded: true,
                    items: [
                      "College".tr,
                      "Business school".tr,
                      "Faculty of Educational Sciences".tr,
                      "faculty of Pharmacy".tr,
                      "Advocacy College".tr,
                      "College of Engineering".tr,
                      "Faculty of Dentistry".tr,
                      "College of Health Professions".tr,
                      "Al-Quds College- Bard".tr,
                      "College of Quran and Islamic Studies".tr,
                      "College of Dual Studies".tr,
                      "Hind Al Husseini College".tr,
                      "College of Literature".tr,
                      "College of Public Health".tr,
                      "College of Human Medicine".tr,
                      "College of Science".tr,
                      "College of Agriculture and Veterinary Medicine".tr,
                      "Hisham Hijjawi College".tr,
                      "College of Sharia".tr,
                      "Faculty of Medicine and Health Sciences".tr,
                      "College of Fine Arts".tr,
                      "College of Commerce and Economics".tr,
                      "College of Law and Public Administration".tr,
                      "Faculty of Education".tr,
                      "College of Administrative Sciences and Information Systems"
                          .tr,
                      "College of Information Technology".tr,
                      "College of Applied Professions".tr,
                      "College of Finance and Administration".tr,
                      "Graduate School".tr,
                      "Institute of Hotel and Tourism Management".tr,
                      "College of Media".tr,
                    ]
                        .map((e) => DropdownMenuItem(
                              child: Text("$e", style: TextStyle(fontSize: 17)),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedCollege = val!;
                      });
                    },
                    value: selectedCollege,
                  ),
                ),
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
                style: TextStyle(fontSize: 20),
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
                          width: 2,
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
                style: TextStyle(fontSize: 20),
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
                style: TextStyle(fontSize: 20),
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
                    onPressed: () async {
                      var studentidcard;
                      //await sqlDb.mydeleteDatabase();
                      final _studentIdCard = await sqlDb.readData(
                          "SELECT COUNT(*)  FROM 'person_info' WHERE `email`='${emailglo}'");
                      final countt = Sqflite.firstIntValue(_studentIdCard);

                      if (countt == 1) {
                        List<Map> response = await sqlDb.readData(
                            "SELECT * FROM 'person_info' WHERE `email`='${emailglo}'");
                        studentidcard = response[0]["id"].toString();
                      }
                      final result = await sqlDb.readData(
                          "SELECT COUNT(*)  FROM 'edu_info' WHERE `email`='${emailglo}'");
                      final count = Sqflite.firstIntValue(result);
                      if (count == 0) {
                        int response = await sqlDb.insertData('''
                     INSERT INTO edu_info (
                      `id`,
                      `schoolyoe`,
                      `school`,
                      `grade`,
                      `branch`,
                      `unidegree`,
                      `university`,
                      `college`,
                      `department`,
                      `academicyear`,
                      `gpa`,
                      `uniid`,
                      `uniyoe`,
                      `email`
                      )
                     VALUES (
                      ${studentidcard},
                     "${yearofEn.text}",
                     "${schoolcon.text}",
                     "${gradecon.text}",
                     "${selectedBranch}",
                     "${selectedDegree}",
                     "${selectedUni}",
                     "${selectedCollege}",
                     "${dep.text}",
                     "${selectedYear}",
                     "${gpacon.text}",
                     "${uniid.text}",
                     "${yearofEnUni.text}",
                     "${emailglo}"
                      )
                     ''');
                      } else {
                        int response = await sqlDb.updateData('''
                          UPDATE edu_info SET
                      id= ${studentidcard},
                      schoolyoe="${yearofEn.text}",
                      school="${schoolcon.text}",
                      grade="${gradecon.text}",
                      branch="${selectedBranch}",
                      unidegree="${selectedDegree}",
                      university="${selectedUni}",
                      college="${selectedCollege}",
                      department="${dep.text}",
                      academicyear="${selectedYear}",
                      gpa="${gpacon.text}",
                      uniid="${uniid.text}",
                      uniyoe="${yearofEnUni.text}",
                      email="${emailglo}"
                      WHERE `email`="${emailglo}"
                          ''');
                      }

                      List<Map> response =
                          await sqlDb.readData("SELECT * FROM 'edu_info'");

                      print(count);
                      print("$response");
                      education();
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
                      JoinToDonors();
                    },
                    child: Text(
                      "Join to donors".tr,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        )));
  }
}
