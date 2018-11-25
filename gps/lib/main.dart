import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

const API_KEY = "AIzaSyAuQc6Fh5BKC8LvEpWvb6rQM75RK1eAV44";


void main() {
  MapView.setApiKey(API_KEY);
  runApp(new MaterialApp(
      home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  MapView mapView = MapView();

  Marker marker = new Marker('1', 'Bus', 26.84264648, 75.56468724, color: Colors.red);

  void showMap() {
    mapView.onMapReady.listen((_){
      mapView.setMarkers([marker]);
    });
    mapView.show(new MapOptions(
      mapViewType: MapViewType.normal,
      showUserLocation: true,
      initialCameraPosition: new CameraPosition(
          new Location(26.84264648, 75.56468724), 16.0),
      title: "Current Bus Location",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.search, color: Colors.white,),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            color: Colors.blue,
            onPressed: (){
              showMap();
            },
            child: Text('BUS Location'),
          ),
        ),
      ),
    );
  }
}





