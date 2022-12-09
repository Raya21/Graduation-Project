import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'sqldb.dart';

class Section2 extends StatefulWidget {
  final int userId;
  const Section2({super.key, required this.userId});

  @override
  State<Section2> createState() => _Section2State();
}

class _Section2State extends State<Section2> {
  SqlDb sqlDb = SqlDb();
  var selectedItem = null;
  var x = Colors.pink;

  var relativeRelation = null;
  var workPlace = null;
  var job = null;

  final name = TextEditingController();
  final idNumber = TextEditingController();
  final note = TextEditingController();
  var h;
  List userData = [];
  bool isLoading = true;

  Future getData() async {
    final result = await sqlDb.readData(
        "SELECT COUNT(*)  FROM 'familydatas2' WHERE `userId`=${widget.userId}");
    final count = Sqflite.firstIntValue(result);

    if (count == 1) {
      List<Map> response = await sqlDb.readData(
          "SELECT * FROM 'familydatas2' WHERE `userId`=${widget.userId}");
      isLoading = false;
      if (this.mounted) {
        setState(() {
          relativeRelation = response[0]["relativeRelation"];
          workPlace = response[0]["workPlace"];
          job = response[0]["job"];
          name.text = response[0]["name"];
          idNumber.text = response[0]["idNumber"].toString();
          note.text = response[0]["note"];
        });
      }
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future save() async {
    var url = "http://192.168.1.10/handinhand/familydatas2.php";
    var response = await http.post(Uri.parse(url), body: {
      "name": name.text,
      "idNumber": idNumber.text,
      "note": note.text,
      "relativeRelation": relativeRelation,
      "workPlace": workPlace,
      "job": job,
      "userId": widget.userId.toString()
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
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The funder of university costs".tr,
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                child: DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                  items: [
                    "Father".tr,
                    "Mother".tr,
                    "Husband/Wife".tr,
                    "Other".tr,
                    "Me personally".tr,
                  ],
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Relative Relation".tr,
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
                  ),
                  onChanged: (val) {
                    relativeRelation = val;
                  },
                  selectedItem: relativeRelation,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "relationship".tr,
                style: TextStyle(fontSize: 20),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
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
                        onChanged: (val) {},
                        controller: name,
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
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
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
                        controller: idNumber,
                        onChanged: (val) {},
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
              workPlace = val;
            },
            selectedItem: workPlace,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
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
              job = val;
            },
            selectedItem: job,
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
                "Note                  ".tr,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 210,
                child: TextFormField(
                  onChanged: (val) {},
                  controller: note,
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
              ),
            ],
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            onPressed: (() async {
              var studentidcard;
              // await sqlDb.mydeleteDatabase();

              final _studentIdCard = await sqlDb.readData(
                  "SELECT COUNT(*)  FROM 'familydatas1' WHERE `userId`=${widget.userId}");
              final countt = Sqflite.firstIntValue(_studentIdCard);

              if (countt == 1) {
                List<Map> response = await sqlDb.readData(
                    "SELECT * FROM 'familydatas1' WHERE `userId`=${widget.userId}");
                studentidcard = response[0]["studentIdCard"].toString();
              }

              final result = await sqlDb.readData(
                  "SELECT COUNT(*)  FROM 'familydatas2' WHERE `userId`=${widget.userId}");
              final count = Sqflite.firstIntValue(result);
              if (count == 0) {
                int response = await sqlDb.insertData('''
               INSERT INTO familydatas2 (`studentIdCard` ,`userId`,`relativeRelation`,`name`,`idNumber`,`workPlace`,`job`,`note`)
               VALUES (${studentidcard},${widget.userId},"${relativeRelation}","${name.text}","${idNumber.text}","${workPlace}","${job}","${note.text}")
               ''');
              } else {
                int response = await sqlDb.updateData('''
                    UPDATE familydatas2 SET
                    studentIdCard = ${studentidcard},
                    userId = ${widget.userId},
                    relativeRelation = "${relativeRelation}",
                    name = "${name.text}",
                    idNumber = "${idNumber.text}",
                    workPlace = "${workPlace}",
                    job = "${job}",
                    note ="${note.text}"

                    WHERE `userId`=${widget.userId}
                    ''');
              }

              List<Map> response =
                  await sqlDb.readData("SELECT * FROM 'familydatas2'");

              print(count);
              print("$response");
              save();
            }),
            child: Text(
              "Save data".tr,
              style: TextStyle(fontSize: 20),
            )),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
