import 'package:flutter/material.dart';
import 'package:yaol/network/LogInVal.dart';

class LogIn extends StatefulWidget {
  @override
  _LogIn createState() => _LogIn();
}

class _LogIn extends State<LogIn> {
  LogInVal _logInVal = new LogInVal();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: loginBody(),
      ),
    );
  }

  loginBody() => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[loginHeader(), loginFields()],
        ),
      );

  loginHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image(
            image: AssetImage('assets/image/icon.png'),
            height: 150,
          ),
          // CircleAvatar(
          //   backgroundColor: Colors.transparent,
          //   radius: 60.0,
          //   child: AssetImage(assetName),
          // ),
          // SizedBox(
          //   height: 30.0,
          // ),
          Text(
            "Welcome to YAOL",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Sign in to continue",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 17.0,
          ),
        ],
      );

  loginFields() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: OutlineButton(
                
                padding: EdgeInsets.all(12.0),
                shape: StadiumBorder(),
                color: Color(0xffffff),
                highlightColor: Color(0xcfffff),
                splashColor: Colors.yellow,
                textColor: Colors.green,
                highlightedBorderColor: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.fiber_new,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Iniciar Sesion con Google"
                    ),
                  ]
                ),
                
                
                onPressed: () {
                  //Navigator.pushNamed(context, '/map');
                  _logInVal.singOut();
                  _logInVal.signIn().then((user) => Navigator.pushNamed(context, "/map"));
                  
                },
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            // Text(
            //   "SIGN UP FOR AN ACCOUNT",
            //   style: TextStyle(color: Colors.grey),
            // ),
          ],
        ),
      );
}