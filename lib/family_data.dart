import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'section1_familyData_page.dart';
import 'section2_familyData_page.dart';
import 'section3_familyData_page.dart';

class FamilyData extends StatefulWidget {
  const FamilyData({super.key});

  @override
  State<FamilyData> createState() => _FamilyDataState();
}

class _FamilyDataState extends State<FamilyData> {
  var section = Section1();
  var sectionNumber = 0;
  List sections = [Section1(), Section2(), Section3()];
  var selectedItem = null;
  var x = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Family Data"),
        backgroundColor: Theme.of(context).primaryColor,
      ),*/
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 252, 250, 250),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            /******************************************************************************************* here *********************************************************************/
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.purple[400]!,
                      Colors.purple[800]!,
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  ),
                  //  color: Colors.purple,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "lib/imgs/family1.png",
                        width: 100,
                        height: 100,
                      ),
                      Text("Family Data",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  )),
              /************************************************************************************ Notes Section *************************************************************************/
              Card(
                color: Color.fromARGB(255, 208, 94, 228),
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        " Please be careful in entering the data, especially the ID number",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(
                        Icons.label_important,
                        color: Colors.red,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        " If you are not married, do not enter the data of the husband/wife",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(
                        Icons.label_important,
                        color: Colors.red,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        " If you do not have an ID card, please enter the passport number instead of the ID",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(
                        Icons.label_important,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              /********************************************************************************  End of Notes Section  *******************************************************************/

              /************************************************************************************  Sections Bar *************************************************************************/
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Text(
                        "Section 1",
                        style: TextStyle(
                          color: x,
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
                        "Section 2",
                        style: TextStyle(
                          color: x,
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
                        "Section 3",
                        style: TextStyle(
                          color: x,
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
