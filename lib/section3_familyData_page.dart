import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:index/sqldb.dart';
import 'package:sqflite/sqflite.dart';

class Section3 extends StatefulWidget {
  final int userId;

  const Section3({super.key, required this.userId});

  @override
  State<Section3> createState() => _Section3State();
}

class _Section3State extends State<Section3> {
  var uId;
  SqlDb sqlDb = SqlDb();
  bool _isVisible = false;
  late int _count;
  late String _result;
  String StudentName = '';
  String RegistrationNumber = '0';
  String CollegeName = '';
  String UniversityName = '';
  late List<Map<String, dynamic>> _values;
  // var userId;

  var selectedItem = null;
  var x = Colors.pink;

  var familyIncome = null;
  var familyAssistance = null;
  var familyHousing = null;

  var monthlyRent = null;
  var familyResidence = null;
  var smoke = null;

  final numFamilyMem = TextEditingController();
  final numUniversityStu = TextEditingController();

  final numMemDiseases = TextEditingController();

  final cardNumber = TextEditingController();
  final numPrivate = TextEditingController();
  final numPublic = TextEditingController();
  final numCommercial = TextEditingController();
  final studentHousingFee = TextEditingController();

  bool isLoading = true;

  Map<String, TextEditingController> _StudentName = {};
  h() {
    for (int i = 0; i < 75; i++) {
      _StudentName.addAll({"$i $uId": TextEditingController()});
    }

    // setState(() {
    //   _StudentName['1 $uId']!.text = "kkk";
    // });
  }

  //  h2(String i) {

  //     _StudentName.addAll({"$i $uId": TextEditingController()});

  //   // setState(() {
  //   //   _StudentName['1 $uId']!.text = "kkk";
  //   // });
  // }

  Future getData() async {
    final result = await sqlDb.readData(
        "SELECT COUNT(*)  FROM 'familydatas3' WHERE `userId`=${widget.userId}");
    final count = Sqflite.firstIntValue(result);

    if (count == 1) {
      List<Map> response = await sqlDb.readData(
          "SELECT * FROM 'familydatas3' WHERE `userId`=${widget.userId}");
      isLoading = false;
      if (this.mounted) {
        setState(() {
          numFamilyMem.text = response[0]["numFamilyMem"].toString();
          numUniversityStu.text = response[0]["numUniversityStu"].toString();
          _count = response[0]["numUniversityStu"];

          if (_count > 0) {
            _isVisible = true;
          } else {
            _isVisible = false;
          }

          numMemDiseases.text = response[0]["numMemDiseases"].toString();
          familyIncome = response[0]["familyIncome"];
          familyAssistance = response[0]["familyAssistance"];
          cardNumber.text = response[0]["cardNumber"].toString();
          familyHousing = response[0]["familyHousing"];
          monthlyRent = response[0]["monthlyRent"];
          familyResidence = response[0]["familyResidence"];
          numPrivate.text = response[0]["numPrivate"].toString();
          numPublic.text = response[0]["numPublic"].toString();
          numCommercial.text = response[0]["numCommercial"].toString();
          studentHousingFee.text = response[0]["studentHousingFee"].toString();
          smoke = response[0]["smoke"];
        });
      }
    }

    final result2 = await sqlDb.readData(
        "SELECT COUNT(*)  FROM 'brothersdata' WHERE `userId`=${widget.userId}");
    final count2 = Sqflite.firstIntValue(result2);
    if (count2 != Null) {
      List<Map> response = await sqlDb.readData(
          "SELECT * FROM 'brothersdata' WHERE `userId`=${widget.userId}");
      setState(() {
        for (int bId = 0; bId < count2!; bId++) {
          _StudentName['$bId $uId']!.text = response[bId]["StudentName"];
        }
      });
    }
  }

  // List<TextEditingController> _controller = [];
  // h() {
  //   for (int i = 1; i < 75; i++) _controller.add(TextEditingController());
  //   setState(() {
  //     _controller[1].text = "kkk";
  //   });
  // }

  @override
  void initState() {
    uId = widget.userId;
    h();
    _result = '';
    _count = 0;
    _values = [];

    getData();
    super.initState();
  }

