import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Qualifications extends StatefulWidget {
  const Qualifications({super.key});

  @override
  State<Qualifications> createState() => _QualificationsState();
}

class _QualificationsState extends State<Qualifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Conditions for applying for a loan".tr,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
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
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Text(
              "t1_q".tr,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "t2_q".tr,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "t3_q".tr,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "t4_q".tr,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "t5_q".tr,
              style: TextStyle(fontSize: 20),
            ),
            Divider(
              height: 20,
              thickness: 1,
            ),
            Text(
              "Notes:".tr,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "t6_q".tr,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "t7_q".tr,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "t8_q".tr,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed("loans_request");
                  },
                  child: Text(
                    "Apply for a loan".tr,
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
        )),
      ),
    );
  }
}
