import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yaol/network/Local.dart';
import 'package:yaol/model/Local.dart';
import 'package:yaol/network/LogInVal.dart';
import 'package:yaol/view/MainViewClient.dart';

import 'package:yaol/view/UserSettings.dart';

class Map extends StatefulWidget {
  String userid;

  Map({Key key, this.userid}) : super(key: key);

  @override
  _Map createState() => _Map();
}

class _Map extends State<Map> {
  
  LogInVal _logInVal = new LogInVal();
  var localsDetails;
  //PopulateLocal pl = new PopulateLocal();
  bool mapToogle = false;
  var currentLocation;
  GoogleMapController _googleMapController;
  var local=[];

  @override
  void initState(){
   // print("HOlaaaaaaaaaaaaaaaaaaaaaaaaaaaa  ${LogInVal().getCurrentUser()} ");
    super.initState();
    Geolocator().getCurrentPosition().then((currentlocation){
      setState(() {
              currentLocation=currentlocation;
              mapToogle = true;
              populateLocal();
              });
    
    });
    // setState(() {
    //       localsDetails = Local().getData();
    //     });
  }
  populateLocal(){

    Firestore.instance.collection('markers').getDocuments().then((docs){
      if(docs.documents.isNotEmpty){
        for(int c=0;c< docs.documents.length;++c){
          local.add(docs.documents[c].data);
          initMarker(docs.documents[c].data);
        }
      }
      //print(locals);
      //return locals;
    });
  }
  initMarker(local){
    
      _googleMapController.addMarker(
        MarkerOptions(
          position: LatLng(local['location'].latitude, local['location'].longitude),
          draggable: false,
          infoWindowText: InfoWindowText(local['LocalName'],'HOla'
          ),
          
          //consumeTapEvents: _popUp(),
        )
      );
    
  }

  // getLocalEntries(){
  //   if (localsDetails != null) {
  //     return StreamBuilder(
  //       stream: localsDetails,
  //       builder: (context, snapshot){
  //         if (snapshot.data != null) {
  //           return ListView.builder(
  //             primary: false,
  //             shrinkWrap: true,
  //             itemCount: snapshot.data.documents.length,
  //             itemBuilder: (context,c){
  //                 return new Column(
  //                 children: <Widget>[
  //                   //_buildImageGrid(snapshot.data.documents[c].data['image']),
  //                   _imgGalleryDetail(snapshot.data.documents[c].data['name'],
  //                                     snapshot.data.documents[c].data['calle'],
  //                                     //snapshot.data.documents[c].data['image']
  //                                     )


  //                   // _buildMenuCard(
                                  
  //                   //               snapshot.data.documents[c].data['id'],
  //                   //               snapshot.data.documents[c].data['name'],
  //                   //               //snapshot.data.documents[c].data['ingredients'],
  //                   //               snapshot.data.documents[c].data['image'],
  //                   //               snapshot.data.documents[c].data['price']),
  //                 ],   
  //               );
  //             },
  //           );
  //         } else {
  //           return new Text("Cargando");
  //         }
  //       },
  //     );
  //   }else{
  //     return new Text('Cargando... Por favor esperer');
  //   }
  // }
  
  // Widget _imgGalleryDetail(name,calle) {
  //   //print(image[0]);
  //   return Padding(
  //     //padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
  //     child: Container(
        
  //       // child: Column(
  //       //   //child: ,
  //       //   children: <Widget>[
  //       //     SizedBox(height: 20,),
  //       //     Column(
  //       //       children: <Widget>[
  //       //         Container(
  //       //           height: 225.0,
  //       //        // width: MediaQuery.of(context).size.width / 2 + 40.0,
  //       //           decoration: BoxDecoration(
  //       //             borderRadius: BorderRadius.only(
  //       //                 topLeft: Radius.circular(15.0),
  //       //                 topRight: Radius.circular(15.0),

