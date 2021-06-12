import 'package:flutter/material.dart';

class Tutoriales extends StatefulWidget {
  @override
  _TutorialesState createState() => _TutorialesState();
}

class _TutorialesState extends State<Tutoriales> {
  var scale=1.0,previousScale=1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Tutoriales'),backgroundColor: Colors.green,),
      body: SingleChildScrollView(
        child: InteractiveViewer(child:Image.asset('Asset/Images/filterImages.png'),minScale: 0.5,maxScale: 4.0,),
      
        //       child: GestureDetector(
        //         onScaleStart: (ScaleStartDetails details){
        //           previousScale=scale;
        //           setState(() {
        //           });
        //         },
        //         onScaleUpdate: (ScaleUpdateDetails details){
        //           scale=previousScale*details.scale;
        //           setState(() {
        //           });
        //         },
        //         onScaleEnd: (ScaleEndDetails details){
        //           previousScale=1.0;
        //           setState(() {
        //           });
        //         },
        //                 child: Container(
        //                   transform: Matrix4.diagonal3(Vector3(scale,scale,scale)),
        //                   alignment: FractionalOffset.center,
        //   child:Image.asset('Asset/filterImages.png',scale: 0.2,)
        // ),
        //       ),
      ),
      
      );
  }
}