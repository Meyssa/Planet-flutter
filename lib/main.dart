import 'package:flutter/material.dart';

void main () => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Planets",
      home: HomePage(),
    );
  }
}

class DetailPage extends StatelessWidget{
  final Planet planet;
  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:  new AppBar(
        title: new Text("Planet Detail"),
      ),
      body: new Center(
        child: new RaisedButton(
        onPressed: () => Navigator.pop(context),
        child: new Text("<<< Go back"),
      )
      ),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Planets'),
      ),
      body: new ListView.builder(
      itemBuilder : (context , index) => new PlanetRow(planets[index]),
    itemCount : planets.length),
      //backgroundColor: Color(0x3E3963)

    );
  }
}

class PlanetRow extends StatelessWidget{

  final Planet planet;
  PlanetRow(this.planet);



  @override
  Widget build(BuildContext context) {

    final baseTextStyle = const TextStyle(
        fontFamily: 'Poppins'
    );

    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600
    );
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400
    );

    final subHeaderTextStyle = regularTextStyle.copyWith(
        fontSize: 12.0
    );

    final planetCardContent = new Container(
      margin : new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child:  new Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container (height: 4.0),
          new Text(planet.name, style: headerTextStyle),

          new Container (height: 10.0),
          new Text(planet.location,
            style: subHeaderTextStyle,
          ),

          new Container (
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 18.0,
            color: new Color(0xff00c6ff),
          ),

          new Row(
            children: <Widget>[
              new Image.asset("img/ic_distance.png", height: 12.0),
              new Container (width: 8.0),
              new Text(planet.distance, style: regularTextStyle),

              new Container(width: 24.0),
              new Image.asset("img.ic_gravity.png", height: 12.0),
              new Container (width: 8.0),
              new Text(planet.gravity, style: regularTextStyle),

            ],
          )

        ],
      ),
    );
    final planetCard = new Container(
      height: 124.0,
      margin : new EdgeInsets.only(left : 46.0),
      decoration: new BoxDecoration(
          color : new Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius:  new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset:  new Offset(0.0, 10.0)
            )
          ]
      ),
    child: planetCardContent,
    );


    final planetThumbnail = new Container (
        margin: new EdgeInsets.symmetric(
            vertical: 16.0
        ),
        alignment: FractionalOffset.centerLeft,
        child: new Image(image:
        new AssetImage(planet.image),
          height: 92.0,
          width: 92.0,
        )
    );

    return new GestureDetector(
        onTap: () => Navigator.of(context).push(new PageRouteBuilder(pageBuilder:(_, __, ___) => new DetailPage(planet),)),
          child :new Container(
          height: 120.0,
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              planetCard,
              planetThumbnail,
            ],
          ),
        ),
    );
  }
}

class Planet {
  final String id;
  final String name;
  final String location;
  final String distance;
  final String gravity;
  final String description;
  final String image;
  
  const Planet({
    this.description, this.distance, this.gravity,this.id,
    this.image, this.location,this.name
});
}

List<Planet> planets = [
    const Planet(
          id: "1",
          name: "Mars",
          location: "Milkyway Galaxy",
          distance: "227.9m Km",
          gravity: "3.711 m/s ",
          description: "Lorem ipsum...",
         image: "img/mars.png",
        ),
    const Planet(
          id: "2",
          name: "Neptune",
          location: "Milkyway Galaxy",
          distance: "54.6m Km",
          gravity: "11.15 m/s ",
          description: "Lorem ipsum...",
          image: "img/neptune.png",
        ),
    const Planet(
          id: "3",
          name: "Moon",
          location: "Milkyway Galaxy",
          distance: "54.6m Km",
          gravity: "1.622 m/s ",
          description: "Lorem ipsum...",
          image: "img/moon.png",
        ),
    const Planet(
          id: "4",
          name: "Earth",
          location: "Milkyway Galaxy",
          distance: "54.6m Km",
          gravity: "9.807 m/s ",
          description: "Lorem ipsum...",
          image: "img/earth.png",
        ),
    const Planet(
          id: "5",
          name: "Mercury",
          location: "Milkyway Galaxy",
          distance: "54.6m Km",
          gravity: "3.7 m/s ",
          description: "Lorem ipsum...",
          image: "img/mercury.png",
        ),
  ];
