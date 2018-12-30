import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
class Map extends StatefulWidget {
  @override
  _Map createState() => _Map();
}

class _Map extends State<Map> {

  bool mapToogle = false;
  var currentLocation;
  @override
  void initState(){
    super.initState();
    Geolocator().getCurrentPosition().then((currentlocation){
      setState(() {
              currentLocation=currentlocation;
              mapToogle = true;
            });
    });
  }

  GoogleMapController _googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Locales"),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height -80.0,
                width:  double.infinity,
                child: mapToogle ?
                GoogleMap(
                  onMapCreated: (controller){
                // setState(() {
                    _googleMapController = controller;           
                // });
                  },
                  options: GoogleMapOptions(
                    compassEnabled: true,
                    //mapType: ,
                    cameraPosition: CameraPosition(
                      target: LatLng(currentLocation.latitude,currentLocation.longitude),
                      
                      zoom: 20.0
                    )
                  ),
                ):
                Center(
                  child: Text("Cargando... Espere"),
                ),
              )
            ],
          )
        ],
      ),

      // appBar: AppBar(
      //   bottomOpacity: 50.0,
      //   actions: <Widget>[
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         IconButton(
      //           icon: Icon(Icons.search),
      //           onPressed: (){

      //           },
      //         ),
      //         IconButton(
      //           icon: Icon(Icons.map),
      //           onPressed: (){

      //           },
      //         )
      //       ],
      //     )
      //   ],
      // ),
    //   body: Container(
    //         height: double.infinity,
    //         width: double.infinity,
    //         child: GoogleMap(
    //           onMapCreated: (controller){
    //             // setState(() {
    //               _googleMapController = controller;           
    //             // });
    //           },
    //           options: GoogleMapOptions(
    //             compassEnabled: true,
    //             //mapType: ,
    //             cameraPosition: CameraPosition(
    //               target: LatLng(-38.740, -72.598),
                  
    //               zoom: 13.2
    //             )
    //           ),
    //         ),
            
    //     ),
    // floatingActionButton: IconButton(
    //   icon: Icon(Icons.add_circle_outline),
    //   color: Colors.red,
    //   onPressed: _googleMapController == null ? null : () {
    //     _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
    //       CameraPosition(
    //           target: LatLng(-33.4489, -70.6693),
    //           zoom: 13.2,
    //           tilt: 30.0
    //       )
    //     ));
    //   },
    // ),          
        

        
      
    );
  }

  // void _showUserProfile(Firebase user){
  //   bui
  // }
}