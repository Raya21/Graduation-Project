import 'package:flutter/material.dart';

class Qualifications extends StatefulWidget {
  const Qualifications({super.key});

  @override
  State<Qualifications> createState() => _QualificationsState();
}

class _QualificationsState extends State<Qualifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Conditions for applying for a loan"),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), 
        onPressed: () {  
          Navigator.pop(context);
        },),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("1. The applicant must be a regular student in one of the higher education institutions in Palestine and financially needy (in the undergraduate or intermediate diploma program only).",style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),
              Text("2. He must have successfully passed at least one semester.",style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),
              Text("3. The student's cumulative academic average should not be less than 65% for undergraduate students and 60% for diploma students or its equivalent.",style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),
              Text("4. That the student is not a beneficiary or holder of a university scholarship or a scholarship or financial aid from any other source that exceeds his needs.",style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),
              Text("5. The candidate must have registered at least 12 credit hours in the semester in which he applied for the loan or grant.",style: TextStyle(fontSize: 20),),
              Divider(height: 20,thickness: 1,),
              Text("Notes:",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Text("1. The percentage of opportunities that the student obtains is calculated based on the criteria of need, and the highest percentage that the student may obtain is 75% of the tuition fees only (without registration fees, internet...etc.)",style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),
              Text("2. In addition to Note No. 1, the loan amount provided by the Fund does not exceed 1,000 Jordanian dinars in any case for one student in one semester.",style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),
              Text("3. Parallel education students: their tuition fees are calculated according to the regular approved fees (not according to the prices of parallel studies).",style: TextStyle(fontSize: 20),),
              SizedBox(height: 30,),
              Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              padding: EdgeInsets.symmetric(vertical: 13,horizontal: 22),
              shape: RoundedRectangleBorder( 
                borderRadius: BorderRadius.circular(30)
            ),
            ),
              onPressed: () {
                Navigator.of(context).pushNamed("loans_request");
              }, 
              child: Text("Apply for a loan", style: TextStyle(fontSize: 20),)
              ),
          )
          ],)
          ),
      ),
    );
  }
}