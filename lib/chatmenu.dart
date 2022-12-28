import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:index/chat.dart';
import 'dart:convert';

import 'package:index/creditional.dart';

class ChatMenu extends StatefulWidget {
  final String value;
  const ChatMenu({Key? key, required this.value}) : super(key: key);

  @override
  State<ChatMenu> createState() => _ChatMenuState();
}

class _ChatMenuState extends State<ChatMenu> {
  Future GetUsers() async {
    var url = "http://" + IPADDRESS + "/handinhand/getUsers.php";
    var res = await http.get(Uri.parse(url));
    var red = json.decode(res.body);
    return red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Row(children: [
              Image.asset(
                "lib/imgs/chat.PNG",
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Chat",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
            leading: IconButton(
                onPressed: () {
                  //email = "";
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back))),
        body: FutureBuilder(
          future: GetUsers(),
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
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                print("${snapshot.data[i]["username"]}");
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ChatScreen(
                                        value: widget.value,
                                        /*value1: "${snapshot.data[i]["username"]}"*/)));
                              },
                              child: ListTile(
                                title: Text(
                                  "${snapshot.data[i]["username"]}",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                leading: Container(
                                  child: Image.asset(
                                    "lib/imgs/nopic.png",
                                    width: 50,
                                    height: 100,
                                  ),
                                ),
                              ),
                            )),
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}
