import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:index/forget_password.dart';
import 'package:http/http.dart' as http;
import 'package:index/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText=true;
  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  String _errorMessage = '';
  

  Future login() async{
    var url = "http://192.168.0.1/htdocs/swproject/login.php";
    var response=await http.post(Uri.parse(url),body:{
      "email": emailcontroller.text,
      "password":passwordcontroller.text,
    });
    var data=jsonDecode(response.body);
    if(data == "Success"){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()))
    }
  }

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
                    controller: emailcontroller,
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
                    onChanged: (val){
                      validateEmail(val);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_errorMessage, style: TextStyle(color: Colors.red),),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: passwordcontroller,
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
                        login();
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
                          Navigator.of(context).pushReplacementNamed("forget_password");
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
  void validateEmail(String val){
    if(val.isEmpty){
  setState(() {
    _errorMessage = "Email can not be empty";
  });
    }else if(!EmailValidator.validate(val, true)){
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    }else{
      setState(() {

        _errorMessage = "";
      });
    }
  }
}