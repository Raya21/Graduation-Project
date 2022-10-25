import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplyLoans extends StatefulWidget {
  const ApplyLoans({super.key});

  @override
  State<ApplyLoans> createState() => _ApplyLoansState();
}

class _ApplyLoansState extends State<ApplyLoans> {
  late Future<void> _launched;
  String _launchUrl = 'https://eservices.iqrad.edu.ps/';
  Future<void> _launchInBroswer(String url)async{
    if(await canLaunch(url)){
      await launch(url,forceSafariVC: false,forceWebView: false,headers: <String,String>{'header_key':'header_value'},);

    }else{
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Apply for a loan",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
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
              Text("At the beginning of each semester, the Lending Fund announces the start of receiving loan applications for needy students in Palestinian higher education institutions for a specified period of time. The student wishing to submit a request must do the following:",style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),

                Align(child: Text("1.Fill out the application through",style: TextStyle(fontSize: 20),), alignment: Alignment.topLeft,),
              Align(child: InkWell(onTap: (){
                  _launchInBroswer(_launchUrl);
              },child: Text("the electronic services link",style: TextStyle(fontSize: 20, color: Colors.purple),),),alignment: Alignment.topLeft,),
              Align(child: Text("through the student's account.",style: TextStyle(fontSize: 20),),alignment: Alignment.topLeft),
              SizedBox(height: 15,),
              Text("2. The student submits all the documents and supporting documents required of him to the Deanship of Student Affairs and his request is checked directly and he receives a proof of submission and verification form. In the event that the student does not complete this step, his request is considered incomplete and is not considered.",style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),
              Text("3. In the event the student loses his user name and/or password, he must refer to the Student Affairs Department at his educational institution to be provided with a new password.",style: TextStyle(fontSize: 20),),
            ],
        )),
      ),
    );
  }
}