  //       //                 bottomLeft: Radius.circular(15.0),
  //       //                 bottomRight: Radius.circular(15.0),
  //       //                 ),
  //       //             image: DecorationImage(
  //       //               image: NetworkImage(image[0]),
  //       //                 //Image.network(image[0]),
  //       //                 //image: NetworkImage(image[0]),
  //       //                 fit: BoxFit.cover)),
  //       //         ),
  //       //         SizedBox(height: 15,)
  //       //       ],
  //       //     ),
  //           Row(   
  //             children: <Widget>[
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(
  //                     name,
  //                     style: TextStyle(
  //                       fontSize: 15.0),
  //                   ),
  //                   SizedBox(height: 7.0),
  //                   Row(
  //                     children: <Widget>[
  //                       Text(
  //                         'Precio: ${calle}',
  //                         style: TextStyle(
  //                             color: Colors.grey.shade700,
                              
  //                             fontSize: 11.0),
  //                       ),
  //                       SizedBox(width: 4.0),
  //                       Icon(
  //                         Icons.timer,
  //                         size: 4.0,
  //                         color: Colors.black,
  //                       ),
  //                       SizedBox(width: 4.0),
  //                       Text(
  //                         '2h ago',
  //                         style: TextStyle(
  //                             color: Colors.grey.shade500,
                              
  //                             fontSize: 11.0),
  //                       )
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
        
  //     ),
  //   );
  // }

  // Widget _popUp(){
  //   print("object");
  //   return SimpleDialog(
  //     title: const Text("Locales"),
  //     children: <Widget>[
  //       SimpleDialogOption(
  //         child: const Text("Gohan"),
  //         onPressed: (){

  //            var route = new MaterialPageRoute(
  //                 builder: (BuildContext context) =>
  //                     new MainViewClient(restaurant: 'Gohan'),
  //               );
  //           Navigator.of(context).push(route);
  //         },
  //       ),
  //      // getLocalEntries(),
  //     ],
  //   );
  // }

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
                  //gestureRecognizers: ,
                  options: GoogleMapOptions(

                    compassEnabled: true,
                    //mapType: ,
                    cameraPosition: CameraPosition(
                      target: LatLng(currentLocation.latitude,currentLocation.longitude),
                      
                      zoom: 12.0
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: (){
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => SimpleDialog(
              title: const Text('Locales'),
              children: <Widget>[
                SimpleDialogOption(
                  child: const Text("Gohan"),
                  onPressed: (){

                    var route = new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new MainViewClient(restaurant: 'Gohan'),
                        );
                    Navigator.of(context).push(route);
                  },
                ),
                SimpleDialogOption(
                  child: const Text("Nari Sushi"),
                  onPressed: (){

                    var route = new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new MainViewClient(restaurant: 'NariSushi'),
                        );
                    Navigator.of(context).push(route);
                  },
                ),
              // getLocalEntries(),
              ],
            )
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(left: 15.0,  top: 34.0),
          children: <Widget>[
            //SizedBox(height: 100,),
            ListTile(
              title: new FutureBuilder<FirebaseUser>(
                future: FirebaseAuth.instance.currentUser(),
                builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
                  if (snapshot.connectionState == ConnectionState.done) {
                    return new Text(snapshot.data.displayName);
                  } else {
                    return new Text('Cargando');
                  }
                },
              ),
              onTap: (){
                    Navigator.pushNamed(context, '/userSettings');

              
                
                   
              },
            ),
            SizedBox(height: 15,),
            ListTile(
              title: const Text("Cerrar Sesion"),
              onTap: (){
                _logInVal.singOut();
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),

        
      
    );
    // new FutureBuilder<FirebaseUser>(
    //   future: FirebaseAuth.instance.currentUser(),
    //   builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       return new Text(snapshot.data.uid);
    //     } else {
    //       return new Text('Cargando');
    //     }
    //   },
    // );
  }

  // void _showUserProfile(Firebase user){
  //   bui
  // }
}