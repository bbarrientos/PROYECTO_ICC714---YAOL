import 'package:flutter/material.dart';
import 'package:yaol/model/Menu.dart';


class MainViewClient extends StatefulWidget {
  String restaurant;

  MainViewClient({Key key, this.restaurant}) : super(key: key);
  @override
  _MainViewClient createState() => _MainViewClient();
}

class _MainViewClient extends State<MainViewClient> {
  //final List<Menu> Menu;
  var menuDetails;
  //String restaurant = "Gohan";
  @override
  void initState(){
    super.initState();
    setState(() {
          menuDetails = Menu().getData(widget.restaurant);
        });
  }

  getMenuEntries(){
    if (menuDetails != null) {
      return StreamBuilder(
        stream: menuDetails,
        builder: (context, snapshot){
          if (snapshot.data != null) {
            return ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context,c){
                  return new Column(
                  children: <Widget>[
                    //_buildImageGrid(snapshot.data.documents[c].data['image']),
                    _imgGalleryDetail(snapshot.data.documents[c].data['name'],
                                      snapshot.data.documents[c].data['price'],
                                      snapshot.data.documents[c].data['image'])


                    // _buildMenuCard(
                                  
                    //               snapshot.data.documents[c].data['id'],
                    //               snapshot.data.documents[c].data['name'],
                    //               //snapshot.data.documents[c].data['ingredients'],
                    //               snapshot.data.documents[c].data['image'],
                    //               snapshot.data.documents[c].data['price']),
                  ],   
                );
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
          // GridView.count(
          //   crossAxisCount: 2,
          //   primary: false,
          //   crossAxisSpacing: 10.0,
          //   childAspectRatio: 0.85,
          //   mainAxisSpacing: 10.0,
          //   shrinkWrap: true,
          //   children: <Widget>[
              getMenuEntries(),
             // _buildMenuCard(name, en, cardIndex, price);
           // ],
         // )
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

  // Widget _buildMenuCard(id, name, image, precio){
  //     return Padding(
  //       padding: id.isEven? EdgeInsets.only(right: 15.0):EdgeInsets.only(left: 15.0),
  //       child: Container(
  //         height: 400.0,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10.0),
  //           border: Border.all(
  //             color: Colors.grey.withOpacity(0.2),
  //             style: BorderStyle.solid,
  //             width: 1.0
  //           )
  //         ),
  //         child: Stack(
  //           children: <Widget>[
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Container(
  //                   height: 125.0,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(10.0),
  //                       topRight: Radius.circular(10.0)
  //                     ),
  //                     image: DecorationImage(
  //                       //Imagen de Firebase
  //                       fit: BoxFit.cover,
  //                      image: NetworkImage(image[0]),
                        
  //                     )
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 5.0,top: 5.0),
  //                   child: Text(
  //                     //NOMBRE DEL PLATILLO
  //                     //"Nombre platillo",
  //                     '${name}',
  //                     style: TextStyle(
  //                       fontFamily: 'Quicksand',
  //                       fontSize: 15.0,
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 5.0),
  //                   child: Text(
  //                     //INGREDIENTES
  //                     '${precio}',
  //                     //origin,
  //                     style: TextStyle(
  //                       fontFamily: 'Quicksand',
  //                       fontSize: 12.0,
  //                       color: Colors.grey
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Positioned(
  //               left: 110.0,
  //               top: 102.0,
  //               child: Container(
  //                 height: 40.0,
  //                 width: 40.0,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(20.0),
  //                   color: Colors.greenAccent,
  //                 ),
  //                 child: Center(
  //                   child: Icon(
  //                     Icons.add_shopping_cart,
  //                     color: Colors.yellow,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  // }

  Widget _imgGalleryDetail(name,precio,image) {
    //print(image[0]);
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
      child: Container(
        
        child: Column(
          //child: ,
          children: <Widget>[
            SizedBox(height: 20,),
            Column(
              children: <Widget>[
                Container(
                  height: 225.0,
               // width: MediaQuery.of(context).size.width / 2 + 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),

                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                        ),
                    image: DecorationImage(
                      image: NetworkImage(image[0]),
                        //Image.network(image[0]),
                        //image: NetworkImage(image[0]),
                        fit: BoxFit.cover)),
                ),
                SizedBox(height: 15,)
              ],
            ),
            Row(
              
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 15.0),
                    ),
                    SizedBox(height: 7.0),
                    Row(
                      children: <Widget>[
                        Text(
                          'Precio: ${precio}',
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 11.0),
                        ),
                        SizedBox(width: 4.0),
                        Icon(
                          Icons.timer,
                          size: 4.0,
                          color: Colors.black,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          '2h ago',
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              
                              fontSize: 11.0),
                        )
                      ],
                    )
                  ],
                ),
                // SizedBox(width: 10.0),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: <Widget>[
                //     SizedBox(width: 7.0),
                //     InkWell(
                //       onTap: () {},
                //       child: Container(
                //         height: 20.0,
                //         width: 20.0,
                //         child: Image.asset('assets/navarrow.png'),
                //       ),
                //     ),
                //     SizedBox(width: 7.0),
                //     InkWell(
                //       onTap: () {},
                //       child: Container(
                //         height: 20.0,
                //         width: 20.0,
                //         child: Image.asset('assets/chatbubble.png'),
                //       ),
                //     ),
                //     SizedBox(width: 7.0),
                //     InkWell(
                //       onTap: () {},
                //       child: Container(
                //         height: 22.0,
                //         width: 22.0,
                //         child: Image.asset('assets/fav.png'),
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
            // SizedBox(
            //   height: 250,

            // ),
            
          ],
        ),
        
      ),
      // child: Row(
      //   children: <Widget>[
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         Text(
      //           name,
      //           style: TextStyle(
      //             fontSize: 15.0),
      //         ),
      //         SizedBox(height: 7.0),
      //         Row(
      //           children: <Widget>[
      //             Text(
      //               'Precio: ${precio}',
      //               style: TextStyle(
      //                   color: Colors.grey.shade700,
                        
      //                   fontSize: 11.0),
      //             ),
      //             SizedBox(width: 4.0),
      //             Icon(
      //               Icons.timer,
      //               size: 4.0,
      //               color: Colors.black,
      //             ),
      //             SizedBox(width: 4.0),
      //             Text(
      //               '2h ago',
      //               style: TextStyle(
      //                   color: Colors.grey.shade500,
                        
      //                   fontSize: 11.0),
      //             )
      //           ],
      //         )
      //       ],
      //     ),
      //     // SizedBox(width: 10.0),
      //     // Row(
      //     //   crossAxisAlignment: CrossAxisAlignment.center,
      //     //   children: <Widget>[
      //     //     SizedBox(width: 7.0),
      //     //     InkWell(
      //     //       onTap: () {},
      //     //       child: Container(
      //     //         height: 20.0,
      //     //         width: 20.0,
      //     //         child: Image.asset('assets/navarrow.png'),
      //     //       ),
      //     //     ),
      //     //     SizedBox(width: 7.0),
      //     //     InkWell(
      //     //       onTap: () {},
      //     //       child: Container(
      //     //         height: 20.0,
      //     //         width: 20.0,
      //     //         child: Image.asset('assets/chatbubble.png'),
      //     //       ),
      //     //     ),
      //     //     SizedBox(width: 7.0),
      //     //     InkWell(
      //     //       onTap: () {},
      //     //       child: Container(
      //     //         height: 22.0,
      //     //         width: 22.0,
      //     //         child: Image.asset('assets/fav.png'),
      //     //       ),
      //     //     )
      //     //   ],
      //     // )
      //   ],
      // ),
    );
  }
}