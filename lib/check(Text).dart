import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:snapseed/EditPage.dart';
import 'package:snapseed/ReusableClass.dart';
import 'HomeView.dart';



class checkText extends StatefulWidget {
 // checkText(key) : super(key: key);
  const checkText({Key? key}) : super(key: key);
  @override
  _checkTextState createState() => _checkTextState();
}

class _checkTextState extends State<checkText> {
 final GlobalKey _key=GlobalKey();

var top;
var left;
var image1;   
double _scaleFactor = 1.5;
double _baseScaleFactor = 1.0;
TextEditingController _controller=TextEditingController(text: 'Tap to Edit Text',);

   getText()async{
  showDialog(context: context, builder: (_)=>new SimpleDialog(
    children:[
                           Center(
                     child: EditableText(autofocus: true,controller:_controller , focusNode: FocusNode(), style: TextStyle(color: Colors.black),
                           cursorColor: Colors.black, backgroundCursorColor: Colors.transparent,showCursor: true,  
                           ),
                         ),                 
    ]
  ));                 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableClass.appbar('Add Text', true,right: IconButton(onPressed: ()async{
      image=await ReusableClass.capture(_key);
    
      setState(() {        
        if (image!=null) {
         transfer=image;
         image=transfer;
         check=image;   
        } else {
          image=image;
          check=null;
        }   
      });
      await Navigator.push(context, MaterialPageRoute(builder: (context)=>EditPage())); 
      //Navigator.pop(context,image);
      }, icon: Icon(Icons.check))),
      body: GestureDetector(
  onScaleStart: (details) {
    _baseScaleFactor = _scaleFactor;
  },
  onScaleUpdate: (details) {
    setState(() {
      _scaleFactor = _baseScaleFactor * details.scale;
    });
  },
  onHorizontalDragUpdate: (DragUpdateDetails details){
     setState(() {
       top=details.localPosition.dy;
       left=details.localPosition.dx;
       image=image;
     });
   }, 
        child: 
                 SingleChildScrollView(key: _key,
            child: Column(
              children:[ 
                    Container(
                  height: MediaQuery.of(context).size.height*0.8,
                        child:Stack(
                    children:[
                      Center(child: Image.file(image)),
                      Positioned(child: GestureDetector(onTap: ()async{setState(() {
                         getText();
                         
                       });
                       },
                       child: Center(
                                          child: Text(_controller.text,textScaleFactor: _scaleFactor,
                         style: TextStyle(fontWeight: FontWeight.bold),),
                       ),),
                        top:top ,left: left), 
                    ]
                  ),
                ),
            
              ],
          ),
      ),
        ),
  
        
    );
  }
 
}






