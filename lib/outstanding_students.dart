import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:index/creditional.dart';

class outstandingStudents extends StatefulWidget {
  const outstandingStudents({super.key});

  @override
  State<outstandingStudents> createState() => _outstandingStudentsState();
}

class _outstandingStudentsState extends State<outstandingStudents> {
 
  Future GetData() async {
    var url = "http://" + IPADDRESS + "/handinhand/outStudent.php";
    var res = await http.get(Uri.parse(url));
    var red = json.decode(res.body);
    return red;
  }

  List Data = [];
  Future Suggestion() async {
    var url = "http://" + IPADDRESS + "/handinhand/suggestion.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      for (int i = 0; i < data.length; i++) {
        setState(() {
          Data.add(data[i]['fname']);
        });
      }
    }
    print(Data);
  }

  @override
  void initState() {
    super.initState();
    Suggestion();
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
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: DataSearch(data: Data));
                },
                icon: Icon(Icons.search))
          ],
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
                              "${snapshot.data[i]["fname"]}",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${snapshot.data[i]["description"]}",
                              style: TextStyle(fontSize: 20),
                            ),
                            leading: Container(
                              child: Image.asset(
                                  "lib/studentImages/" + snapshot.data[i]["image"]),
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

class DataSearch extends SearchDelegate {
  List data = [];
  DataSearch({required this.data});

  Future getStudentData() async {
    var url = "http://" + IPADDRESS + "/handinhand/search.php";
    var res = await http.post(Uri.parse(url), body: {"query": query});
    if (res.statusCode == 200) {
      var stuData = jsonDecode(res.body);
      return stuData;
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getStudentData(),
        builder: (stx, snp) {
          if (!snp.hasData) {
            return Center(
              child: Text("There is No Student with this name!"),
            );
          } else if (snp.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snp.data.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 198, 126, 211),
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        title: Text(
                          '${snp.data[index]['fname']}',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${snp.data[index]["description"]}",
                          style: TextStyle(fontSize: 20),
                        ),
                        leading: Container(
                          child: Image.asset("http://" +
                              IPADDRESS +
                              "/handinhand/" +
                              snp.data[index]["image"]),
                        ),
                      ),
                    ),
                  );
                });
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var datasuggestion = query.isEmpty
        ? data
        : data
            .where(
                (element) => element.toString().toLowerCase().contains(query))
            .toList();
    return ListView.builder(
        itemCount: datasuggestion.length,
        itemBuilder: (ctn, index) {
          return ListTile(
            onTap: () {
              query = datasuggestion[index];
              showResults(context);
            },
            leading: Icon(Icons.person),
            title: Text('${datasuggestion[index]}'),
          );
        });
  }
}
