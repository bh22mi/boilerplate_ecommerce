import 'package:flutter/material.dart';
import 'package:flutter_demo/Components/Form.dart';
import 'package:flutter_demo/Components/SignInButton.dart';
import 'package:flutter_demo/Components/SignUpLink.dart';
import 'package:flutter_demo/Components/WhiteTick.dart';
import 'package:flutter_demo/Components/validations.dart';
import 'styles.dart';
import 'loginAnimation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {

  AnimationController _loginButtonController;
  var animationStatus = 0;


  @override
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      Navigator.of(context).pushReplacementNamed('/home');
//      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }


  @override
  Widget build(BuildContext context) {


    return (new Scaffold(
      body: new Container(
          decoration: new BoxDecoration(
            image: backgroundImage,
          ),
          child: new Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    colors: <Color>[
                      const Color.fromRGBO(98	, 41, 120, 0.9),
                      const Color.fromRGBO(129, 84, 147, 0.9),
                    ],
                    stops: [0.5, 1.0],
                    begin: const FractionalOffset(0.0, 3.0),
                    end: const FractionalOffset(0.0, 5.0),
                  )),
              child: new ListView(
                padding: const EdgeInsets.all(0.0),
                children: <Widget>[
                  new Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Tick(image: tick),
                          new FormContainer(),
                          new SignUp()
                        ],
                      ),
                      animationStatus == 0
                          ? new Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: new InkWell(
                            onTap: () {
                              setState(() {
                                animationStatus = 1;
                              });
                              _playAnimation();

                            },
                            child: new SignIn()),
                      )
                          : new StaggerAnimation(
                          buttonController:
                          _loginButtonController.view),
                    ],
                  ),
                ],
              ))),
    ));
  }
}


