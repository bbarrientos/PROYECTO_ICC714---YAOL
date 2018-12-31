import 'package:flutter/material.dart';
import 'package:yaol/model/Menu.dart';


class MainViewClient extends StatefulWidget {
  @override
  _MainViewClient createState() => _MainViewClient();
}

class _MainViewClient extends State<MainViewClient> {
  var menuDetails;
  String restaurant = "Gohan";
  @override
  void initState(){
    super.initState();
    setState(() {
          menuDetails = Menu().getData(restaurant);
        });
  }

  getMenuEntries(){
    if (menuDetails != null) {
      return StreamBuilder(
        stream: menuDetails,
        builder: (context, snapshot){
          if (snapshot.data != null) {
            // print("*******************************************************");
            //     print(snapshot.data.documents[0]);
            //     print("*******************************************************");
            return ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context,c){
                // print("*******************************************************");
                // print(snapshot.data.documents[c]);
                // print("*******************************************************");
                //for(int i=0;i<=1;i++){
                  print("holaaaaaaaaa");
                  print(snapshot.data.documents.length);
                  return new Column(
                  children: <Widget>[
                    _buildMenuCard(
                                  
                                  snapshot.data.documents[c].data['id'],
                                  snapshot.data.documents[c].data['name'],
                                  //snapshot.data.documents[c].data['ingredients'],
                                  snapshot.data.documents[c].data['image'],
                                  snapshot.data.documents[c].data['price']),
                  ],
                  
                );
                //}
                //print("exit");
                 
              },
            );
          } else {
            return new Text("Cargando");
          }
        },
      );
    }else{
      return new Text('Cargando... Por favor esperer');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){

          },
          color: Colors.black,
        ),
        title: Text("Titulo Local"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
            color: Colors.grey,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          GridView.count(
            crossAxisCount: 2,
            primary: false,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.85,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            children: <Widget>[
              getMenuEntries(),
             // _buildMenuCard(name, en, cardIndex, price);
            ],
          )
        ],
      ),
   
    // floatingActionButton: IconButton(
    //   icon: Icon(Icons.add_circle_outline),
    //   color: Colors.red,
    //   onPressed: _googleMapController == null ? null : () {
    //     _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
    //       CameraPosition(
    //           target: LatLng(-33.4489, -70.6693),
    //           zoom: 13.2,
    //           tilt: 30.0
    //       )
    //     ));
    //   },
    // ),          
    );
  }

  Widget _buildMenuCard(id, name, image, precio){
      return Padding(
        padding: id.isEven? EdgeInsets.only(right: 15.0):EdgeInsets.only(left: 15.0),
        child: Container(
          height: 400.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
              style: BorderStyle.solid,
              width: 1.0
            )
          ),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 125.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)
                      ),
                      image: DecorationImage(
                        //Imagen de Firebase
                        fit: BoxFit.cover,
                       image: NetworkImage(image[0]),
                        
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                    child: Text(
                      //NOMBRE DEL PLATILLO
                      //"Nombre platillo",
                      '${name}',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      //INGREDIENTES
                      '${precio}',
                      //origin,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 12.0,
                        color: Colors.grey
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 110.0,
                top: 102.0,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.greenAccent,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}