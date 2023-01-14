import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:index/creditional.dart';

class AddHelp extends StatefulWidget {
  //const AddHelp({super.key});
  final String value;
  const AddHelp({Key? key, required this.value}) : super(key: key);
  @override
  State<AddHelp> createState() => _AddHelpState();
}

class _AddHelpState extends State<AddHelp> {
  String donate = '';
  TextEditingController helpCon = TextEditingController();
  TextEditingController amountmoney = TextEditingController();
  TextEditingController cost = TextEditingController();
  TextEditingController thingname = TextEditingController();
  bool editmode = false;
  String typed = '';

  Future addingHelp() async {
    print( widget.value);
        print( donate);
    print(amountmoney.text);
    print( thingname.text);
print(cost.text);
    print( helpCon.text);
    
    var url = "http://" + IPADDRESS + "/handinhand/addhelp.php";
    if (typed == 'money') {
      var response = await http.post(Uri.parse(url), body: {
        "email": widget.value,
        "typed": donate,
        "money": amountmoney.text,
        "thingname": '',
        "cost": '',
        "post": helpCon.text,
      });
      var data = await json.decode(response.body);
      if (data == "Success") {
        Fluttertoast.showToast(
            msg: "Requested Successfully".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 203, 158, 211),
            textColor: Colors.purple,
            fontSize: 16);
      } else {
        Fluttertoast.showToast(
            msg: "Request Faild".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
      }
    } else if (typed == 'physical') {
      var response = await http.post(Uri.parse(url), body: {
        "email": widget.value,
        "typed": donate,
        "money": '',
        "thingname": thingname.text,
        "cost": cost.text,
        "post": helpCon.text,
      });
      var data = await json.decode(response.body);
      if (data == "Success") {
        Fluttertoast.showToast(
            msg: "Requested Successfully".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 203, 158, 211),
            textColor: Colors.purple,
            fontSize: 16);
      } else {
        Fluttertoast.showToast(
            msg: "Request Faild".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Donation Request".tr,
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Choose the type of donate you would request..".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.purple),
                      focusColor: MaterialStateColor.resolveWith(
                          (states) => Colors.purple),
                      value: "money",
                      groupValue: donate,
                      onChanged: (val) {
                        setState(() {
                          donate = val!;
                          print(donate);
                          typed = donate;
                        });
                      }),
                  Text(
                    "Tuition fee".tr,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Radio(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.purple),
                      focusColor: MaterialStateColor.resolveWith(
                          (states) => Colors.purple),
                      value: "physical",
                      groupValue: donate,
                      onChanged: (val) {
                        setState(() {
                          donate = val!;
                          typed = donate;
                          print(donate);
                        });
                      }),
                  Text(
                    "Physical thing".tr,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              child: typed == 'money'
                  ? Column(
                      children: [
                        Text(
                          "The amonut of money you need:".tr,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: amountmoney,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.purple,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.purple, width: 2))),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text("The name of thing you need:".tr,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        TextFormField(
                          controller: thingname,
                          keyboardType: TextInputType.name,
                          cursorColor: Colors.purple,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.purple, width: 2))),
                        ),
                        SizedBox(height: 10,),
                        Column(
                          children: [
                            Text("The cost of it:".tr,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            TextFormField(
                              controller: cost,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.purple,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.purple, width: 2))),
                            ),
                          ],
                        )
                      ],
                    ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your post:".tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Card(
                margin: EdgeInsets.all(10),
                color: Color.fromARGB(255, 197, 175, 201),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: helpCon,
                    maxLines: 8, //or null
                    decoration: InputDecoration.collapsed(
                        hintText: "Enter your text here".tr,
                        hintStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    addingHelp();
                  },
                  child: Text(
                    "Request to post".tr,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
