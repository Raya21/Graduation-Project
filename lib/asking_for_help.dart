import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:index/addhelp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:index/editHelp.dart';

class AskForHelp extends StatefulWidget {
  final String value;

  //const AskForHelp({super.key});
  const AskForHelp({Key? key, required this.value}) : super(key: key);

  @override
  State<AskForHelp> createState() => _AskForHelpState();
}

class _AskForHelpState extends State<AskForHelp> {
  List list = [];
  Future GetData() async {
    var url = "http://192.168.1.9/handinhand/getHelp.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var red = json.decode(res.body);
      setState(() {
        list.addAll(red);
      });
      print(list);
    }
  }
  Future deleteHelp(String email, String help, String id) async {
    var url = "http://192.168.1.9/handinhand/deletehelp.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": email,
      "help": help,
      "id": id
      
    });
    var data = await json.decode(response.body);
    if (data == "Success") {
      //emailvalue=emailcontroller.text;
      //print(emailvalue);
      Fluttertoast.showToast(
          msg: "Deleted Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(value:emailvalue)));
    } else {
      Fluttertoast.showToast(
          msg: "Delete Faild",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  @override
  void initState() {
    super.initState();
    //setEmail();
    GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Asking For Help",
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(widget.value);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddHelp(value: widget.value)));
          },
          backgroundColor: Colors.purple,
          child: Icon(
            Icons.add,
            color: Colors.white,
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
                      "${list[i]["email"]}",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${list[i]["help"]}",
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: Icon(Icons.help_rounded),
                    trailing: Wrap(
                      spacing: 5, // space between two icons
                      children: <Widget>[
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditHelp(
                                        value: "${list[i]["email"]}",
                                        value1: "${list[i]["help"]}",
                                        value2: "${list[i]["id"]}",
                                      )));
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {
                          deleteHelp("${list[i]["email"]}","${list[i]["help"]}","${list[i]["id"]}");
                        }, icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
