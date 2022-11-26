import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Section3 extends StatefulWidget {
  final int userId;

  const Section3({super.key, required this.userId});

  @override
  State<Section3> createState() => _Section3State();
}

class _Section3State extends State<Section3> {
  bool _isVisible = false;
  late int _count;
  late String _result;
  String StudentName = '';
  String RegistrationNumber = '0';
  String CollegeName = '';
  String UniversityName = '';
  late List<Map<String, dynamic>> _values;
  // var userId;
  @override
  void initState() {
    //   userId = widget.userId;
    _result = '';
    _count = 0;
    _values = [];
  }

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
                      setState(() {
                        _count = int.parse(val);
                        if (_count > 0) {
                          _isVisible = true;
                        } else {
                          _isVisible = false;
                        }
                      });
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
          // Center(
          //   child: Table(
          //     border: TableBorder.all(),
          //     children: [
          //       buildRow([
          //         'Student Name'.tr,
          //         'Registration number'.tr,
          //         'College Name'.tr,
          //         'University Name'.tr,
          //       ]),
          //       buildRow([' ', ' ', ' ', ' '], isHeader: true),
          //       buildRow([' ', ' ', ' ', ' ']),
          //       buildRow([' ', ' ', ' ', ' ']),
          //       buildRow([' ', ' ', ' ', ' ']),
          //       buildRow([' ', ' ', ' ', ' ']),
          //     ],
          //   ),
          // ),

          Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _count,
              itemBuilder: (context, index) {
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
              onPressed: (() {
                // print(userId);
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

  // TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
  //         children: cells.map((cell) {
  //       final Style = TextStyle(
  //         fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
  //         fontSize: 18,
  //       );
  //       return Padding(
  //         padding: const EdgeInsets.all(12),
  //         child: Center(child: Text(cell)),
  //       );
  //     }).toList());

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
