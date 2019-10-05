import 'package:flutter/material.dart';
import 'package:flutter_demo/Model/ProfileList.dart';
import 'package:flutter_demo/Screens/ProfileDetail.dart';
import 'package:flutter_demo/Screens/homescreen.dart';
import 'package:flutter_demo/Screens/loginscreen.dart';
import 'package:path/path.dart';
import 'package:flutter_demo/Screens/loginscreen.dart';

class ProfilePage extends StatefulWidget {
  String title;

  ProfilePage(this.title);

  @override
  ProfilePageState createState() {
    return new ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  List<Profile> _categories = [
    Profile('Orders', 'Check your order history', Icons.shopping_cart),
    Profile(
        'Saved Cards', 'Save your card for faster checkout', Icons.credit_card),
    Profile('Address', 'Save address for hastle free checkout', Icons.place),
    Profile('Profile Details', 'Change your profile status', Icons.contacts),
    Profile('Coupons', 'Manage coupons for additional discounts',
        Icons.card_giftcard),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _status(int index, BuildContext context) {
      // ignore: argument_type_not_assignable
      if (index == 0) {
//        Navigator.push(
//            context, MaterialPageRoute(builder: (_) => new ProfileDetails()));
      } else if (index == 1) {
//        Navigator.push(
//            context, MaterialPageRoute(builder: (_) => new ProfileDetails()));
      } else if (index == 2) {
//        Navigator.push(
//            context, MaterialPageRoute(builder: (_) => new ProfileDetails()));
      } else if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => new ProfileDetails()));
      } else if (index == 4) {
//        Navigator.push(
//            context, MaterialPageRoute(builder: (_) => new ProfileDetails()));
      }
    }

    final makeBody = Container(
      child: Expanded(
        flex: 4,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 60,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListTile(
                        onTap: () => _status(index, context),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.grey[700]))),
                          child: Icon(
                            _categories[index].image,
                            color: Colors.grey[700],
                            size: 20,
                          ),
                        ),
                        title: Text(
                          _categories[index].title,
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            Text(_categories[index].subtitle,
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 12))
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.grey[700], size: 20.0)),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(children: <Widget>[
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
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 8.0),
                child: new Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.height / 7,
                    margin: EdgeInsets.only(left: 5.0, right: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://www.eharmony.co.uk/dating-advice/wp-content/uploads/2011/04/profilephotos-960x640.jpg')))),
              ),
            ]),
            makeBody,
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
                "Log out",
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
    );
  }
}
