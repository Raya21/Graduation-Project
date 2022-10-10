import 'package:flutter/material.dart';


class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
 int _currentIndex = 0;
  List <Widget> pages = [personInfo(),contactInfo(),eduInfo(),attachments()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.purple,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.purple,
        selectedItemColor: Color.fromARGB(255, 218, 136, 233),
        unselectedItemColor: Colors.white,
        onTap: (value) {
          setState(() {
            _currentIndex=value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Personal Info",
            backgroundColor: Colors.purple
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: "Contact Info",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cast_for_education),
            label: "Educational Info",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attachment),
            label: "Attachments",
          ),
        ],
        
      ),
      body: pages.elementAt(_currentIndex),
    );
  }
}
class personInfo extends StatefulWidget {
  const personInfo({super.key});

  @override
  State<personInfo> createState() => _personInfoState();
}

class _personInfoState extends State<personInfo> {
   String selectedIncome = "-";
   String selectedGender = "Male";
   String selectedSS = "Single";
   DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child:SingleChildScrollView(
        child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text("Full Name:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
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
            alignment: Alignment.topLeft,
          child: Text("ID:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple)
              )
            ),
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Align(
            alignment: Alignment.topLeft,
          child: Text("Date Of Birth:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("${dateTime.day}/${dateTime.month}/${dateTime.year}",  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),)
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
          child:
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
            child: Text("Choose Date", style: TextStyle(color: Colors.white),),
            onPressed: () async{
              DateTime? birthDate = await showDatePicker(
                context: context, 
                initialDate: dateTime, 
                firstDate: DateTime(1950), 
                lastDate: DateTime(2010)
                );
                if(birthDate == null) return;
                setState(() {
                  dateTime = birthDate;
                });
            }, 
            ),),
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.topLeft,
          child: Text("Birth Palce:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple)
              )
            ),
          ),
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.topLeft,
          child: Text("City:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple)
              )
            ),
          ),
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.topLeft,
            child:Text("Average Income:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Align(
            alignment: Alignment.topLeft,
          child:
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.purple,
                    width: 1,
                    style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(5)
            ),
            child: DropdownButton(
              items: ["-","0-500 NIS","500-1000 NIS","1000-1500 NIS","1500-2000 NIS","2000-3000 NIS","More than 3000 NIS"].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(), 
              onChanged: (val) {
                setState(() {
                  selectedIncome=val!;
                });
              },
              value: selectedIncome,
            ),
          ),),
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.topLeft,
          child:Text("Gender:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          Align(
            alignment: Alignment.topLeft,
          child:Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.purple,
                    width: 1,
                    style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(5)
            ),
            child: DropdownButton(
              items: ["Male","Female"].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(), 
              onChanged: (val) {
                setState(() {
                  selectedGender=val!;
                });
              },
              value: selectedGender,
            ),
          ),),
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.topLeft,
          child:Text("Social Status:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          Align(
            alignment: Alignment.topLeft,
          child:Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.purple,
                    width: 1,
                    style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(5)
            ),
            child: DropdownButton(
              items: ["Single","Married"].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(), 
              onChanged: (val) {
                setState(() {
                  selectedSS=val!;
                });
              },
              value: selectedSS,
            ),
          ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
              onPressed: (() {}), 
              child: Text("Save")
              ),
          )
        ],
      ),
      ), 
      
    );
  }
}
class contactInfo extends StatefulWidget {
  const contactInfo({super.key});

  @override
  State<contactInfo> createState() => _contactInfoState();
}

class _contactInfoState extends State<contactInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
            alignment: Alignment.topLeft,
          child:Text("Telephone Number:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
            alignment: Alignment.topLeft,
          child:Text("Mobile Phone Number:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple)
              )
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
              onPressed: (() {}), 
              child: Text("Save")
              ),
          )
          ],
      )),
    );
  }
}
class eduInfo extends StatefulWidget {
  const eduInfo({super.key});

  @override
  State<eduInfo> createState() => _eduInfoState();
}

class _eduInfoState extends State<eduInfo> {
  String selectedBranch = "Study branch";
  String selectedDegree = "Undergraduate degree";
  String selectedYear = "Academic year";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
          child:Text("High Scool Information:",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),),
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.topLeft,
          child:Text("Year of enrollment:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
            alignment: Alignment.topLeft,
          child:Text("School:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
            alignment: Alignment.topLeft,
          child:Text("Grade:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
            alignment: Alignment.topLeft,
          child:Text("Study Branch:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          Align(
            alignment: Alignment.topLeft,
          child:Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.purple,
                    width: 1,
                    style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(5)
            ),
            child: DropdownButton(
              items: ["Study branch","scientific","literary","commercial","Industrial"].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(), 
              onChanged: (val) {
                setState(() {
                  selectedBranch=val!;
                });
              },
              value: selectedBranch,
            ),
          ),
          ),
          SizedBox(height: 30,),
          Align(
            alignment: Alignment.topLeft,
          child:Text("University Information:", style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),),
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.topLeft,
          child:Text("Undergraduate degree:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          Align(
            alignment: Alignment.topLeft,
          child:Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.purple,
                    width: 1,
                    style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(5)
            ),
            child: DropdownButton(
              items: ["Undergraduate degree","Diploma","BA","Master's","PhD"].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(), 
              onChanged: (val) {
                setState(() {
                  selectedDegree=val!;
                });
              },
              value: selectedDegree,
            ),
          ),),
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.topLeft,
          child:Text("University:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
            alignment: Alignment.topLeft,
          child:Text("College:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
            alignment: Alignment.topLeft,
          child:Text("Department:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
            alignment: Alignment.topLeft,
          child:Text("Academic Year:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          Align(
            alignment: Alignment.topLeft,
          child:Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.purple,
                    width: 1,
                    style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(5)
            ),
            child: DropdownButton(
              items: ["Academic year","First","Second","Third","Fourth","Fifth","Sixth","Seventh"].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(), 
              onChanged: (val) {
                setState(() {
                  selectedYear=val!;
                });
              },
              value: selectedYear,
            ),
          ),),
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.topLeft,
          child:Text("GPA:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
            alignment: Alignment.topLeft,
          child:Text("University ID:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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
            alignment: Alignment.topLeft,
          child:Text("Year of enrollment:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          TextFormField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)
            )
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
              onPressed: (() {}), 
              child: Text("Save")
              ),
          )
        ],)
        )
    );
  }
}
class attachments extends StatefulWidget {
  const attachments({super.key});

  @override
  State<attachments> createState() => _attachmentsState();
}

class _attachmentsState extends State<attachments> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
            alignment: Alignment.topLeft,
          child:Text("ID:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            SizedBox(height: 15,),
            Align(
            alignment: Alignment.topLeft,
          child:Text("High school transcripts:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            SizedBox(height: 15,),
            Align(
            alignment: Alignment.topLeft,
          child:Text("Student Card:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            SizedBox(height: 15,),
            Align(
            alignment: Alignment.topLeft,
          child:Text("Transcript for the last semester:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
            SizedBox(height: 15,),
            SizedBox(height: 20,),
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
              onPressed: (() {}), 
              child: Text("Save")
              ),
          )
          ],
        )
      ),
    );
  }
}