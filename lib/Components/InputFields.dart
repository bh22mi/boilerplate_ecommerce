import 'package:flutter/material.dart';
import 'package:flutter_demo/Components/validations.dart';

class InputFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  var validateFunction;

  InputFieldArea({this.hint, this.obscure, this.icon, this.validateFunction});
  @override
  Widget build(BuildContext context) {
    return (new Container(
      decoration: new BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0),
        borderRadius: new BorderRadius.all(const Radius.circular(30.0)),

      ),
      child: new TextFormField(
        validator: validateFunction,
        obscureText: obscure,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0
        ),
        decoration: new InputDecoration(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Icon(
              icon,
              color: Colors.white,

            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
          contentPadding: const EdgeInsets.only(
              top: 15.0, right: 10.0, bottom: 15.0, left: 0.0),
        ),
      ),
    ));
  }
}
