import 'package:flutter/material.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Language"),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: () {  },),
      ),
      body: Container(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          SizedBox(height: 40,),
          buildAccountOption(context, "Arabic"),
          Divider(height: 20, thickness: 1,),
          buildAccountOption(context, "English"),
        ],
      )
    ),
    );
    
  }
   GestureDetector buildAccountOption(BuildContext context, String title){
    return GestureDetector(
      onTap: () {
        print("hi");
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