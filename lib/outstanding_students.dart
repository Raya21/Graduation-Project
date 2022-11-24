import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
class outstandingStudents extends StatefulWidget {
  const outstandingStudents({super.key});

  @override
  State<outstandingStudents> createState() => _outstandingStudentsState();
}

class _outstandingStudentsState extends State<outstandingStudents> {
  List list = [];
  Future GetData() async {
    var url = "http://192.168.1.100/handinhand/outStudent.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var red = json.decode(res.body);
      setState(() {
        list.addAll(red);
      });
      print(list);
    }
  }

  @override
  void initState() {
    super.initState();
    GetData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Outstanding Students",
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
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (cts, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 198, 126, 211),
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    title: Text(
                      "${list[i]["fname"]}",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${list[i]["description"]}",
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: Container(
                      child: Image.asset(
                        "lib/imgs/student.png",
                        width: 50,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
