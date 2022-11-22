import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/_http/_io/_file_decoder_io.dart';
import 'package:http/http.dart' as http;

import 'section2_familyData_page.dart';

class Section1 extends StatefulWidget {
  final int userId;
  const Section1({super.key, required this.userId});

  @override
  State<Section1> createState() => _Section1State();
}

class _Section1State extends State<Section1> {
  var userId;
  @override
  void initState() {
    userId = widget.userId;
  }

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

  Future save() async {
    var url = "http://192.168.1.10/handinhand/familydatas1.php";
    var response = await http.post(Uri.parse(url), body: {
      "studentIdCard": studentIdCard.text,
      "studentName": studentName.text,
      "studentNumber": studentId.text,
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
    return Column(children: [
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
                  controller: studentName,
                  cursorColor: Colors.purple,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Student Name".tr,
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
                  controller: studentId,
                  cursorColor: Colors.purple,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Student Number".tr,
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
                  controller: studentIdCard,
                  cursorColor: Colors.purple,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "ID Number".tr,
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
      ),
      Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: ["Single".tr, "Married".tr],
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
            "Married2".tr,
            "One of them is dead".tr,
            "Separated".tr,
            "Something Else".tr,
          ],
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
              width: 210,
              child: TextFormField(
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
              width: 210,
              child: TextFormField(
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
              width: 210,
              child: TextFormField(
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
              width: 210,
              child: TextFormField(
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
              width: 210,
              child: TextFormField(
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
              width: 210,
              child: TextFormField(
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
              width: 210,
              child: TextFormField(
                controller: hwName,
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
              width: 210,
              child: TextFormField(
                controller: hwId,
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
              width: 210,
              child: TextFormField(
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: (() {
            save();
          }),
          child: Text(
            "Save data".tr,
            style: TextStyle(fontSize: 20),
          )),
      SizedBox(
        height: 20,
      ),
    ]); //Column
  }
}
