import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Photo grid",
    home: new Home(),
    theme: ThemeData(
      primarySwatch: Colors.red
    ),

    ));
}
class Home extends StatefulWidget {
  @override
 
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> listphotos = new List();
  var character=[
    { "name":"Audi", "image":"assets/a.jpg"},
    { "name":"Ferrari", "image":"assets/b.jpg"},
    { "name":"BMW", "image":"assets/c.jpg"},
    { "name":"lambo", "image":"assets/d.jpg"},
  ];
   _alllist()async {
     for (var i=0; i<character.length; i++ ){
       final newcharacter = character[i];
       final String image = newcharacter["image"];
      listphotos.add(
        new Container(child: new Card( child:
          new Column(
            children: <Widget>[
              new Image.asset(image, fit: BoxFit.cover,),
              new Text(newcharacter['name'], style: new TextStyle(fontSize: 18.0),)
            ],
          )
        )
        )

      );
     }
   }

  @override
  void initState(){
    _alllist();
    super.initState();
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Photos", style: new TextStyle(color:Colors.white)),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: listphotos
      ),
      drawer: Drawer(
        elevation: 5.0,
        child: _buildDrawer(),
      ),
    );
  }
}
Widget _buildDrawer()
{
  return ListView(children: <Widget>[
DrawerHeader(
  decoration: BoxDecoration(
    color: Colors.red
  ),
  child: Text("SuperCars"),
),
ListTile(
  leading: Icon(Icons.home),
  title: Text("Home"),
  onTap: (){},
),
ListTile(
  leading: Icon(Icons.people),
  title: Text("Contact"),
  onTap: (){},
)


  ],);
}