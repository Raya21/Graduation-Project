import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  onChangeFunction1(bool newValue1){
    setState(() {
      valNotify1=newValue1;
    });
  }
  onChangeFunction2(bool newValue2){
    setState(() {
      valNotify2=newValue2;
    });
  }
  onChangeFunction3(bool newValue3){
    setState(() {
      valNotify3=newValue3;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Settings"),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), 
        onPressed: () {  
          Navigator.pop(context);
        },),
        ),
       body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 40,),
            Row(
              children: [
                Icon(Icons.person, color: Colors.purple,),
                SizedBox(height: 10,),
                Text("Account",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
              ],
            ),
            Divider(height: 20, thickness: 1,),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Change Password", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,color: Colors.grey
                ),),
                    Icon(
                      Icons.arrow_forward_ios, 
                      color: Colors.grey,
                      ),
                  ],
                  ),
                  onTap: (){
                    Navigator.of(context).pushNamed("forget_password");
                  },
              ),
              ),
            
            buildAccountOption(context, "Content Settings"),
            buildAccountOption(context, "Social"),
            buildAccountOption(context, "Language"),
            buildAccountOption(context, "Privacy and Security"),
            SizedBox(height: 40,),
            Row(
              children: [
                Icon(Icons.person, color: Colors.purple,),
                SizedBox(height: 10,),
                Text("Notifications",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
              ],
            ),
            Divider(height: 20, thickness: 1,),
            SizedBox(height: 10,),
            buildNotificationOption("Theme Dark", valNotify1,onChangeFunction1),
            buildNotificationOption("Account Active", valNotify2,onChangeFunction2),
            buildNotificationOption("Opportunity", valNotify3,onChangeFunction3),
            
          ],
        ),
       ),
    
    );
  }
  Padding buildNotificationOption(String title, bool value, Function onChangeMethod){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,color: Colors.grey
            ),),
            Transform.scale(scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.purple,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
              ),
            )
        ],
      ),
      );
  }
  GestureDetector buildAccountOption(BuildContext context, String title){
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  child: Text("Arabic",style: TextStyle(fontSize: 20),),
                  onTap: () {
                    print("عربي");
                  },
                ),               
                InkWell(
                  child: Text("English",style: TextStyle(fontSize: 20),),
                  onTap: () {
                    print("eglish");
                  },
                  )
              ],
            ),
            actions: [
              TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Colse", style: TextStyle(color: Colors.purple),))
            ],
            );
        });
      }
      ,child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,color: Colors.grey
            ),),
            Icon(Icons.arrow_forward_ios, color: Colors.grey,),
          ],
        ),
      ),
    );

  }
}