import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  _MainView createState() => _MainView();
}

class _MainView extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      body: Center(
        child:Container(
          
        ),
      ),
    );
  }
}