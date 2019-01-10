import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserSettings extends StatefulWidget {
  String uid;

  UserSettings({Key key, this.uid}) : super(key: key);
  @override
  _UserSettings createState() => new _UserSettings();
}

// class Settings{
//   FutureBuilder<FirebaseUser>(
//                 future: FirebaseAuth.instance.currentUser(),
//                 builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     return new Text(snapshot.data.displayName);
//                   } else {
//                     return new Text('Cargando');
//                   }
//                 },
//               ),
// }

class _UserSettings extends State<UserSettings> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        // ClipPath(
        //   child: Container(color: Colors.black),
        //   clipper: getClipper(),
        //   //clipBehavior: ,
        // ),
        Positioned(
            width: 450,
            top: MediaQuery.of(context).size.height / 10,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                SizedBox(height: 90.0),
                new FutureBuilder<FirebaseUser>(
                future: FirebaseAuth.instance.currentUser(),
                builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
                  if (snapshot.connectionState == ConnectionState.done) {
                    return new Text(snapshot.data.displayName,style: TextStyle(
                      fontSize: 17.0
                    ),textAlign: TextAlign.center,);

                  } else {
                    return new Text('Cargando');
                  }
                },
            
                ),
                SizedBox(height: 25.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Edit Name',
                            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                    SizedBox(height: 25.0),
                    // GridView.custom(
                    //   primary: false,
                      
                    // ),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Log out',
                            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ))
              ],
            ))
      ],
    ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}