  Future save() async {
    var url = "http://192.168.1.10/handinhand/familydatas3.php";
    var response = await http.post(Uri.parse(url), body: {
      "BrothersData": _result,
      "userId": widget.userId.toString(),
      "numFamilyMem": numFamilyMem.text,
      "numMemDiseases": numMemDiseases.text,
      "familyIncome": familyIncome,
      "familyAssistance": familyAssistance,
      "cardNumber": cardNumber.text,
      "familyHousing": familyHousing,
      "monthlyRent": monthlyRent,
      "familyResidence": familyResidence,
      "numPrivate": numPrivate.text,
      "numPublic": numPublic.text,
      "numCommercial": numCommercial.text,
      "studentHousingFee": studentHousingFee.text,
      "smoke": smoke,
      "numUniversityStu": numUniversityStu.text
    });
    var data = await json.decode(response.body);
    print(data);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Saved".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
    } else if (data == "Updated") {
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
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "family members".tr,
                  style: TextStyle(fontSize: 19),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    onChanged: (val) {},
                    controller: numFamilyMem,
                    cursorColor: Colors.purple,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "university students".tr,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    onChanged: (val) {
                      // familyDataS3.write('numUniversityStu', val);
                      if (val != null) {
                        setState(() {
                          _count = int.parse(val);
                          if (_count > 0) {
                            _isVisible = true;
                          } else {
                            _isVisible = false;
                          }
                        });
                      }
                    },
                    controller: numUniversityStu,
                    cursorColor: Colors.purple,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "chronic diseases".tr,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    onChanged: (val) {},
                    controller: numMemDiseases,
                    cursorColor: Colors.purple,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Family income".tr,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 200,
                  child: DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: [
                      "------------",
                      "0 - 2000",
                      "2001 - 3000",
                      "3001 - 4000",
                      "4001 - 5000",
                      "5001 - 10000",
                      "Above 10000".tr
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)),
                      ),
                    ),
                    onChanged: (val) {
                      familyIncome = val;
                    },
                    selectedItem: familyIncome,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "assistance".tr,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 100,
                  child: DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: [
                      "Yes".tr,
                      "No".tr,
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)),
                      ),
                    ),
                    onChanged: (val) {
                      familyAssistance = val;
                    },
                    selectedItem: familyAssistance,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "affairs card".tr,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    onChanged: (val) {},
                    controller: cardNumber,
                    cursorColor: Colors.purple,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "family housing".tr,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 400,
                  child: DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: [
                      "Property".tr,
                      "Rent".tr,
                      "Live with another family without paying rent".tr
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)),
                      ),
                    ),
                    onChanged: (val) {
                      familyHousing = val;
                    },
                    selectedItem: familyHousing,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "monthly rent".tr,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 200,
                  child: DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    items: [
                      "-------------------",
                      "0 _ 1000",
                      "1000 _ 2000",
                      "2001 _ 3000",
                      "Above 3000".tr
                    ],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)),
                      ),
                    ),
                    onChanged: (val) {
                      monthlyRent = val;
                    },
                    selectedItem: monthlyRent,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Family residence".tr,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 200,
                  child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: ["City".tr, "Village".tr, "Camp".tr, "Abroad".tr],
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)),
                        ),
                      ),
                      onChanged: (val) {
                        familyResidence = val;
                      },
                      selectedItem: familyResidence),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Text(
              "vehicles".tr,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Private         ".tr,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    onChanged: (val) {},
                    controller: numPrivate,
                    cursorColor: Colors.purple,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Public           ".tr,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    onChanged: (val) {},
                    controller: numPublic,
                    cursorColor: Colors.purple,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Commercial ".tr,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    onChanged: (val) {},
                    controller: numCommercial,
                    cursorColor: Colors.purple,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "student housing".tr,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    onChanged: (val) {},
                    controller: studentHousingFee,
                    cursorColor: Colors.purple,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Do you smoke ?".tr,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 100,
                  child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: ["Yes".tr, "No".tr],
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)),
                        ),
                      ),
                      onChanged: (val) {
                        smoke = val;
                      },
                      selectedItem: smoke),
                )
              ],
            ),
          ),
          Visibility(
            visible: _isVisible,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Text(
                "Undergraduate fraternity data :".tr,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _count,
              itemBuilder: (context, index) {
                // h2(index.toString());
                return _row(index.toString());
              },
            ),
          ),
          Text(_result),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: (() async {
                var studentidcard;
                //await sqlDb.mydeleteDatabase();

                final _studentIdCard = await sqlDb.readData(
                    "SELECT COUNT(*)  FROM 'familydatas1' WHERE `userId`=${widget.userId}");
                final countt = Sqflite.firstIntValue(_studentIdCard);

                if (countt == 1) {
                  List<Map> response = await sqlDb.readData(
                      "SELECT * FROM 'familydatas1' WHERE `userId`=${widget.userId}");
                  studentidcard = response[0]["studentIdCard"].toString();
                }

                final result = await sqlDb.readData(
                    "SELECT COUNT(*)  FROM 'familydatas3' WHERE `userId`=${widget.userId}");
                final count = Sqflite.firstIntValue(result);
                if (count == 0) {
                  int response = await sqlDb.insertData('''
               INSERT INTO familydatas3 (
                `studentIdCard` ,
                `userId`,
                `numFamilyMem`,
                `numMemDiseases`,
                `familyIncome`,
                `familyAssistance`,
                `cardNumber`,
                `familyHousing`,
                `monthlyRent`,
                `familyResidence`,
                `numPrivate`,
                `numPublic`,
                `numCommercial`,
                `studentHousingFee`,
                `smoke`,
                `numUniversityStu`

                )
               VALUES (
                ${studentidcard},
                ${widget.userId},
                "${numFamilyMem.text}",
                "${numMemDiseases.text}",
                "${familyIncome}",
                "${familyAssistance}",
                "${cardNumber.text}",
                "${familyHousing}",

                "${monthlyRent}",
                "${familyResidence}",
                "${numPrivate.text}",
                "${numPublic.text}",
                "${numCommercial.text}",
                "${studentHousingFee.text}",
                "${smoke}",
                "${numUniversityStu.text}"
                )
               ''');
                } else {
                  int response = await sqlDb.updateData('''
                    UPDATE familydatas3 SET
                    studentIdCard = ${studentidcard},
                    userId = ${widget.userId},
                    numFamilyMem = "${numFamilyMem.text}",
                    numMemDiseases = "${numMemDiseases.text}",
                    familyIncome = "${familyIncome}",
                    familyAssistance = "${familyAssistance}",
                    cardNumber = "${cardNumber.text}",
                    familyHousing ="${familyHousing}",

                    monthlyRent="${monthlyRent}",
                    familyResidence="${familyResidence}",
                    numPrivate="${numPrivate.text}",
                    numPublic="${numPublic.text}",
                    numCommercial="${numCommercial.text}",
                    studentHousingFee="${studentHousingFee.text}",
                    smoke="${smoke}",
                    numUniversityStu="${numUniversityStu.text}"



                    WHERE `userId`=${widget.userId}
                    ''');
                }

                List<Map> response =
                    await sqlDb.readData("SELECT * FROM 'familydatas3'");

                print(count);
                print("$response");

                for (int i = 0; i < _count; i++) {
                  var id = _values[i]["id"];
                  final result = await sqlDb.readData(
                      "SELECT COUNT(*)  FROM 'brothersdata' WHERE `userId`=${widget.userId} AND `BrotherId`=${id}");
                  final count = Sqflite.firstIntValue(result);
                  if (count == 0) {
                    int response = await sqlDb.insertData('''
                 INSERT INTO brothersdata (
                  `userId` ,
                  `userIdCard`,
                  `BrotherId`,
                  `StudentName`,
                  `RegistrationNumber`,
                  `CollegeName`,
                  `UniversityName`

                  )
                 VALUES (
                  ${widget.userId},
                  ${studentidcard},
                  "${_values[i]["id"]}",
                  "${_values[i]["StudentName"]}",
                  "${_values[i]["RegistrationNumber"]}",
                  "${_values[i]["CollegeName"]}",
                  "${_values[i]["UniversityName"]}"
                  )
                 ''');
                  } else {
                    int response = await sqlDb.updateData('''
                    UPDATE brothersdata SET
                    userId =  ${widget.userId},
                    userIdCard = ${studentidcard},
                    BrotherId = "${_values[i]["id"]}",
                    StudentName = "${_values[i]["StudentName"]}",
                    RegistrationNumber = "${_values[i]["RegistrationNumber"]}",
                    CollegeName = "${_values[i]["CollegeName"]}",
                    UniversityName =  "${_values[i]["UniversityName"]}"

                    WHERE `userId`=${widget.userId} AND `BrotherId`=${id}
                    ''');
                  }
                }

                List<Map> response2 =
                    await sqlDb.readData("SELECT * FROM 'brothersdata'");

                print("$response2");
                save();
                // _count++;
              }),
              child: Text(
                "Save data".tr,
                style: TextStyle(fontSize: 20),
              )),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  _row(String key) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Student #".tr + "$key",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _StudentName['$key $uId'],
                onChanged: (val) {
                  StudentName = val;
                  _onUpdate(key, StudentName, RegistrationNumber, CollegeName,
                      UniversityName);
                },
                cursorColor: Colors.purple,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Student Name'.tr,
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.purple, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.purple, width: 2)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                onChanged: (val) {
                  RegistrationNumber = val;
                  _onUpdate(key, StudentName, RegistrationNumber, CollegeName,
                      UniversityName);
                },
                cursorColor: Colors.purple,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Registration number'.tr,
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.purple, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.purple, width: 2)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                onChanged: (val) {
                  CollegeName = val;
                  _onUpdate(key, StudentName, RegistrationNumber, CollegeName,
                      UniversityName);
                },
                cursorColor: Colors.purple,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'College Name'.tr,
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.purple, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.purple, width: 2)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                onChanged: (val) {
                  UniversityName = val;
                  _onUpdate(key, StudentName, RegistrationNumber, CollegeName,
                      UniversityName);
                },
                cursorColor: Colors.purple,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'University Name'.tr,
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.purple, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.purple, width: 2)),
                ),
              ),
            ),
          ]),
    );
  }

  _onUpdate(String key, String StudentName, String RegistrationNumber,
      String CollegeName, String UniversityName) {
    String foundKey = '-1';
    for (var map in _values) {
      if (map.containsKey('id')) {
        if (map['id'] == key) {
          foundKey = key;
          break;
        }
      }
    }

    if (-1 != foundKey) {
      _values.removeWhere((map) {
        return map['id'] == foundKey;
      });
    }

    Map<String, dynamic> json = {
      'id': key,
      'StudentName': StudentName,
      'RegistrationNumber': RegistrationNumber,
      'CollegeName': CollegeName,
      'UniversityName': UniversityName
    };
    _values.add(json);

    setState(() {
      _result = _prettyPrint(_values);
    });
  }

  String _prettyPrint(jsonObject) {
    var encoder = JsonEncoder.withIndent('    ');
    return encoder.convert(jsonObject);
  }
}
