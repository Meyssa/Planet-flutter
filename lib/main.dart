import 'package:flutter/material.dart';
import 'planet.dart';
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

    );
  }
}

class PlanetRow extends StatelessWidget{

  final Planet planet;
  PlanetRow(this.planet);



  @override
  Widget build(BuildContext context) {

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
              new Image.asset("img/ic_gravity.png", height: 12.0),
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
        onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => DetailPage(planet)) ) ,
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

class DetailPage extends StatelessWidget{
  final Planet planet;
  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {

    final background =  new Container(
      child: new Image.asset('img/background.jpg',
          fit: BoxFit.cover,
          height: 300.0),
      constraints: new BoxConstraints.expand(height:300.0),

    );

    final content = new ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        new PlanetSummary(planet),
        new Container (
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text("OVERVIEW", style: headerTextStyle,),
              new Container(
                margin: new EdgeInsets.symmetric(vertical: 8.0),
                height: 2.0,
                width: 18.0,
                color: new Color(0xff00c6ff),
              ),
              new Text(planet.description, style: commonTextStyle,)
            ],
          ),
        )
      ],
    ); // list view to make the content scrollable
    return new Scaffold(
      appBar: AppBar(
        title: Text(planet.name),
      ),
      body : new Container(
        constraints:  new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
            background,
            content,
          ],
        ),
      ),
    );
  }
}

class PlanetSummary extends StatelessWidget{
  final Planet planet;
  PlanetSummary(this.planet);


  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.center,
      child: Image.asset(planet.image, height: 92.0, width: 92.0,),
    );
    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(16.0, 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container (height: 4.0),
          new Text(planet.name , style: headerTextStyle,),

          new Container (height: 10.0),
          new Text(planet.location, style: subHeaderTextStyle ),
          new Container (
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 18.0,
            color: new Color(0xff00c6ff),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset("img/ic_distance.png", height: 12.0),
              new Container (width: 8.0),
              new Text(planet.distance, style: regularTextStyle,),

              new Container(width: 24.0),
              new Image.asset("img/ic_gravity.png", height: 12.0),
              new Container (width: 8.0),
              new Text(planet.gravity, style: regularTextStyle)
            ],
          )
        ],
      ),
    );

        final planetCard = new Container(
              child: planetCardContent,
              height:  154.0 ,
              margin: new EdgeInsets.only(top: 72.0),
          decoration: new BoxDecoration(
            color: new Color(0xFF333366),
            borderRadius: new BorderRadius.circular(8.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0),
              ),
            ],
          ),
        );


        return new Container(
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
        );
  }

}
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

final commonTextStyle = baseTextStyle.copyWith(
    color: const Color(0xffb6b2df),
    fontSize: 14.0,
    fontWeight: FontWeight.w400);

List<Planet> planets = [
  const Planet(
      id: "1",
      name: "Mars",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System after Mercury. In English, Mars carries a name of the Roman god of war, and is often referred to as the 'Red Planet' because the reddish iron oxide prevalent on its surface gives it a reddish appearance that is distinctive among the astronomical bodies visible to the naked eye. Mars is a terrestrial planet with a thin atmosphere, having surface features reminiscent both of the impact craters of the Moon and the valleys, deserts, and polar ice caps of Earth.",
      image: "img/mars.png",
      picture: "https://www.nasa.gov/sites/default/files/thumbnails/image/pia21723-16.jpg"
  ),
  const Planet(
      id: "2",
      name: "Neptune",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Neptune is the eighth and farthest known planet from the Sun in the Solar System. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet. Neptune is 17 times the mass of Earth and is slightly more massive than its near-twin Uranus, which is 15 times the mass of Earth and slightly larger than Neptune. Neptune orbits the Sun once every 164.8 years at an average distance of 30.1 astronomical units (4.50×109 km). It is named after the Roman god of the sea and has the astronomical symbol ♆, a stylised version of the god Neptune's trident",
      image: "img/neptune.png",
      picture: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/images/110411main_Voyager2_280_yshires.jpg"
  ),
  const Planet(
      id: "3",
      name: "Moon",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "The Moon is an astronomical body that orbits planet Earth, being Earth's only permanent natural satellite. It is the fifth-largest natural satellite in the Solar System, and the largest among planetary satellites relative to the size of the planet that it orbits (its primary). Following Jupiter's satellite Io, the Moon is second-densest satellite among those whose densities are known.",
      image: "img/moon.png",
      picture: "https://farm5.staticflickr.com/4086/5052125139_43c31b7012.jpg"
  ),
  const Planet(
      id: "4",
      name: "Earth",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Earth is the third planet from the Sun and the only object in the Universe known to harbor life. According to radiometric dating and other sources of evidence, Earth formed over 4 billion years ago. Earth's gravity interacts with other objects in space, especially the Sun and the Moon, Earth's only natural satellite. Earth revolves around the Sun in 365.26 days, a period known as an Earth year. During this time, Earth rotates about its axis about 366.26 times.",
      image: "img/earth.png",
      picture: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss042e340851_1.jpg"
  ),
  const Planet(
      id: "5",
      name: "Mercury",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Mercury is the smallest and innermost planet in the Solar System. Its orbital period around the Sun of 88 days is the shortest of all the planets in the Solar System. It is named after the Roman deity Mercury, the messenger to the gods.",
      image: "img/mercury.png",
      picture: "https://c1.staticflickr.com/9/8105/8497927473_2845ae671e_b.jpg"
  ),
];
