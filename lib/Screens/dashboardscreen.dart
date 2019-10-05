import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String title;

  HomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CircleImages(),
      ),
    );
  }
}

class CircleImages extends StatefulWidget {
  @override
  _CircleImagesState createState() => _CircleImagesState();
}

class _CircleImagesState extends State<CircleImages> {

  List<String> listofImages = [
    "https://images.unsplash.com/photo-1547157283-087711e7858f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1547152850-11ac68bbe48f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1547149639-94838200b639?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1547149683-35abbbc2ee42?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1543362905-f2423ef4e0f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1547087145-c26f26347c07?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1547078352-7721c3ad49a8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 90.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(5.0),
                  itemCount: listofImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        new Container(
                            height: 80.0,
                            width: 80.0,
                            margin: EdgeInsets.only(
                                left: 5.0,
                                right: 5.0
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                border: Border.all(
                                    width: 1.0,
                                    style:BorderStyle.none ,
                                    color: Color.fromARGB(255, 0 , 0, 0)
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(listofImages[index])
                                )

                            )
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/winter_sale.jpg", fit: BoxFit.cover,
                scale: 2,
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children :<Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,top:8.0),
                    child: Text('Trending Now',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                  ),
                  Container(
                    height: 140.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all(5.0),
                      itemCount: listofImages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              new Container(
                                  child: new Column(
                                    children: <Widget>[
                                    ],
                                  ),
                                  height: 140.0,
                                  width: 220.0,
                                  margin: EdgeInsets.only(
                                      left: 5.0,
                                      right: 5.0
                                  ),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(listofImages[index])
                                      )

                                  )
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ]
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children :<Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,top:8.0),
                      child: Text('Just In',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),
                    ),
                    Container(
                      height: 120.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(5.0),
                        itemCount: listofImages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                new Container(
                                    child: new Column(
                                      children: <Widget>[
                                      ],
                                    ),
                                    height: 120.0,
                                    width: 120.0,
                                    margin: EdgeInsets.only(
                                        left: 5.0,
                                        right: 5.0
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(listofImages[index])
                                        )

                                    )
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ]
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children :<Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,top:8.0),
                      child: Text('Top Picks',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),
                    ),
                    Container(
                      height: 300.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(5.0),
                        itemCount: listofImages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                new Container(
                                    height: 300.0,
                                    width: 250.0,
                                    margin: EdgeInsets.only(
                                        left: 5.0,
                                        right: 5.0
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(listofImages[index])
                                        )

                                    )
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ]
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text('')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//return Container(
//height: 90.0,
//child: ListView(
//scrollDirection: Axis.horizontal,
//padding: EdgeInsets.all(5.0),
//children: widegets,
//),
//);
