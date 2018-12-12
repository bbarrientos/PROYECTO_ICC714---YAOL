import 'package:flutter/material.dart';
import 'package:yaol/routes/CustomRoute.dart';

import 'package:yaol/view/LogIn.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,

      onGenerateRoute: (RouteSettings settings){
        switch(settings.name){
          case '/': return new CustomRoute(
            builder: (_) => new LogIn(),
            settings: settings,
          );
        }
        assert(false);
      }
    );
  }
}


