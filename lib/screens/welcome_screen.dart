import 'package:chat_app_task_8_cat/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_app_task_8_cat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app_task_8_cat/screens/log_in.dart';
import 'package:chat_app_task_8_cat/components/customized_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = ColorTween(begin: Colors.pink.shade100, end: Colors.white)
        .animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {
        //print(animation.value);
      });
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      // backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/chat_image.png'),
            ),
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Welcome Back!'],
                  textStyle: TextStyle(
                    color: pinkShade400,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            RoundedButton(
              color: pinkShade200,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              title: 'log in',
            ),
            RoundedButton(
              color: pinkShade400,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              title: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
