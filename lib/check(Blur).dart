
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:snapseed/EditPage.dart';
import 'package:snapseed/ReusableClass.dart';
import 'HomeView.dart';
class checkBlur extends StatefulWidget {
  @override
  _checkBlurState createState() => _checkBlurState();
}

class _checkBlurState extends State<checkBlur> {
   GlobalKey _key=GlobalKey();
  var back;
  double blurValue=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableClass.appbar('Blur Image', true,right: IconButton(onPressed: ()async{
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
      }, icon:Icon(Icons.check) )),
      body:ListView(
        children:[
          getBlur(),
          Slider(value: blurValue,min: 0,max: 15, onChanged: (value){setState(() {
            blurValue=value;
          });}),   
        ]
      )  
    );
  }
  blur()async{
    showDialog(context: context, builder: (_)=>StatefulBuilder(builder: (context,setState){
      return Center(
              child: Column(
          mainAxisSize: MainAxisSize.min,
          children:[ AlertDialog(
            content: Slider(min: 0,max: 12,value: blurValue,activeColor: Colors.green,inactiveColor: Colors.red, onChanged: (value){
              setState((){
                blurValue=value;
              });
            },),
            actions: [Row(
              children:[
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text('Cancel')),
                TextButton(onPressed: (){}, child: TextButton(onPressed: (){
                  Container(decoration:BoxDecoration(image:DecorationImage(image: FileImage(image)) ),
                  child: BackdropFilter(filter: ImageFilter.blur(sigmaX: blurValue,sigmaY: blurValue,)));
                }, child: Text('Ok'))),
              ]
            )],
          ),
          ],
        ),
      );
    }));
  }
  getBlur(){
    return  SingleChildScrollView(key: _key,
        child:
                Container(
              height: MediaQuery.of(context).size.height*0.8,
                    child:Stack(
        children:[
          Image.file(image),
          Positioned.fill(child: BackdropFilter(filter:ImageFilter.blur(sigmaX: blurValue,sigmaY: blurValue),
          child:Container(color:Colors.black.withOpacity(0.2))),)
        ]
      )
              )
    );
  } 
}

//  SingleChildScrollView(key: _key,
//         child: Column(
//           children:[ 
//                 Container(
//               height: MediaQuery.of(context).size.height*0.8,
//                     child:Stack(
//                 children:[
//                   Center(child: Image.file(image)),
// RepaintBoundary(
//           child: SingleChildScrollView(key: _keyBlur,
//           child: Column(
//             children:[ 
//                   Container(
//                 height: MediaQuery.of(context).size.height*0.8,
//                       child:Stack(key: _keyBlur,
//         children:[
//           Image.file(image),
//           Positioned.fill(child: BackdropFilter(filter:ImageFilter.blur(sigmaX: blurValue,sigmaY: blurValue),
//           child:Container(color:Colors.black.withOpacity(0.2))),)
//         ]
//       ))])),
//     );