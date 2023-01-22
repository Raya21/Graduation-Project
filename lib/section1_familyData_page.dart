import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/_http/_io/_file_decoder_io.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:index/sqldb.dart';
import 'package:sqflite/sqflite.dart';

import 'section2_familyData_page.dart';

class Section1 extends StatefulWidget {
  final int userId;
  const Section1({super.key, required this.userId});

  @override
  State<Section1> createState() => _Section1State();
}

class _Section1State extends State<Section1> {
  SqlDb sqlDb = SqlDb();
  final _formKey = GlobalKey<FormState>();
  var userId;

  var studentSocialSituation = null;
  var parentsSocialSituation = null;
  var fatherCareerStatus = null;
  var fatherWorkPlace = null;
  var fatherJop = null;
  var fatherWorkNature = null;

  var motherCareerStatus = null;
  var motherWorkPlace = null;
  var motherJop = null;
  var motherWorkNature = null;

  var hwCareerStatus = null;
  var hwWorkPlace = null;
  var hwJop = null;
  var hwWorkNature = null;

  var selectedItem = null;
  var x = Colors.pink;

  final studentName = TextEditingController();
  final studentId = TextEditingController();
  final studentIdCard = TextEditingController();

  final fatherName = TextEditingController();
  final fatherId = TextEditingController();
  final fatherJopDesc = TextEditingController();

  final motherName = TextEditingController();
  final motherId = TextEditingController();
  final motherJopDesc = TextEditingController();

  final hwName = TextEditingController();
  final hwId = TextEditingController();
  final hwJopDesc = TextEditingController();

  bool isLoading = true;

  Future getData() async {
    final result = await sqlDb.readData(
        "SELECT COUNT(*)  FROM 'familydatas1' WHERE `userId`=${widget.userId}");
    final count = Sqflite.firstIntValue(result);

    if (count == 1) {
      List<Map> response = await sqlDb.readData(
          "SELECT * FROM 'familydatas1' WHERE `userId`=${widget.userId}");
      isLoading = false;
      if (this.mounted) {
        setState(() {
          studentIdCard.text = response[0]["studentIdCard"].toString();
          studentName.text = response[0]["studentName"];
          studentId.text = response[0]["studentNumber"].toString();

          fatherName.text = response[0]["fatherName"];
          fatherId.text = response[0]["fatherIdCard"].toString();
          fatherCareerStatus = response[0]["fatherCareerStatus"];
          fatherWorkPlace = response[0]["fatherWorkPlace"];
          fatherJop = response[0]["fatherJob"];
          fatherWorkNature = response[0]["fatherWorkNature"];
          fatherJopDesc.text = response[0]["fatherJobDesc"];

          motherName.text = response[0]["motherName"];
          motherId.text = response[0]["motherIdCard"].toString();
          motherCareerStatus = response[0]["motherCareerStatus"];
          motherWorkPlace = response[0]["motherWorkPlace"];
          motherJop = response[0]["motherJob"];
          motherWorkNature = response[0]["motherWorkNature"];
          motherJopDesc.text = response[0]["motherJobDesc"];

          hwName.text = response[0]["hwName"];
          hwId.text = response[0]["hwIdCard"].toString();

          if (hwCareerStatus != null)
            hwCareerStatus = response[0]["hwCareerStatus"];
          else
            hwCareerStatus = " ";

          if (hwWorkPlace != null)
            hwWorkPlace = response[0]["hwWorkPlace"];
          else
            hwWorkPlace = " ";

          if (hwJop != null)
            hwJop = response[0]["hwJob"];
          else
            hwJop = " ";

          if (hwWorkNature != null)
            hwWorkNature = response[0]["hwWorkNature"];
          else
            hwWorkNature = " ";
          hwJopDesc.text = response[0]["hwJobDesc"];

          studentSocialSituation = response[0]["studentSocialSit"];
          parentsSocialSituation = response[0]["parentsSocialSit"];
        });
      }
    }
  }

  @override
  void initState() {
    userId = widget.userId;
    getData();
    super.initState();
  }

