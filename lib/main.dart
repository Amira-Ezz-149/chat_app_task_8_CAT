import 'package:chat_app_task_8_cat/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_task_8_cat/screens/welcome_screen.dart';

import 'package:chat_app_task_8_cat/screens/log_in.dart';
import 'package:chat_app_task_8_cat/screens/registration_screen.dart';
import 'package:chat_app_task_8_cat/screens/chat_screen.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatefulWidget {
  @override
  _FlashChatState createState() => _FlashChatState();
}

class _FlashChatState extends State<FlashChat> {
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) =>  WelcomeScreen(),
        LoginScreen.id: (context) =>  LoginScreen(),
       HomeScreen.id: (context) =>  HomeScreen(),
        RegistrationScreen.id: (context) =>  RegistrationScreen(),
        ChatScreen.id: (context) =>  ChatScreen(),
      },
    );
  }
}
