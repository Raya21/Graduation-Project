import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double value=0;
  PickedFile? _imagefile;
  final ImagePicker _picker = ImagePicker();
  Widget bottomSheet(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: [
          Text("Choose Profile photo", style: TextStyle(
            fontSize: 20,
          ),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Row(children: [
                  Icon(Icons.camera),
                  Text("Camera"),
                ],),
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
                ),
                SizedBox(width: 50,),
                InkWell(
                child: Row(children: [
                  Icon(Icons.image),
                  Text("Gallery"),
                ],),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple[400]!,
                  Colors.purple[800]!,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              ),
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
                      Positioned(bottom: 4,
                      right: 4,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context, 
                          builder: ((builder)=>bottomSheet()));
                        },
                        child: Icon(
                          Icons.camera_alt,
                          color: Color.fromARGB(255, 219, 203, 203),
                          size: 28,))
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("user@gmail.com",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed("profile");
                          },
                          leading: Icon(Icons.person, color: Colors.white,),
                          title: Text("Profile", style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed("family_data");
                          },
                          leading: Icon(Icons.family_restroom, color: Colors.white,),
                          title: Text("Family Data", style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed("qualifications");
                          },
                          leading: Icon(Icons.money, color: Colors.white,),
                          title: Text("Loan Request", style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed("contactus");
                          },
                          leading: Icon(Icons.contact_mail_sharp, color: Colors.white,),
                          title: Text("Contact us", style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed("settings");
                          },
                          leading: Icon(Icons.settings, color: Colors.white,),
                          title: Text("Settings", style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed("login");
                          },
                          leading: Icon(Icons.logout, color: Colors.white,),
                          title: Text("Log out", style: TextStyle(color: Colors.white),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          
          ),
          TweenAnimationBuilder(tween: Tween<double>(begin: 0,end:value), duration: Duration(milliseconds: 500), builder: (_, double val ,__){
            return(
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..setEntry(0, 3, 200*val)
            ..rotateY((pi/6)*val),
            child: Scaffold(
              appBar: AppBar(
                title: Text("Home"),
                backgroundColor: Theme.of(context).primaryColor,
                actions: [IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                  
                },),
                IconButton(
                  icon: Icon(Icons.chat),
                  onPressed: () {
                  
                },),
                ],
              ),
             // body: ,
            ),
            ));
          }),
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              if(details.delta.dx>0){
                setState(() {
                  value=1;
                });
              }else{
                setState(() {
                  value=0;
                });
              }
            }
            
          ),
        ],
      )
      
    );
  }
}