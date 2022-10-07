import 'package:flutter/material.dart';

class FamilyData extends StatefulWidget {
  const FamilyData({super.key});

  @override
  State<FamilyData> createState() => _FamilyDataState();
}

class _FamilyDataState extends State<FamilyData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          /*  gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // Color.fromARGB(255, 221, 102, 241),
            Color.fromARGB(255, 134, 163, 241),
            // Color.fromARGB(255, 224, 193, 193),
            Color.fromARGB(255, 245, 120, 161),
          ],
        )*/
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
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: Icon(
                        Icons.label_important,
                        color: Colors.red,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        " If you are not married, do not enter the data of the husband/wife",
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: Icon(
                        Icons.label_important,
                        color: Colors.red,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        " If you do not have an ID card, please enter the passport number instead of the ID",
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: Icon(
                        Icons.label_important,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              /******************************************************************************** End of Notes Sections *******************************************************************/
            ],
          ),
        ),
      ),
    );
  }
}
