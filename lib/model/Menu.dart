import 'package:cloud_firestore/cloud_firestore.dart';

class Menu{
  final String name;
  final int price;
  final int id;
  final List<String> image;
  final List<String> ingredients;

  Menu({
    this.id,
    this.name,
    this.image,
    this.ingredients,
    this.price,
  });
  getData(String restaurant) {
   // print("**********************************************************");
   // print(Firestore.instance.collection('Gohan').snapshots());
    return Firestore.instance.collection(restaurant).snapshots(); 
  }
}