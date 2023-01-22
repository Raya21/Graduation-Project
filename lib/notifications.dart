import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:index/creditional.dart';

class Notifications extends StatefulWidget {
  final String email;
  const Notifications({super.key, required this.email});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Future GetData() async {
    var url = "http://" + IPADDRESS + "/handinhand2/notifications.php";
    var res = await http.post(Uri.parse(url), body: {
      "email": widget.email,
    });
    var red = json.decode(res.body);
    return red;
  }

  List Data = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Notifications".tr,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.purple,
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
        body: FutureBuilder(
          future: GetData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (cts, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 198, 126, 211),
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            title: Text(
                              "${snapshot.data[i]["title"]}",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${snapshot.data[i]["body"]}",
                              style: TextStyle(fontSize: 20),
                            ),
                            leading: Container(
                              child: Image.asset(
                                "lib/imgs/logo.png",
                                // width: 150,
                                // height: 150,
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}
