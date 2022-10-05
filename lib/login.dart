import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText=true;
  final _emailcontroller=TextEditingController();
  final _passwordcontroller=TextEditingController();

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
              child: Text("Welcome!", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: "Roboto",
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
                    controller: _emailcontroller,
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
                    controller: _passwordcontroller,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password, color: Colors.pink),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      )
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 30,),
                  Container(
                    child: ElevatedButton(
                      onPressed: (){
                        print("login");
                      },
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(300, 50),
                        backgroundColor: Colors.white,
                        foregroundColor: Color.fromARGB(255, 216, 51, 122),
                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
                        textStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400
                        )
                        
                      )
                      ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: InkWell(
                        onTap: () {
                          
                        },
                        child: Text("Forget Password?",style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),),
                      ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 75),
                    child: Text("Don't have an account?",style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),),
                      
                  ),
                  SizedBox(height: 15,),

                  Container(
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text("Create", style: TextStyle(fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 50),
                        backgroundColor: Colors.white,
                        foregroundColor: Color.fromARGB(255, 216, 51, 122),
                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        textStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                        )
                      )
                      ),
                  )
            ],)))
          ],
        ),
        ),
       ),
    );
  }
}