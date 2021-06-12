import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:snapseed/HomeView.dart';

class Image_details extends StatefulWidget {
  @override
  _Image_detailsState createState() => _Image_detailsState();
}

class _Image_detailsState extends State<Image_details> {
   //Uint8List data = await FlutterExif.image( image.identifier);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Image details',style: TextStyle(color:Colors.white),),centerTitle: false,backgroundColor: Colors.green,
    ),
    body: Column(
      children:[
        ListTile(leading:Icon(Icons.calendar_today),title: Text('00'),subtitle: Text('00'),),
        Divider(),
        ListTile(leading:Icon(Icons.photo),)
      ]
    ),
    );
  }
}