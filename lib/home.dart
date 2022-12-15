import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:index/apply_loans.dart';
import 'package:index/asking_for_help.dart';
import 'package:index/chat.dart';
import 'package:index/creditional.dart';
import 'package:index/login.dart';
import 'package:index/profile.dart';
import 'package:index/scholarship.dart';

class Home extends StatefulWidget {
  final String value;
  //const Home({super.key});
  const Home({Key? key, required this.value}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String emailvalue = widget.value;
  double value = 0;
  PickedFile? _imagefile;
  final ImagePicker _picker = ImagePicker();
  
  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: [
        Text(
          "Profile photo".tr,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Row(
                children: [
                  Icon(
                    Icons.camera,
                    color: Colors.purple,
                  ),
                  Text(
                    "Camera".tr,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              onTap: () {
                takePhoto(ImageSource.camera);
              },
            ),
            SizedBox(
              width: 50,
            ),
            InkWell(
              child: Row(
                children: [
                  Icon(
                    Icons.image,
                    color: Colors.purple,
                  ),
                  Text(
                    "Gallery".tr,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              onTap: () {
                takePhoto(ImageSource.gallery);
              },
            )
          ],
        )
      ]),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imagefile = pickedFile!;
    });
  }

  /*Future setEmail() async{
    var url = "http://192.168.1.33/handinhand/home.php";
    var res = await http.post(Uri.parse(url),body: {
      "email":emailvalue,
    });
    
  }*/
  Future GetData() async {
    var url = "http://" + IPADDRESS + "/handinhand/home.php";
    var res = await http.get(Uri.parse(url));
    var red = json.decode(res.body);
    return red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.purple[400]!,
              Colors.purple[800]!,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
        ),
        SafeArea(
            child: Container(
          width: 200.0,
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                      radius: 50.0,
                      backgroundImage: _imagefile == null
                          ? null
                          : FileImage(File(_imagefile!.path))
                      /*backgroundImage: _imageFile == null 
                        ? AssetImage("lib/imgs/nopic.png") 
                        : FileImage(File(_imageFile.path)),*/
                      ),
                  Positioned(
                      bottom: 4,
                      right: 4,
                      child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet()));
                          },
                          child: Icon(
                            Icons.camera_alt,
                            color: Color.fromARGB(255, 219, 203, 203),
                            size: 28,
                          ))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                //"user@gmail.com",
                widget.value,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    profile(value: emailvalue)));
                        //Navigator.of(context).pushNamed("profile");
                      },
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Profile".tr,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed("family_data");
                      },
                      leading: Icon(
                        Icons.family_restroom,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Family Data".tr,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        //Navigator.of(context).pushNamed("qualifications");
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                applyLoans(value: emailvalue)));
                      },
                      leading: Icon(
                        Icons.money,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Loan Request".tr,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed("outstanding_students");
                        /*Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                applyLoans(value: emailvalue)));*/
                      },
                      leading: Icon(
                        Icons.man,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Outstanding Students".tr,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AskForHelp(value: emailvalue)));
                      },
                      leading: Icon(
                        Icons.help,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Asking For Help".tr,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed("contactus");
                      },
                      leading: Icon(
                        Icons.contact_mail_sharp,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Contact us".tr,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed("settings");
                      },
                      leading: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Settings".tr,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed("login");
                      },
                      leading: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Log out".tr,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(milliseconds: 500),
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, int.parse("x".tr) * 0.001)
                  ..setEntry(0, 3, int.parse("x".tr) * 200 * val)
                  ..rotateY((pi / 6) * val),
                child: Scaffold(
                    appBar: AppBar(
                      title: Text(
                        "Home".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Colors.purple,
                      actions: [
                        IconButton(
                          icon: Icon(Icons.notifications),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.chat),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(value: emailvalue)));
                          },
                        ),
                      ],
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
                                          color: Color.fromARGB(
                                              255, 198, 126, 211),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: ListTile(
                                        title: Text(
                                          "${snapshot.data[i]["sname"]}",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          "${snapshot.data[i]["description"]}",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        leading: Container(
                                          child: Image.asset(
                                            "lib/imgs/scholarship.png",
                                            width: 50,
                                            height: 100,
                                          ),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Scholarship(
                                                        value:
                                                            "${snapshot.data[i]["sname"]}",
                                                        value1:
                                                            "${snapshot.data[i]["conditions"]}",
                                                        value2:
                                                            "${snapshot.data[i]["percentage"]}",
                                                        value3:
                                                            "${snapshot.data[i]["attachments"]}",
                                                        emailv: emailvalue,
                                                      )));
                                        },
                                      ),
                                    ),
                                  );
                                })
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    )),
              ));
            }),
        GestureDetector(onHorizontalDragUpdate: (details) {
          if (int.parse("x".tr) * details.delta.dx > 0) {
            setState(() {
              value = 1;
            });
          } else {
            setState(() {
              value = 0;
            });
          }
        }),
      ],
    ));
  }
}
