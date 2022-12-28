import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'section1_familyData_page.dart';
import 'section2_familyData_page.dart';
import 'section3_familyData_page.dart';
import 'package:get/get.dart';

class FamilyData extends StatefulWidget {
  final int userId;
  const FamilyData({super.key, required this.userId});

  @override
  State<FamilyData> createState() => _FamilyDataState();
}

class _FamilyDataState extends State<FamilyData> {
  var UserId;
  var section;
  var sectionNumber = 0;
  var sections;
  @override
  void initState() {
    var section = Section1(userId: widget.userId);

    sections = [
      Section1(userId: widget.userId),
      Section2(userId: widget.userId),
      Section3(userId: widget.userId)
    ];
  }

  var selectedItem = null;
  var x = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Family Data".tr,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.grey.shade900,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            /******************************************************************************************* *** *********************************************************************/
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /************************************************************************************ Notes Section *************************************************************************/
              Card(
                color: Color.fromARGB(255, 215, 143, 228),
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "t1_f".tr,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(
                        Icons.label_important,
                        color: Colors.pink,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "t2_f".tr,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(
                        Icons.label_important,
                        color: Colors.pink,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "t3_f".tr,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(
                        Icons.label_important,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
              /********************************************************************************  End of Notes Section  *******************************************************************/

              /************************************************************************************  Sections Bar *************************************************************************/
              SizedBox(
                height: 20,
              ),
              Container(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : Colors.grey.shade900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Text(
                        "Section 1".tr,
                        style: TextStyle(
                          fontSize: 20,
                          //color: x,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          sectionNumber = 0;
                          //x = Colors.yellow;
                        });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: Text(
                        "Section 2".tr,
                        style: TextStyle(
                          fontSize: 20,
                          //color: x,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          sectionNumber = 1;
                          //  x = Colors.yellow;
                        });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: Text(
                        "Section 3".tr,
                        style: TextStyle(
                          fontSize: 20,
                          //color: x,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          sectionNumber = 2;
                          // x = Colors.yellow;
                        });
                      },
                    ),
                  ],
                ),
              ),
              /********************************************************************************  End of Sections Bar *******************************************************************/

              sections[sectionNumber],
            ],
          ),
        ),
      ),
    );
  }
}