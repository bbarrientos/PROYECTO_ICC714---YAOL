import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:yaol/view/Map.dart';
import 'dart:async';

class LogInVal{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> signIn() async{
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(idToken: gSA.idToken, accessToken: gSA.accessToken);

    // print("USer name: ${user.displayName}");
    // var route = new MaterialPageRoute(
    //   builder: (BuildContext context) =>
    //   new Map(userid: user.displayName),

      
    // );
    return user;
  }

  // void currentuser()async{
  //   final FirebaseUser user = await _auth.currentUser();
  //  // final uid = user.uid;
  //   return user.uid;
  // }

  // Future<String> getCurrentUser() async {
  //   FirebaseUser user = await _auth.currentUser();
  //   return user.uid;
  // }
  void singOut(){
    googleSignIn.signOut();
    print("USer Signed out");
  }
}