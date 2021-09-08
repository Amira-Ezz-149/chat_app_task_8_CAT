import 'package:flutter/material.dart';
class MessageBubble extends StatelessWidget {
  const MessageBubble({this.sender, this.text, this.isMe});

  final String sender, text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 12.0, color: Colors.black45),
          ),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                topLeft: isMe? Radius.circular(20.0) : Radius.circular(0.0),
                topRight: isMe? Radius.circular(0.0) : Radius.circular(20.0) ),

            color: isMe? Colors.pink.shade400 : Colors.white,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                '$text',
                style: TextStyle(fontSize: 15.0, color: isMe? Colors.white : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
