import 'package:flutter/material.dart';
import 'package:interinship_task/services/animations.dart';

import 'home_task_key/view.dart';
import 'main_page/view.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            FadeAnimation(delay: 3,
            child:   const Text("Welcome to my app"
              ,textAlign: TextAlign.center,
            ),),
            SizedBox(height: 20,),
            FadeAnimation(delay: 4,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    alignment: Alignment.center,
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder:
                        (context)=> Main_pagePage()));
                  }, child: Text("Go contact"))),
            FadeAnimation(delay: 4,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    alignment: Alignment.center,
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder:
                        (context)=> Home_task_keyPage()));
                  }, child: Text("Go contact"))),


          ],
        ),
      ),
    );
  }
}
