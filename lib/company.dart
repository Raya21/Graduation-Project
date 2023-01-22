import 'package:flutter/material.dart';
import 'package:get/get.dart';

class company extends StatefulWidget {
  final String value, value1, value2;
  const company(
      {Key? key,
      required this.value,
      required this.value1,
      required this.value2})
      : super(key: key);

  @override
  State<company> createState() => _companyState();
}

class _companyState extends State<company> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.value,
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
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Column(children: [
          Container(
            child: Image.asset("lib/companyImages/" + widget.value2),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.value1,
            style: TextStyle(fontSize: 20),
          )
        ])),
      ),
    );
  }
}
