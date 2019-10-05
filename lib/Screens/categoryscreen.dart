import 'package:flutter/material.dart';
import 'package:flutter_demo/Model/Category.dart';

List<Category> vehicles = [
  new Category(
    'EOS',
    ['Men', 'Women', 'Kids'],
  ),
  new Category(
    'HOME',
    ['Bedsheets', 'Curtains', 'Cushions'],
  ),
  new Category(
    'KIDS',
    ['Bottomwear', 'Frocks', 'Footware'],
  ),
  new Category(
    'MEN',
    ['Formals', 'Bottomwear', 'Casual'],
  ),
  new Category(
    'WOMEN',
    ['T-shirts/Top', 'Bottomwear', 'Dresses'],
  ),
];

class CategoryPage extends StatefulWidget {
  String title;

  CategoryPage(this.title);

  @override
  CategoryPageState createState() {
    return new CategoryPageState();
  }
}

class CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new ExpandableListView(title: vehicles[index].title, subtitle: vehicles[index].contents,);
        },
        itemCount: 5,
      ),
    );
  }
}

class ExpandableListView extends StatefulWidget {
  final String title;
  final List<String> subtitle;

  const ExpandableListView({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  _ExpandableListViewState createState() => new _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {

  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 0.0),
      child: new Column(
        children: <Widget>[
          new Container(
            color: Colors.white,
            padding: new EdgeInsets.symmetric(horizontal: 10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  widget.title,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                new IconButton(
                    icon: new Container(
                      height: 50.0,
                      width: 50.0,
                      child: new Center(
                        child: new Icon(
                          expandFlag
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 20.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        expandFlag = !expandFlag;
                      });
                    }),
              ],
            ),
          ),
          new ExpandableContainer(
              expanded: expandFlag,
              child: new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Container(
                    decoration: new BoxDecoration(
                        color: Colors.white),
                    child: new ListTile(
                      title: new Text(
                        vehicles[index].contents[index],
                        style: new TextStyle(
                             color: Colors.deepPurple, fontSize: 12),
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ))
        ],
      ),
    );
  }

  _buildExpandableContent(Category vehicle) {
    List<Widget> columnContent = [];

    for (String content in vehicle.contents)
      columnContent.add(
        new ListTile(
          title: new Text(content, style: new TextStyle(fontSize: 18.0),),
        ),
      );

    return columnContent;
  }


}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    @required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 200.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new AnimatedContainer(
      duration: new Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: new Container(
        child: child,
        decoration: new BoxDecoration(
            border: new Border.all(width: .2, color: Colors.black)),
      ),
    );
  }
}
