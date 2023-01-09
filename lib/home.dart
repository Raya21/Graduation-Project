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
import 'package:index/chatmenu.dart';
import 'package:index/company.dart';
import 'package:index/contactus.dart';
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
  String imagePath = " ";
  int flag = 0;
  var image = " ";
  var _image;
  final picker = ImagePicker();
  Future getProfileImage() async {
    try {
      var f = 0;
      var url = "http://" + IPADDRESS + "/handinhand/viewProfileImage.php";
      var response = await http.post(Uri.parse(url), body: {
        "email": emailvalue,
      });
      List list = await json.decode(response.body);
      if (list[0] == "nopic.png") {
        f = 1;
      }

      if (mounted)
        setState(() {
          if (f == 0) {
            image = "lib/ProfileImages/${list[0]['image']}";
          } else if (f == 1) {
            image = "lib/ProfileImages/nopic.png";
          }

          // image =
          //     "http://192.168.1.10/handinhand/ProfileImages/${list[0]['image']}";
        });

      return (image);
    } catch (e) {
      print(e.toString());
    }
  }

  List _allScholar = [];
  Future GetData2() async {
    var url = "http://" + IPADDRESS + "/handinhand/home.php";
    var res = await http.post(Uri.parse(url), body: {
      "email": emailvalue,
    });
    //print(res.body);
    var red = json.decode(res.body);
    setState(() {
      _allScholar.addAll(red);
    });
  }

  List _allLoan = [];
  Future GetLoans2() async {
    var url = "http://" + IPADDRESS + "/handinhand/home_loans.php";
    var res = await http.post(Uri.parse(url), body: {
      "email": emailvalue,
    });
    //print(res.body);
    var red = json.decode(res.body);
    setState(() {
      _allLoan.addAll(red);
    });
  }

  List _foundScholar = [];
  List _foundLoan = [];

  @override
  void initState() {
    _foundScholar = _allScholar;
    _foundLoan = _allLoan;
    //getProfileImage();
    super.initState();
    GetData2();
    GetLoans2();
  }

  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = _allScholar;
    } else {
      results = _allScholar
          .where((scholar) => scholar["sname"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundScholar = results;
    });
  }

  void _runFilter2(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = _allLoan;
    } else {
      results = _allLoan
          .where((loan) => loan["lname"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundLoan = results;
    });
  }

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
    var pickedImage = await picker.getImage(source: source);
    setState(() {
      _image = File(pickedImage!.path);
      imagePath = pickedImage.path;
    });
    print(imagePath);
    uploadImage();
  }

  Future uploadImage() async {
    final uri = await Uri.parse(
        "http://" + IPADDRESS + "/handinhand/uploadProfileImg.php");
    //image
    var request1 = http.MultipartRequest('POST', uri);
    request1.fields['email'] = (emailvalue).toString();
    var pic1 = await http.MultipartFile.fromPath("image", _image.path);
    request1.files.add(pic1);
    var response1 = await request1.send();

    if (response1.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Image Not Uploaded");
    }
  }

  Future GetCompanies() async {
    try {
      var url = "http://" + IPADDRESS + "/handinhand/getcompany.php";
      var res = await http.get(Uri.parse(url));
      var red = json.decode(res.body);
      return red;
    } catch (e) {
      print(e.toString());
    }
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
              FutureBuilder(
                  future: getProfileImage(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _image == null ? 1 : 0,
                            itemBuilder: (cts, i) {
                              return Stack(
                                children: [
                                  CircleAvatar(
                                      radius: 50.0,
                                      backgroundImage:
                                          AssetImage(snapshot.data)),
                                  Positioned(
                                      bottom: 4,
                                      right: 85,
                                      child: InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: ((builder) =>
                                                    bottomSheet()));
                                          },
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Color.fromARGB(
                                                255, 219, 203, 203),
                                            size: 28,
                                          ))),
                                ],
                              );
                            })
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  }),
              Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _image == null ? 0 : 1,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        CircleAvatar(
                            radius: 50.0, backgroundImage: FileImage(_image)),
                        Positioned(
                            bottom: 4,
                            right: 4,
                            //left: 4,
                            //top: 4,
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
                    );
                  },
                ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ContactUs(value: emailvalue)));
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
                    automaticallyImplyLeading: false,
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
                  body: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: TextField(
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          cursorColor: Colors.purple,
                          onChanged: (value) => _runFilter(value),
                          decoration: InputDecoration(
                            labelText: "Search".tr,
                            labelStyle: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            suffixIcon:
                                Icon(Icons.search, color: Colors.purple),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Icon(Icons.label_important, color: Colors.purple),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Scholarships :".tr,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: _foundScholar.isNotEmpty
                            ? ListView.builder(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _foundScholar[0] == "No data"
                                    ? 0
                                    : _foundScholar.length,
                                itemBuilder: (cts, i) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 198, 126, 211),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: ListTile(
                                      title: Text(
                                        "${_foundScholar[i]["sname"]}",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        "${_foundScholar[i]["description"]}",
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
                                                      scholarship_id: int.parse(
                                                          "${_foundScholar[i]["scholarship_id"]}"),
                                                      value:
                                                          "${_foundScholar[i]["sname"]}",
                                                      value1:
                                                          "${_foundScholar[i]["conditions"]}",
                                                      value2:
                                                          "${_foundScholar[i]["percentage"]}",
                                                      value3:
                                                          "${_foundScholar[i]["attachments"]}",
                                                      emailv: emailvalue,
                                                    )));
                                      },
                                    ),
                                  ),
                                ),
                              )
                            : Center(
                                child: Text(
                                  'No results found'.tr,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: TextField(
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          cursorColor: Colors.purple,
                          onChanged: (value) => _runFilter2(value),
                          decoration: InputDecoration(
                            labelText: "Search".tr,
                            labelStyle: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            suffixIcon:
                                Icon(Icons.search, color: Colors.purple),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          margin: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Icon(Icons.label_important, color: Colors.purple),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Loans :".tr,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      Container(
                        child: _foundLoan.isNotEmpty
                            ? ListView.builder(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _foundLoan[0] == "No data"
                                    ? 0
                                    : _foundLoan.length,
                                itemBuilder: (cts, i) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 198, 126, 211),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: ListTile(
                                      title: Text(
                                        "${_foundLoan[i]["lname"]}",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        "${_foundLoan[i]["description"]}",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      leading: Container(
                                        child: Image.asset(
                                          "lib/imgs/loan.PNG",
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
                                                    applyLoans(
                                                      loan_id: int.parse(
                                                          "${_foundLoan[i]["loan_id"]}"),
                                                      value:
                                                          "${_foundLoan[i]["lname"]}",
                                                      value1:
                                                          "${_foundLoan[i]["conditions"]}",
                                                      value2:
                                                          "${_foundLoan[i]["percentage"]}",
                                                      value3:
                                                          "${_foundLoan[i]["attachments"]}",
                                                      emailv: emailvalue,
                                                    )));
                                      },
                                    ),
                                  ),
                                ),
                              )
                            : Center(
                                child: Text(
                                  'No results found'.tr,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Divider(thickness: 1, color: Colors.grey, height: 1,),
                      Container(
                          margin: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Icon(Icons.label_important, color: Colors.purple),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Joint Stock Companies :".tr,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      FutureBuilder(
                        future: GetCompanies(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) print(snapshot.error);
                          return snapshot.hasData
                              ? ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
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
                                            "${snapshot.data[i]["cname"]}",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          leading: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Image.asset(
                                                "lib/companyImages/" +
                                                    snapshot.data[i]["image"]),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                          ),
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        company(
                                                          value:
                                                              "${snapshot.data[i]["cname"]}",
                                                          value1:
                                                              "${snapshot.data[i]["description"]}",
                                                          value2:
                                                              "${snapshot.data[i]["image"]}",
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
                      )
                    ],
                  ),
                ),
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
