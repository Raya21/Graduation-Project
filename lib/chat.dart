import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mailer/mailer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:index/creditional.dart';

final firestore = FirebaseFirestore.instance;
late String email;

class ChatScreen extends StatefulWidget {
  final String value;
  const ChatScreen({Key? key, required this.value}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  String? messageText;
/*void getMessage() async{
  final messages = await firestore.collection('messages').get();
  for(var message in messages.docs){
    print(message.data());
  }
}*/

  void messageStream() async {
    await for (var snapshot in firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  void initState() {
    email = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "Chat",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                email = "";
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MessageStreamBuilder(),
          Container(
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: Colors.purple, width: 2))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: messageTextController,
                    onChanged: (value) {
                      messageText = value;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        hintText: "Write your message here...",
                        border: InputBorder.none),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      firestore.collection('messages').add({
                        'text': messageText,
                        'sender': widget.value,
                        'time': FieldValue.serverTimestamp()
                      });
                    },
                    child: Text(
                      "Send",
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ))
              ],
            ),
          )
        ],
      )),
    );
  }
}

class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('messages').orderBy('time').snapshots(),
        builder: (context, snapshot) {
          List<MessageLine> messageWidgets = [];
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.purple),
            );
          }
          final messages = snapshot.data!.docs;
          for (var message in messages) {
            final messageText = message.get('text');
            final messageSender = message.get('sender');
            final currentUser = email;
            if (currentUser == messageSender) {}
            final messageWidget = MessageLine(
              sender: messageSender,
              text: messageText,
              isMe: currentUser == messageSender,
            );
            messageWidgets.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              children: messageWidgets,
            ),
          );
        });
  }
}

class MessageLine extends StatefulWidget {
  final String? sender;
  final String? text;
  final bool isMe;
  const MessageLine({Key? key, this.text, this.sender, required this.isMe})
      : super(key: key);
  @override
  State<MessageLine> createState() => _MessageLineState();
}

class _MessageLineState extends State<MessageLine> {
  Future<String> getUsername(String em) async {
    var url = "http://" + IPADDRESS + "/handinhand/getusername.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": em,
    });
    var data = await json.decode(response.body);

    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          FutureBuilder(
              future: getUsername('${widget.sender}'),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? Text(widget.isMe ? "" : "${snapshot.data}",
                        style: TextStyle(fontSize: 20, color: Colors.purple))
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              }),
          /**/
          Material(
            elevation: 5,
            borderRadius: widget.isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
            color: widget.isMe ? Colors.purple[400] : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "${widget.text}",
                style: TextStyle(
                    fontSize: 20, color: widget.isMe ? Colors.white : Colors.purple),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
