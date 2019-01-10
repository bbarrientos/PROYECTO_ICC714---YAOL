import 'package:cloud_firestore/cloud_firestore.dart';

class Local{
  final String name;
  //final int price;
  final int id;
  final List<String> image;
  //final List<String> ingredients;

  Local({
    this.id,
    this.name,
    this.image,
    //this.rangoPrice,
  });
  getData() {
   // print("**********************************************************");
   // print(Firestore.instance.collection('Gohan').snapshots());
    return Firestore.instance.collection('markers').snapshots(); 
  }
}