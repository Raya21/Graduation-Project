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
    var url = "http://192.168.1.113/handinhand/outStudent.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var red = json.decode(res.body);
      setState(() {
        list.addAll(red);
      });
      print(list);
    }
  }

  List Data = [];
  Future Suggestion() async {
    var url = "http://192.168.1.113/handinhand/suggestion.php";
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
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch(data: Data));
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
                      child: Image.network("http://192.168.1.113/handinhand/" +
                          list[i]["image"]),
                    ),
                  ),
                ),
              );
            }));
  }
}

class DataSearch extends SearchDelegate {
  List data = [];
  DataSearch({required this.data});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {
      query = "";
    }, icon: Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query,
    style: TextStyle(fontSize: 20),);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var datasuggestion = query.isEmpty ? data : data.where((element) => element.toString().toLowerCase().contains(query)).toList();
    return ListView.builder(
      itemCount: datasuggestion.length,
    itemBuilder: (ctn,index){
      return ListTile(
        onTap: (){
          query = datasuggestion[index];
          showResults(context);
        },
        leading: Icon(Icons.person),
        title: Text('${datasuggestion[index]}'),);});
  }
}
