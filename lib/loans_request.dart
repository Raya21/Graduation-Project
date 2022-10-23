import 'package:flutter/material.dart';

class Loans extends StatefulWidget {
  const Loans({super.key});

  @override
  State<Loans> createState() => _LoansState();
}

class _LoansState extends State<Loans> {
  TextEditingController fname = TextEditingController();
  TextEditingController Mphone = TextEditingController();
  TextEditingController city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Loans Requests"),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), 
        onPressed: () {  
          Navigator.pop(context);
        },),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Advantages", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  SizedBox(width: 25,),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text("Easy and convenient procedures", style: TextStyle(color: Colors.white, fontSize: 20, ),), 
                  color: Color.fromARGB(255, 212, 132, 226),
                  width: 150,
                  height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Text("Declining interest rate", style: TextStyle(color: Colors.white, fontSize: 20, ),), 
                  color: Color.fromARGB(255, 212, 132, 226),
                  width: 150,
                  height: 100,
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Text("Warranties",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.black,size: 10,),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Text("Sponsorship of the student’s guardian + a salary sponsor.",style: TextStyle(fontSize: 20),)
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.black,size: 10,),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Text("Two sponsors with regular salaries have been added on our side in the event that the student’s guardian does not have a salary, with the addition of his moral sponsorship.",style: TextStyle(fontSize: 20),)
                  )
                ],
              ),
              SizedBox(height: 40,),
              Text("Apply",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextFormField(
            controller: fname,
            cursorColor: Colors.purple,
            decoration: InputDecoration(
              labelText: "Full Name",
              labelStyle: TextStyle(color: Colors.black),
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)
            )
            ),
          ),
          SizedBox(height: 15,),
          TextFormField(
            controller: Mphone,
            cursorColor: Colors.purple,
            decoration: InputDecoration(
              labelText: "Mobile Phone Number",
              labelStyle: TextStyle(color: Colors.black),
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)
            )
            ),
          ),
          SizedBox(height: 15,),
          TextFormField(
            controller: city,
            cursorColor: Colors.purple,
            decoration: InputDecoration(
              labelText: "City",
              labelStyle: TextStyle(color: Colors.black),
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)
            )
            ),
          ),
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              padding: EdgeInsets.symmetric(vertical: 13,horizontal: 22),
              shape: RoundedRectangleBorder( 
                borderRadius: BorderRadius.circular(30)
            ),
            ),
              onPressed: (() {}), 
              child: Text("Send", style: TextStyle(fontSize: 20),)
              ),
          )
            ],
            )
          ),
      ),
    );
  }
}