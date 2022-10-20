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
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage("lib/imgs/nopic.png"),
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
                            
                          },
                          leading: Icon(Icons.money, color: Colors.white,),
                          title: Text("Loan Request", style: TextStyle(color: Colors.white),),
                        ),
                        ListTile(
                          onTap: () {
                            
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
                backgroundColor: Colors.purple,
                actions: [IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                  
                },),],
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