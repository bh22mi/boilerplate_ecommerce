import 'package:flutter/material.dart';
import 'package:flutter_demo/Animation_Gesture/page_dragger.dart';
import 'package:flutter_demo/Animation_Gesture/page_reveal.dart';
import 'package:flutter_demo/Screens/homescreen.dart';
import 'package:flutter_demo/Screens/loginscreen.dart';
import 'package:flutter_demo/UI/pager_indicator.dart';
import 'dart:async';

import 'package:flutter_demo/UI/pages.dart';

void main() => runApp(new MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.white, accentColor: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    onGenerateRoute: (RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return new MyCustomRoute(
          builder: (_) => new LoginScreen(),
          settings: settings,
        );

      case '/home':
        return new MyCustomRoute(
          builder: (_) => new HomeScreen(),
          settings: settings,
        );
    }
  },
      routes: <String, WidgetBuilder>{
        '/screen1': (BuildContext context) => new OtherPage(),
        '/screen2': (BuildContext context) => new LoginScreen(),
        '/screen3': (BuildContext context) => new HomeScreen(),


      },
    ));

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        radius: 50.0,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                        'Flutt Kart',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      'Online Store\nFor EveryOne',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => [
              Navigator.of(context).pushReplacementNamed('/screen1'),
            ]);

  }
}

class OtherPage extends StatefulWidget {
  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> with TickerProviderStateMixin {

  StreamController<SlideUpdate> slideUpdateStream;
  AnimatedPageDragger animatedPageDragger;

  int activeIndex = 0 ;
  SlideDirection slideDirection = SlideDirection.none;
  int nextPageIndex = 0 ;
  double slidePercent= 0.0;


  _OtherPageState(){
    slideUpdateStream = new StreamController<SlideUpdate>();

    slideUpdateStream.stream.listen((SlideUpdate event){
      setState(() {
        if( event.updateType == UpdateType.dragging){
          slideDirection = event.direction;
          slidePercent = event.slidePercent;

          if( slideDirection == SlideDirection.leftToRight ){
            nextPageIndex = activeIndex - 1;
          } else if (slideDirection == SlideDirection.rightToLeft){
            nextPageIndex = activeIndex + 1;
          } else{
            nextPageIndex = activeIndex;
          }
        } else if( event.updateType == UpdateType.doneDragging){
          if(slidePercent > 0.5){

            animatedPageDragger = new AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.open,
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );

          } else{
            animatedPageDragger = new AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.close,
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );

            nextPageIndex = activeIndex;
          }

          animatedPageDragger.run();
        }
        else if( event.updateType == UpdateType.animating){
          slideDirection = event.direction;
          slidePercent = event.slidePercent;
        }

        else if (event.updateType == UpdateType.doneAnimating){
          activeIndex = nextPageIndex;

          slideDirection = SlideDirection.none;
          slidePercent = 0.0;

          animatedPageDragger.dispose();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: [
          new Page(
            viewModel: pages[activeIndex],
            percentVisible: 1.0 ,
          ),
          new PageReveal(
            revealPercent: slidePercent,
            child: new Page(
              viewModel: pages[nextPageIndex],
              percentVisible: slidePercent ,
            ),
          ),
          new PagerIndicator(
            viewModel: new PagerIndicatorViewModel(
              pages,
              activeIndex,
              slideDirection,
              slidePercent,
            ),
          ),
          new PageDragger(
            canDragLeftToRight: activeIndex > 0 ,
            canDragRightToLeft: activeIndex < pages.length - 1 ,
            slideUpdateStream: this.slideUpdateStream,
          ),
          new Positioned(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: new Align(
                    alignment: FractionalOffset.topRight,
                    child: GestureDetector(
                      onTap: (){Navigator.of(context).pushReplacementNamed('/screen2');},
                      child: Text('Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                      ),),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
