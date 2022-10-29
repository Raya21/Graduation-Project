import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        )),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset(
                  "lib/imgs/logo.png",
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Sign Up".tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Form(
                      child: Column(
                    children: [
                      TextFormField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person, color: Colors.pink),
                            hintText: "User Name".tr,
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: Colors.pink),
                            hintText: "E-mail".tr,
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.password, color: Colors.pink),
                            hintText: "Password".tr,
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Sign up text".tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Create Account".tr,
                            ),
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(300, 50),
                                backgroundColor: Colors.white,
                                foregroundColor:
                                    Color.fromARGB(255, 216, 51, 122),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                textStyle: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "have an account".tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          InkWell(
                            child: Text(
                              "Sign In".tr,
                              style: TextStyle(
                                color: Color.fromARGB(255, 216, 51, 122),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )))
            ],
          ),
        ),
      ),
    );
  }
}
