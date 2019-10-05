import 'package:flutter/material.dart';
import 'package:flutter_demo/Components/validations.dart';
import './InputFields.dart';

class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Validations validations = new Validations();
    return (new Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Form(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new InputFieldArea(
                  hint: "Username",
                  obscure: false,
                  icon: Icons.person_outline,
                  validateFunction: validations.validateEmail),
              new Padding(padding: EdgeInsets.all(5.0)),
              new InputFieldArea(
                  hint: "Password",
                  obscure: true,
                  icon: Icons.lock_outline,
                  validateFunction: validations.validatePassword),
            ],
          )),
        ],
      ),
    ));
  }
}
