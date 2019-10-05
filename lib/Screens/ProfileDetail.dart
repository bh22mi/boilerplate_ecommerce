import 'package:flutter/material.dart';
import 'package:flutter_demo/Components/InputFields.dart';

class ProfileDetails extends StatefulWidget {
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
                children: <Widget>[
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: new Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "http://damnprofilecovers.com/app/template/587.jpg")))),
              ),
              Center(
                heightFactor: 1.5,
                  widthFactor: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      new Container(
                          height: MediaQuery.of(context).size.height / 7,
                          width: MediaQuery.of(context).size.height / 7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://www.eharmony.co.uk/dating-advice/wp-content/uploads/2011/04/profilephotos-960x640.jpg')))),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Hello', style: TextStyle(color: Colors.white),),
                      ),

                    ],
                  ))
            ]),
            new Form(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new TextFormField(
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 14.0,
                          ),
                          decoration: new InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                            ),
                            hintText: 'First Name',
                            hintStyle: const TextStyle(color: Colors.deepPurple,fontSize: 14),
                            contentPadding: const EdgeInsets.only(
                                top: 15.0, right: 10.0, bottom: 25.0, left: 0.0),
                          ),
                        ),
                        new TextFormField(
                          style: const TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 14.0,
                          ),
                          decoration: new InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                            ),
                            hintText: 'Last Name',
                            hintStyle: const TextStyle(color: Colors.deepPurple,fontSize: 14),
                            contentPadding: const EdgeInsets.only(
                                top: 15.0, right: 10.0, bottom: 25.0, left: 0.0),
                          ),
                        ),
                        new TextFormField(
                          style: const TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 14.0,
                          ),
                          decoration: new InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                            ),
                            hintText: 'Email',
                            hintStyle: const TextStyle(color: Colors.deepPurple,fontSize: 14),
                            contentPadding: const EdgeInsets.only(
                                top: 15.0, right: 10.0, bottom: 25.0, left: 0.0),
                          ),
                        ),
                        new TextFormField(
                          style: const TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 14.0,
                          ),
                          decoration: new InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                            ),
                            hintText: 'Phone Number',
                            hintStyle: const TextStyle(color: Colors.deepPurple,fontSize: 14),
                            contentPadding: const EdgeInsets.only(
                                top: 15.0, right: 10.0, bottom: 25.0, left: 0.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          width: MediaQuery.of(context).size.width/1.1,
                          height: MediaQuery.of(context).size.height/11,
                          alignment: FractionalOffset.center,
                          decoration: new BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            border: Border.all(color: Colors.red),
                            borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
                          ),
                          child: new Text(
                            "Save Details",
                            style: new TextStyle(
                              color: Colors.red,
                              fontSize: 18.0,
                              letterSpacing: 0.3,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );

  }
}
