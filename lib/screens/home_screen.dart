import 'package:chat_app_task_8_cat/constants.dart';
import 'package:chat_app_task_8_cat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'Home Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        backgroundColor: pinkShade400,
      ),
      body: ListView.separated(
          padding: EdgeInsets.all(10.0),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ChatScreen.id);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: pinkShade200,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 16,
                    left: MediaQuery.of(context).size.width / 2.5),
                height: 100,
                width: 100,
                child: Text(
                  'Chat ${index + 1} ',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 20.0,
            );
          },
          itemCount: 3),
    );
  }
}
