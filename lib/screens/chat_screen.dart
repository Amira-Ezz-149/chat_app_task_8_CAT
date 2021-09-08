import 'package:chat_app_task_8_cat/components/message_bubble.dart';
import 'package:chat_app_task_8_cat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_task_8_cat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore = FirebaseFirestore.instance;
User loggedInUser;

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

ChatScreen chatScreen = ChatScreen();

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  static String messageText;
  static String userName;
  final messageController = TextEditingController();

  //============================= init state
  //===========================================================
  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

//================================ getCurrentUser
// ======================================================
  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) loggedInUser = user;
      print(' this is from getCurrentUser method ${loggedInUser.email}');
    } catch (e) {
      print(e);
    }
  }

  //======================================= getMessages
  //==========================================================================
  void getMessages() async {
    final messages = _fireStore.collection('messages').snapshots();
    await for (var snapShot in messages) {
      for (var message in snapShot.docs) {
        print('getMessages ${message.data()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {

                _auth.signOut();
                Navigator.pushNamed(context, WelcomeScreen.id);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: pinkShade400,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        messageController.clear();
                        _fireStore.collection('messages').add({
                          'text': messageText,
                          'sender': loggedInUser.email
                        });
                      },
                      child: Icon(
                        Icons.send_outlined,
                        color: pinkShade400,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection('messages').snapshots(),
      builder: (context, snapShot) {
        if (!snapShot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final messages = snapShot.data.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          //solution
          final messageText = message.get('text');
          final messageSender = message.get('sender');
          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            text: messageText,
            sender: messageSender,
            isMe: currentUser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