  Future save() async {
    if (hwCareerStatus == null) {
      hwCareerStatus = " ";
    }

    if (hwWorkPlace == null) {
      hwWorkPlace = " ";
    }

    if (hwJop == null) {
      hwJop = " ";
    }

    if (hwWorkNature == null) {
      hwWorkNature = " ";
    }
    var url = "http://192.168.1.10/handinhand2/familydatas1.php";
    var response = await http.post(Uri.parse(url), body: {
      "studentIdCard": studentIdCard.text,
      "studentName": studentName.text,
      "studentNumber": studentId.text.toString(),
      "fatherName": fatherName.text,
      "fatherIdCard": fatherId.text,
      "fatherCareerStatus": fatherCareerStatus,
      "fatherWorkPlace": fatherWorkPlace,
      "fatherJob": fatherJop,
      "fatherWorkNature": fatherWorkNature,
      "fatherJobDesc": fatherJopDesc.text,
      "motherName": motherName.text,
      "motherIdCard": motherId.text,
      "motherCareerStatus": motherCareerStatus,
      "motherWorkPlace": motherWorkPlace,
      "motherJob": motherJop,
      "motherWorkNature": motherWorkNature,
      "motherJobDesc": motherJopDesc.text,
      "hwName": hwName.text,
      "hwIdCard": hwId.text,
      "hwCareerStatus": hwCareerStatus,
      "hwWorkPlace": hwWorkPlace,
      "hwJob": hwJop,
      "hwWorkNature": hwWorkNature,
      "hwJobDesc": hwJopDesc.text,
      "studentSocialSit": studentSocialSituation,
      "parentsSocialSit": parentsSocialSituation,
      "userId": userId.toString()
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

    Section2(
      userId: 77,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Container(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.grey.shade900,
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    onChanged: (val) {},
                    controller: studentName,
                    cursorColor: Colors.purple,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Student Name".tr,
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required'.tr;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    onChanged: (val) {},
                    controller: studentId,
                    cursorColor: Colors.purple,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Student Number".tr,
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required'.tr;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    onChanged: (val) {},
                    controller: studentIdCard,
                    cursorColor: Colors.purple,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "ID Number".tr,
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required'.tr;
                      }
                      return null;
                    },
                  ),
                ),
              ]),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: ["Single".tr, "Married".tr],
            validator: (value) => value == null ? '*Required'.tr : null,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Social Situation".tr,
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                //hintText: "country in menu mode",
              ),
            ),
            onChanged: (val) {
              studentSocialSituation = val;
            },
            selectedItem: studentSocialSituation,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          //color: Color.fromARGB(255, 172, 117, 182),
          margin: EdgeInsets.only(left: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              //disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: [
              "----",
              "Married".tr,
              "One of them is dead".tr,
              "Separated".tr,
              "Something Else".tr,
            ],
            validator: (value) => value == null ? '*Required'.tr : null,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Parents' social status".tr,
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
              ),
            ),
            onChanged: (val) {
              parentsSocialSituation = val;
            },
            selectedItem: parentsSocialSituation,
          ),
        ),
        /********************************************************************************  Father information *******************************************************************/
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Father".tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Quatrain Name  ".tr,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 190,
                child: TextFormField(
                  onChanged: (val) {},
                  controller: fatherName,
                  cursorColor: Colors.purple,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required'.tr;
                    }
                    return null;
                  },
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "ID Number         ".tr,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 190,
                child: TextFormField(
                  onChanged: (val) {},
                  controller: fatherId,
                  cursorColor: Colors.purple,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required'.tr;
                    }
                    return null;
                  },
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: [
              "Works".tr,
              "Does not work".tr,
              "Prisoner".tr,
              "Retired".tr,
              "Aged/Sickly".tr,
              "Deceased".tr
            ],
            validator: (value) => value == null ? '*Required'.tr : null,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Career Status".tr,
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                //hintText: "country in menu mode",
              ),
            ),
            onChanged: (val) {
              fatherCareerStatus = val;
            },
            selectedItem: fatherCareerStatus,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: [
              "----",
              "The Ministry of Education and Higher Education".tr,
              "Ministry of Health".tr,
              "The rest of the ministries".tr,
              "Security Services".tr,
              "Not a government job".tr,
              "Abroad".tr
            ],
            validator: (value) => value == null ? '*Required'.tr : null,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Work Place".tr,
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                //hintText: "country in menu mode",
              ),
            ),
            onChanged: (val) {
              fatherWorkPlace = val;
            },
            selectedItem: fatherWorkPlace,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
              showSelectedItems: true,
            ),
            items: [
              "----",
              "General Manager and above".tr,
              "Administrator".tr,
              "Head of the Department".tr,
              "Employee".tr,
              "Teacher".tr,
              "Soldier".tr,
              "Retired employee".tr,
              "Merchant".tr,
              "Contractor".tr,
              "shopkeeper".tr,
              "Salesman in a shop".tr,
              "Peddler".tr,
              "Free business".tr,
              "Poultry and livestock farming".tr,
              "Hairdressing".tr,
              "Guard".tr,
              "Handicraft(marble, glass, crafting ..etc)".tr,
              "Maintenance (cars, electrical ..etc)".tr,
              "Driver".tr,
              "Plumber".tr,
              "Carpenter".tr,
              "Blacksmith".tr,
              "upholstery".tr,
              "Worker (construction, restaurants, factories, etc.)".tr,
              "Ironing clothes".tr,
              "Sewing".tr,
              "Farmer".tr,
              "Photographer".tr,
              "Graphic designer".tr,
              "Observer".tr,
              "Technical".tr,
              "Land survey".tr,
              "Tour guide".tr,
              "Sales Representative".tr,
              "Sales Supervisor".tr,
              "Nursery or Kindergarten".tr,
              "Athlete".tr,
              "Librarian".tr,
              "Secretary".tr,
              "Writer".tr,
              "Translator".tr,
              "Tax collection".tr,
              "Accountant".tr,
              "Journalist".tr,
              "Computer programmer".tr,
              "Lawyer".tr,
              "Legal advisor".tr,
              "Engineer".tr,
              "Pharmacist".tr,
              "Nurse".tr,
              "Optics".tr,
              "Physical therapy".tr,
              "Doctor".tr
            ],
            validator: (value) => value == null ? '*Required'.tr : null,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Job".tr,
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                //hintText: "country in menu mode",
              ),
            ),
            onChanged: (val) {
              fatherJop = val;
            },
            selectedItem: fatherJop,
          ),
        ),
        Container(
          //   color: Color.fromARGB(255, 172, 117, 182),
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              //disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: [
              "----",
              "Owns a place/work tools".tr,
              "Tenant of place/tools for work".tr,
              "Employee".tr,
            ],
            validator: (value) => value == null ? '*Required'.tr : null,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Work Nature".tr,
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                //hintText: "country in menu mode",
              ),
            ),
            onChanged: (val) {
              fatherWorkNature = val;
            },
            selectedItem: fatherWorkNature,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Job description  ".tr,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 190,
                child: TextFormField(
                  onChanged: (val) {},
                  controller: fatherJopDesc,
                  cursorColor: Colors.purple,
                  maxLines: 6,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        /******************************************************************************** End of father information ****************************************************************/
        Divider(
          color: Colors.pink,
          thickness: 1,
        ),

        /********************************************************************************  Mother information *******************************************************************/
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mother".tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Quatrain Name  ".tr,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 190,
                child: TextFormField(
                  onChanged: (val) {},
                  controller: motherName,
                  cursorColor: Colors.purple,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required'.tr;
                    }
                    return null;
                  },
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "ID Number         ".tr,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 190,
                child: TextFormField(
                  onChanged: (val) {},
                  controller: motherId,
                  cursorColor: Colors.purple,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required'.tr;
                    }
                    return null;
                  },
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: [
              "Works".tr,
              "Does not work".tr,
              "Prisoner".tr,
              "Retired".tr,
              "Aged/Sickly".tr,
              "Deceased".tr
            ],
            validator: (value) => value == null ? '*Required'.tr : null,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Career Status".tr,
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
              ),
            ),
            onChanged: (val) {
              motherCareerStatus = val;
            },
            selectedItem: motherCareerStatus,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: [
              "----",
              "The Ministry of Education and Higher Education".tr,
              "Ministry of Health".tr,
              "The rest of the ministries".tr,
              "Security Services".tr,
              "Not a government job".tr,
              "Abroad"
            ],
            validator: (value) => value == null ? '*Required'.tr : null,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Work Place".tr,
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
              ),
            ),
            onChanged: (val) {
              motherWorkPlace = val;
            },
            selectedItem: motherWorkPlace,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
              showSelectedItems: true,
            ),
            items: [
              "----",
              "General Manager and above".tr,
              "Administrator".tr,
              "Head of the Department".tr,
              "Employee".tr,
              "Teacher".tr,
              "Soldier".tr,
              "Retired employee".tr,
              "Merchant".tr,
              "Contractor".tr,
              "shopkeeper".tr,
              "Salesman in a shop".tr,
              "Peddler".tr,
              "Free business".tr,
              "Poultry and livestock farming".tr,
              "Hairdressing".tr,
              "Guard".tr,
              "Handicraft(marble, glass, crafting ..etc)".tr,
              "Maintenance (cars, electrical ..etc)".tr,
              "Driver".tr,
              "Plumber".tr,
              "Carpenter".tr,
              "Blacksmith".tr,
              "upholstery".tr,
              "Worker (construction, restaurants, factories, etc.)".tr,
              "Ironing clothes".tr,
              "Sewing".tr,
              "Farmer".tr,
              "Photographer".tr,
              "Graphic designer".tr,
              "Observer".tr,
              "Technical".tr,
              "Land survey".tr,
              "Tour guide".tr,
              "Sales Representative".tr,
              "Sales Supervisor".tr,
              "Nursery or Kindergarten".tr,
              "Athlete".tr,
              "Librarian".tr,
              "Secretary".tr,
              "Writer".tr,
              "Translator".tr,
              "Tax collection".tr,
              "Accountant".tr,
              "Journalist".tr,
              "Computer programmer".tr,
              "Lawyer".tr,
              "Legal advisor".tr,
              "Engineer".tr,
              "Pharmacist".tr,
              "Nurse".tr,
              "Optics".tr,
              "Physical therapy".tr,
              "Doctor".tr
            ],
            validator: (value) => value == null ? '*Required'.tr : null,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Job".tr,
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
              ),
            ),
            onChanged: (val) {
              motherJop = val;
            },
            selectedItem: motherJop,
          ),
        ),
        Container(
          //   color: Color.fromARGB(255, 172, 117, 182),
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              //disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: [
              "----",
              "Owns a place/work tools".tr,
              "Tenant of place/tools for work".tr,
              "Employee".tr,
            ],
            validator: (value) => value == null ? '*Required'.tr : null,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Work Nature".tr,
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
              ),
            ),
            onChanged: (val) {
              motherWorkNature = val;
            },
            selectedItem: motherWorkNature,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Job description  ".tr,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 190,
                child: TextFormField(
                  onChanged: (val) {},
                  controller: motherJopDesc,
                  cursorColor: Colors.purple,
                  maxLines: 6,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        /******************************************************************************** End of mother information ***************************************************************/
        Divider(
          color: Colors.pink,
          thickness: 1,
        ),
        /********************************************************************************  Husband/Wife information *************************************************************/
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Husband/Wife".tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Quatrain Name  ".tr,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 190,
                child: TextFormField(
                    onChanged: (val) {},
                    controller: hwName,
                    cursorColor: Colors.purple,
                    keyboardType: TextInputType.name,
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
                    validator: (value) {
                      if (studentSocialSituation == "Married".tr) {
                        if (value == null || value.isEmpty) {
                          return '*Required'.tr;
                        }
                        return null;
                      }
                    }),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "ID Number         ".tr,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 190,
                child: TextFormField(
                    onChanged: (val) {},
                    controller: hwId,
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
                    validator: (value) {
                      if (studentSocialSituation == "Married".tr) {
                        if (value == null || value.isEmpty) {
                          return '*Required'.tr;
                        }
                        return null;
                      }
                    }),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: [
              "Works".tr,
              "Does not work".tr,
              "Prisoner".tr,
              "Retired".tr,
              "Aged/Sickly".tr,
              "Deceased".tr
            ],
            validator: (value) {
              if (studentSocialSituation == "Married".tr) {
                if (value == null ||
                    value.isEmpty ||
                    value == " " ||
                    value == "") {
                  return '*Required'.tr;
                }
                return null;
                //value == null ? '*Required'.tr : null;
              }
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Career Status".tr,
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
              ),
            ),
            onChanged: (val) {
              hwCareerStatus = val;
            },
            selectedItem: hwCareerStatus,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: [
              "----",
              "The Ministry of Education and Higher Education".tr,
              "Ministry of Health".tr,
              "The rest of the ministries".tr,
              "Security Services".tr,
              "Not a government job".tr,
              "Abroad".tr
            ],
            validator: (value) {
              if (studentSocialSituation == "Married".tr) {
                if (value == null ||
                    value.isEmpty ||
                    value == " " ||
                    value == "") {
                  return '*Required'.tr;
                }
                return null;
                //value == null ? '*Required'.tr : null;
              }
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Work Place".tr,
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
              ),
            ),
            onChanged: (val) {
              hwWorkPlace = val;
            },
            selectedItem: hwWorkPlace,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
              showSelectedItems: true,
            ),
            items: [
              "----",
              "General Manager and above".tr,
              "Administrator".tr,
              "Head of the Department".tr,
              "Employee".tr,
              "Teacher".tr,
              "Soldier".tr,
              "Retired employee".tr,
              "Merchant".tr,
              "Contractor".tr,
              "shopkeeper".tr,
              "Salesman in a shop".tr,
              "Peddler".tr,
              "Free business".tr,
              "Poultry and livestock farming".tr,
              "Hairdressing".tr,
              "Guard".tr,
              "Handicraft(marble, glass, crafting ..etc)".tr,
              "Maintenance (cars, electrical ..etc)".tr,
              "Driver".tr,
              "Plumber".tr,
              "Carpenter".tr,
              "Blacksmith".tr,
              "upholstery".tr,
              "Worker (construction, restaurants, factories, etc.)".tr,
              "Ironing clothes".tr,
              "Sewing".tr,
              "Farmer".tr,
              "Photographer".tr,
              "Graphic designer".tr,
              "Observer".tr,
              "Technical".tr,
              "Land survey".tr,
              "Tour guide".tr,
              "Sales Representative".tr,
              "Sales Supervisor".tr,
              "Nursery or Kindergarten".tr,
              "Athlete".tr,
              "Librarian".tr,
              "Secretary".tr,
              "Writer".tr,
              "Translator".tr,
              "Tax collection".tr,
              "Accountant".tr,
              "Journalist".tr,
              "Computer programmer".tr,
              "Lawyer".tr,
              "Legal advisor".tr,
              "Engineer".tr,
              "Pharmacist".tr,
              "Nurse".tr,
              "Optics".tr,
              "Physical therapy".tr,
              "Doctor".tr
            ],
            validator: (value) {
              if (studentSocialSituation == "Married".tr) {
                if (value == null ||
                    value.isEmpty ||
                    value == " " ||
                    value == "") {
                  return '*Required'.tr;
                }
                return null;
                //value == null ? '*Required'.tr : null;
              }
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Job".tr,
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
              ),
            ),
            onChanged: (val) {
              hwJop = val;
            },
            selectedItem: hwJop,
          ),
        ),
        Container(
          //   color: Color.fromARGB(255, 172, 117, 182),
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              //disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: [
              "----",
              "Owns a place/work tools".tr,
              "Tenant of place/tools for work".tr,
              "Employee".tr,
            ],
            validator: (value) {
              if (studentSocialSituation == "Married".tr) {
                if (value == null ||
                    value.isEmpty ||
                    value == " " ||
                    value == "") {
                  return '*Required'.tr;
                }
                return null;
                //value == null ? '*Required'.tr : null;
              }
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Work Nature".tr,
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2)),
              ),
            ),
            onChanged: (val) {
              hwWorkNature = val;
            },
            selectedItem: hwWorkNature,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Job description  ".tr,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 190,
                child: TextFormField(
                  onChanged: (val) {},
                  controller: hwJopDesc,
                  maxLines: 6,
                  cursorColor: Colors.purple,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        /******************************************************************************** End of husband/wife information *********************************************************/

        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            onPressed: (() async {
              if (_formKey.currentState!.validate()) {
                final result = await sqlDb.readData(
                    "SELECT COUNT(*)  FROM 'familydatas1' WHERE `userId`=${widget.userId}");
                final count = Sqflite.firstIntValue(result);

                if (count == 0) {
                  int response = await sqlDb.insertData('''
                  INSERT INTO familydatas1 (
                    `studentIdCard` ,
                    `userId`,
                    `studentName`,
                    `studentNumber`,
                    `fatherName`,
                    `fatherIdCard`,
                    `fatherCareerStatus`,
                    `fatherWorkPlace`,
                    `fatherJob`,
                    `fatherWorkNature`,
                    `fatherJobDesc`,
                    `motherName`,
                    `motherIdCard`,
                    `motherCareerStatus`,
                    `motherWorkPlace`,
                    `motherJob`,
                    `motherWorkNature`,
                    `motherJobDesc`,
                    `hwName`,
                    `hwIdCard`,
                    `hwCareerStatus`,
                    `hwWorkPlace`,
                    `hwJob`,
                    `hwWorkNature`,
                    `hwJobDesc`,
                    `studentSocialSit`,
                    `parentsSocialSit`
                    )
                     
                      VALUES (
                        "${studentIdCard.text}",
                        ${widget.userId},
                        "${studentName.text}",
                        "${studentId.text}",

                        "${fatherName.text}",
                        "${fatherId.text}",
                        "${fatherCareerStatus}",
                        "${fatherWorkPlace}",
                        "${fatherJop}",
                        "${fatherWorkNature}",
                        "${fatherJopDesc.text}",

                        "${motherName.text}",
                        "${motherId.text}",
                        "${motherCareerStatus}",
                        "${motherWorkPlace}",
                        "${motherJop}",
                        "${motherWorkNature}",
                        "${motherJopDesc.text}",

                        
                        "${hwName.text}",
                        "${hwId.text}",
                        "${hwCareerStatus}",
                        "${hwWorkPlace}",
                        "${hwJop}",
                        "${hwWorkNature}",
                        "${hwJopDesc.text}",

                        "${studentSocialSituation}",
                        "${parentsSocialSituation}"

                        )
                      ''');
                } else {
                  int response = await sqlDb.updateData('''
                    UPDATE familydatas1 SET
                    studentIdCard = "${studentIdCard.text}",
                    userId = ${widget.userId},
                    studentName = "${studentName.text}",
                    studentNumber = "${studentId.text}",

                    fatherName="${fatherName.text}",
                    fatherIdCard="${fatherId.text}",
                    fatherCareerStatus="${fatherCareerStatus}",
                    fatherWorkPlace="${fatherWorkPlace}",
                    fatherJob="${fatherJop}",
                    fatherWorkNature="${fatherWorkNature}",
                    fatherJobDesc= "${fatherJopDesc.text}",

                    motherName="${motherName.text}",
                    motherIdCard="${motherId.text}",
                    motherCareerStatus="${motherCareerStatus}",
                    motherWorkPlace="${motherWorkPlace}",
                    motherJob="${motherJop}",
                    motherWorkNature="${motherWorkNature}",
                    motherJobDesc= "${motherJopDesc.text}",

                    hwName="${hwName.text}",
                    hwIdCard="${hwId.text}",
                    hwCareerStatus="${hwCareerStatus}",
                    hwWorkPlace="${hwWorkPlace}",
                    hwJob="${hwJop}",
                    hwWorkNature="${hwWorkNature}",
                    hwJobDesc= "${hwJopDesc.text}",

                    studentSocialSit= "${studentSocialSituation}",
                    parentsSocialSit="${parentsSocialSituation}"


                    WHERE `userId`=${widget.userId}
                    ''');
                }

                List<Map> response =
                    await sqlDb.readData("SELECT * FROM 'familydatas1'");

                final result2 = await sqlDb
                    .readData("SELECT COUNT(*)  FROM 'familydatas1'");
                final count2 = Sqflite.firstIntValue(result2);

                print(count2);
                // print(count);
                print("$response");
                save();
              } else {
                Fluttertoast.showToast(
                    msg: "Be sure to enter the required text fields!".tr,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16);
              }
            }),
            child: Text(
              "Save data".tr,
              style: TextStyle(fontSize: 20),
            )),
        SizedBox(
          height: 20,
        ),
      ]),
    ); //Column
  }
}
