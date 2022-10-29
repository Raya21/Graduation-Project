import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplyLoans extends StatefulWidget {
  const ApplyLoans({super.key});

  @override
  State<ApplyLoans> createState() => _ApplyLoansState();
}

class _ApplyLoansState extends State<ApplyLoans> {
  late Future<void> _launched;
  String _launchUrl = 'https://eservices.iqrad.edu.ps/';
  Future<void> _launchInBroswer(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Apply for a loan".tr,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "t1_loan".tr,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Container(
                  child: Text(
                    "t2_loan".tr,
                    style: TextStyle(fontSize: 20),
                  ),
                  //alignment: Alignment.topLeft,
                ),
                Container(
                  child: InkWell(
                    onTap: () {
                      _launchInBroswer(_launchUrl);
                    },
                    child: Text(
                      "t6_loan".tr,
                      style: TextStyle(fontSize: 20, color: Colors.purple),
                    ),
                  ),
                  //alignment: Alignment.topLeft,
                ),
                Container(
                  child: Text(
                    "t3_loan".tr,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),

            //alignment: Alignment.topLeft),
            SizedBox(
              height: 15,
            ),
            Text(
              "t4_loan".tr,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "t5_loan".tr,
              style: TextStyle(fontSize: 20),
            ),
          ],
        )),
      ),
    );
  }
}
