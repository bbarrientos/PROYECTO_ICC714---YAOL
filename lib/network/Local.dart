import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class PopulateLocal{
  var locals = [];
  GoogleMapController _mapController;
  populateLocal(){
    locals = [];

    Firestore.instance.collection('markers').getDocuments().then((docs){
      if(docs.documents.isNotEmpty){
        for(int c=0;c< docs.documents.length;++c){
          locals.add(docs.documents[c].data);
          //initMarker(docs.documents[c].data);
        }
      }
      //print(locals);
      //return locals;
    });
  }
  // initMarker(locals){
  //   _mapController.clearMarkers().then((val){
  //     _mapController.addMarker(
  //       MarkerOptions(
  //         position: LatLng(locals['location'].latitude, locals['location'].longitude),
  //         draggable: false,
  //         infoWindowText: InfoWindowText(locals['LocalName'],'HOla')
  //       )
  //     );
  //   });
  //   }


}