import 'package:flutter/material.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/imgs/background.jpg"),
            fit: BoxFit.cover,
            )
        ),
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(height: 30,),
            Center(
              child: Image.asset("lib/imgs/logo.png",width: 150,height: 150,),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(top:10),
              child: Text("Reset Password", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.pink),
                      hintText: "E-mail",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    obscureText: true,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password, color: Colors.pink),
                      hintText: "Old password",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    obscureText: true,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password, color: Colors.pink),
                      hintText: "New password",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      )
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text("Confirm"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 50),
                        backgroundColor: Colors.white,
                        foregroundColor: Color.fromARGB(255, 216, 51, 122),
                        padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
                        textStyle: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w400
                        )
                        
                      )
                      ),
                  ),
                  
            ],)))
          ],
        ),
        ),
        ),
    );
  }
}