import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:index/addhelp.dart';
import 'package:http/http.dart' as http;
import 'package:index/creditional.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:index/editHelp.dart';

class AskForHelp extends StatefulWidget {
  final String value;

  //const AskForHelp({super.key});
  const AskForHelp({Key? key, required this.value}) : super(key: key);

  @override
  State<AskForHelp> createState() => _AskForHelpState();
}

class _AskForHelpState extends State<AskForHelp> {
  
  Future GetData() async {
    var url = "http://"+IPADDRESS+"/handinhand/getHelp.php";
    var res = await http.get(Uri.parse(url));
    var red = json.decode(res.body);
    return red;
  }

  Future deleteHelp(String email, String help, String id) async {
    var url = "http://"+IPADDRESS+"/handinhand/deletehelp.php";
    var response = await http
        .post(Uri.parse(url), body: {"email": email, "help": help, "id": id});
    var data = await json.decode(response.body);
    if (data == "Success") {
      //emailvalue=emailcontroller.text;
      //print(emailvalue);
      Fluttertoast.showToast(
          msg: "Deleted Successfully".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 203, 158, 211),
          textColor: Colors.purple,
          fontSize: 16);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(value:emailvalue)));
    } else {
      Fluttertoast.showToast(
          msg: "Delete Faild".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    }
  }
  Future replyHelp(String email, String help, String id) async {
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Asking For Help".tr,
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
                                "${snapshot.data[i]["username"]}",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "${snapshot.data[i]["help"]}",
                                style: TextStyle(fontSize: 20),
                              ),
                              leading: Icon(Icons.help_rounded),
                              trailing: widget.value == "${snapshot.data[i]["email"]}" ? Wrap(
                                spacing: 5, // space between two icons
                                children: <Widget>[
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => EditHelp(
                                                      value:
                                                          "${snapshot.data[i]["email"]}",
                                                      value1:
                                                          "${snapshot.data[i]["help"]}",
                                                      value2:
                                                          "${snapshot.data[i]["id"]}",
                                                    )));
                                      },
                                      icon: Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        deleteHelp(
                                            "${snapshot.data[i]["email"]}",
                                            "${snapshot.data[i]["help"]}",
                                            "${snapshot.data[i]["id"]}");
                                      },
                                      icon: Icon(Icons.delete)),
                                ],
                              ) : IconButton(
                                      onPressed: () {
                                        replyHelp(
                                            widget.value,
                                            "${snapshot.data[i]["help"]}",
                                            "${snapshot.data[i]["id"]}");
                                      },
                                      icon: Icon(Icons.reply)),
                            ),
                          ),
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }));
  }
}
