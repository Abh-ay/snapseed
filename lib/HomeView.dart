import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:snapseed/EditPage.dart';
import 'package:snapseed/ReusableClass.dart';
import 'package:snapseed/Tutoriales.dart';

import 'Help_Feedback.dart';
import 'Settings.dart';
  var image;
  var transfer;
  var file;
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  ImagePicker _picker=ImagePicker();
  getCameraImage()async{
    var status= await Permission.storage.status;
    if (status.isGranted) {
       file=await _picker.getImage(source: ImageSource.camera);
      setState(() {
        if (file!=null) {
          image=File(file.path);
         
          
        } else {
          print('No Image is Selected');
        }
      });
    } else if (status.isDenied) {
      Permission.storage.request();
      
    }else if (status.isPermanentlyDenied) {
      openAppSettings();
      
    } else{
      Permission.storage.request(); 
    }
  }
  getGalleryImage()async{
    var status= await Permission.storage.status;
    if (status.isGranted) {
       file=await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        if (file!=null) {
          image=File(file.path);         
        } else {
          print('No Image is Selected');
        }
      });
    } else if (status.isDenied) {
      Permission.storage.request();
      
    }else if (status.isPermanentlyDenied) {
      openAppSettings();
      
    } else{
      Permission.storage.request(); 
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: ReusableClass.appbar('',false,
      right: 
        Row(children: [
          IconButton(onPressed: null, icon: Icon(Icons.undo)),
          IconButton(onPressed: null, icon: Icon(Icons.info)),
         PopupMenuButton(
                   // color: Colors.yellowAccent,
                    elevation: 40,
                    onSelected: (value){
                      setState(() {
                        Navigator.push(context, value as MaterialPageRoute);
                      });
                    },
                    itemBuilder:(context) {
                      var popupMenuItem = PopupMenuItem(
                        child: Text("Tutorials"),
                        value: MaterialPageRoute(builder: (context)=>Tutoriales()),
                      );
                      return [
                      PopupMenuItem(
                        child: Text("Settings"),
                        value: MaterialPageRoute(builder: (context)=>Settings()),
                       
                      ),
                      popupMenuItem,
                      PopupMenuItem(child:Text('Help & feedback'),
                      value:MaterialPageRoute(builder: (context)=>Help_Feedback()),
                      )
                    ];
                    }
                )
          ]
        )
        ,left: TextButton(onPressed: (){showDialog(context: context, builder:(_)=>new 
        SimpleDialog(
          
            children: [
            ReusableClass.dialogOption('Open Camera',onpressed: ()async{ 
            
                await getCameraImage();
              if (image!=null) {
                ReusableClass.setRootView(EditPage());
                
              } else {
                return null;
              }

      
              
            }),
            Divider(color:Colors.green),
            ReusableClass.dialogOption('From Gallery',onpressed: ()async{
              await getGalleryImage();
            
                 if (image!=null) {
                ReusableClass.setRootView(EditPage());
                
              } else {
                return null;
              }          
            }),
          ],
        ) );},
         child: Text('OPEN',style: TextStyle(color:Colors.white),)),),
         body: Center(
                    child: GestureDetector(
             onTap:(){
               showDialog(context: context, builder:(_)=>new 
        SimpleDialog(
          
            children: [
            ReusableClass.dialogOption('Open Camera',onpressed: ()async{ 
              await getCameraImage();
              if (image!=null) {
                ReusableClass.setRootView(EditPage());
                
              } else {
                return null;
              }
            }),
            Divider(color:Colors.green),
            ReusableClass.dialogOption('From Gallery',onpressed: ()async{
               await getGalleryImage();
               if (image!=null) {
                ReusableClass.setRootView(EditPage());
                
              } else {
                return null;
              }
            }),           
          ],
        ) );},  
             child:Column(
               mainAxisAlignment:MainAxisAlignment.center,
               children:[
                 Icon(Icons.add,size:175,color: Colors.grey,),
                 Text('Tap to open a Photo From gallery or Camera',style: TextStyle(color:Colors.grey),)
               ]
             )
           ),
         ), 
    );
  }
}

