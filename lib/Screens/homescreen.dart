import 'package:flutter/material.dart';
import 'package:flutter_demo/Screens/cartscreen.dart';
import 'package:flutter_demo/Screens/categoryscreen.dart';
import 'package:flutter_demo/Screens/dashboardscreen.dart';
import 'package:flutter_demo/Screens/notificationscreen.dart';
import 'package:flutter_demo/Screens/profilescreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 5, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2.0,
        title: Text('My App',
        style: TextStyle(
          color: Colors.black
        ),),
      ),

      body: new TabBarView(
        controller: _tabController,
        children: [
        new HomePage('Home'),
        new CategoryPage('Categories'),
        new NotificationPage('Notification'),
        new CartPage('Cart'),
        new ProfilePage('Profile'),
      ]),
      bottomNavigationBar: new Material(
        animationDuration: Duration(seconds: 1),
        shadowColor: Colors.black54,
        elevation: 5.0,
        color: Colors.white,
        child: TabBar(
          labelStyle: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            wordSpacing: 5.0
          ),
            labelColor: Colors.deepPurple,
            unselectedLabelColor: Colors.grey,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: Colors.deepPurple,
                width: 2.0
              )
            ),
            controller: _tabController,
            tabs: <Widget>[
          new Tab(
            icon: new Icon(Icons.home,
              color: _tabController.index == 0
                  ? Colors.deepPurple
                  : Colors.grey),
          ),
          new Tab(
            icon: new Icon(Icons.category,
            color: _tabController.index == 1
                ? Colors.deepPurple
                : Colors.grey),
          ),
          new Tab(
            icon: new Icon(Icons.notifications,
              color: _tabController.index == 2
                  ? Colors.deepPurple
                  : Colors.grey),
          ),
          new Tab(
            icon: new Icon(Icons.shopping_cart,
              color: _tabController.index == 3
                  ? Colors.deepPurple
                  : Colors.grey),
          ),
          new Tab(
            icon: new Icon(Icons.account_circle,
              color: _tabController.index == 4
                  ? Colors.deepPurple
                  : Colors.grey),
          )
        ]),
      ),
    );
  }
}









