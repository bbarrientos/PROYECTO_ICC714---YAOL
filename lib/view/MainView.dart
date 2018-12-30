import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainView extends StatefulWidget {
  @override
  _MainView createState() => _MainView();
}

class _MainView extends State<MainView> {
  GoogleMapController _googleMapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottomOpacity: 50.0,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: (){

                },
              ),
              IconButton(
                icon: Icon(Icons.map),
                onPressed: (){

                },
              )
            ],
          )
        ],
      ),
      body: Container(
            height: double.infinity,
            width: double.infinity,
            child: GoogleMap(
              onMapCreated: (controller){
                // setState(() {
                  _googleMapController = controller;           
                // });
              },
              options: GoogleMapOptions(
                compassEnabled: true,
                //mapType: ,
                cameraPosition: CameraPosition(
                  target: LatLng(-38.740, -72.598),
                  
                  zoom: 13.2
                )
              ),
            ),
            
        ),
    floatingActionButton: IconButton(
      icon: Icon(Icons.add_circle_outline),
      color: Colors.red,
      onPressed: _googleMapController == null ? null : () {
        _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(-33.4489, -70.6693),
              zoom: 13.2,
              tilt: 30.0
          )
        ));
      },
    ),          
        

        
      
    );
  }

  // void _showUserProfile(Firebase user){
  //   bui
  // }
}