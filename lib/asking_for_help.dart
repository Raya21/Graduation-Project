import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:index/addhelp.dart';
import 'package:http/http.dart' as http;
import 'package:index/creditional.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:index/reply_donate.dart';

class AskForHelp extends StatefulWidget {
  final String value;

  //const AskForHelp({super.key});
  const AskForHelp({Key? key, required this.value}) : super(key: key);

  @override
  State<AskForHelp> createState() => _AskForHelpState();
}

class _AskForHelpState extends State<AskForHelp> {
  Future GetData() async {
    var url = "http://" + IPADDRESS + "/handinhand2/getHelp.php";
    var res = await http.get(Uri.parse(url));
    print(res.body);
    var red = json.decode(res.body);
    return red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Donations".tr,
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
                      itemCount: snapshot.data[0] == "noData"
                          ? 0
                          : snapshot.data.length,
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
                                "${snapshot.data[i]["post"]}",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              leading: Icon(
                                Icons.request_page,
                                color: Colors.white,
                              ),
                              trailing:
                                  widget.value == "${snapshot.data[i]["email"]}"
                                      ? Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        )
                                      : IconButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ReplyDonate(
                                                          value: widget.value,
                                                          value1:
                                                              "${snapshot.data[i]["id"]}",
                                                          value2:
                                                              "${snapshot.data[i]["email"]}",
                                                          value3:
                                                              "${snapshot.data[i]["typed"]}",
                                                          value4:
                                                              "${snapshot.data[i]["money"]}",
                                                          value5:
                                                              "${snapshot.data[i]["cost"]}",
                                                          value6:
                                                              "${snapshot.data[i]["remaining"]}",
                                                        )));
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
