import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:snapseed/ReusableClass.dart';
import 'package:snapseed/check(Blur).dart';
import 'package:snapseed/check(Frame).dart';
import 'package:snapseed/info(Image_details).dart';
import 'Help_Feedback.dart';
import 'Settings.dart';
import 'Tutoriales.dart';
import 'package:snapseed/HomeView.dart';
import 'package:snapseed/check(Text).dart';

var check;
var cropped;
var image_;
class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  double blurValue=10.0;
  ShowImage(){
    return Container(height: MediaQuery.of(context).size.height*0.8,child:
        Center(child:
        Stack(
          children:[
           if (image==null) 
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children:[
             Image.asset('Asset/PlaceHolder.png'),
             Text('No Image Selected'),

           ]
         ),
          if (image!=null)
          Image.file(image)
        
         
          ]
          
        ) 
   ),
   
    );
  }
  ImagePicker _picker=ImagePicker();
  clear(){
    setState(() {
      check=null;
      image=null;
      image_=null;
    });
  }
  getCameraImage()async{
    var status= await Permission.storage.status;
    if (status.isGranted) {
       file=await _picker.getImage(source: ImageSource.camera);
      setState(() {
        if (file!=null) {
          var _image=File(file.path);
          image=_image;
          
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
       file=await _picker.getImage(source: ImageSource.gallery,);
      setState(() {
        if (file!=null) {
        var  _image=File(file.path);
        image=_image;  
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
  getCropImage()async{
     
        cropped= await ImageCropper.cropImage(sourcePath:image.path,androidUiSettings: AndroidUiSettings( toolbarTitle: 'Cropper',
           toolbarColor: Colors.green,
           toolbarWidgetColor: Colors.white,
           initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false));
      
    setState(() {
      if (cropped!=null) {
        transfer=cropped;
        image=transfer;
        check=transfer;
        
      } else {
        image=image;
        check=null;
      }
    });
  }
   toastInfo() {
    final snackBar= SnackBar(content: Text('Saving...'),duration: Duration(seconds:1),backgroundColor: Colors.green,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
    saveScreen() async {   
            final directory = (await getExternalStorageDirectory())!.path;
       File imgFile = new File('$directory/Snapseed.png');
       ImageGallerySaver.saveFile(imgFile.path);
       toastInfo();

    
    
  }
  void initstate(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: ReusableClass.appbar('', false,right: Row(children: [
          IconButton(onPressed: (){
            showModalBottomSheet(context: context, builder: (BuildContext context)
            {return Container(height:200,
            child: Column(
              children:[
           ListTile(title: Text('Undo'),subtitle: Text('go to previous step'),leading: Icon(Icons.undo,color: Colors.green,),onTap: (){},),
          Divider(),
          ListTile(title: Text('Redo'),subtitle: Text('Erase the undo effects'),leading: Icon(Icons.redo,color: Colors.green,),onTap: (){},)

              ]
            ),);});
          }, icon: Icon(Icons.undo)),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Image_details()));
          }, icon: Icon(Icons.info)),
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
        ),left: TextButton(onPressed: (){
          if (check!=null) {
            showDialog(context: context, builder: (_)=>AlertDialog(title:
            Text('All changes will be Lost. Tap "OPEN" to a open a new Photo'),actions: [
              Row(
                mainAxisAlignment:MainAxisAlignment.end,
                mainAxisSize:MainAxisSize.max,
                children:[
                  FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text('CANCEL')),
                  FlatButton(onPressed: (){
                    Navigator.of(context).pop();
                    showDialog(context: context, builder: (_)=>SimpleDialog(children:[
                       ReusableClass.dialogOption('Open Camera',onpressed: ()async{ 
                     clear();    
              await getCameraImage();
             
              ReusableClass.setRootView(EditPage());
            }),
            Divider(color:Colors.green),
            ReusableClass.dialogOption('From Gallery',onpressed: ()async{
                 clear(); 
               await getGalleryImage();
              
               ReusableClass.setRootView(EditPage());
            }),
                    ]));
                  }, child: Text('OPEN'))
                ]
              )
            ],));
            
          } else {
            showDialog(context: context, builder: (_)=>SimpleDialog(
              children:[
                 ReusableClass.dialogOption('Open Camera',onpressed: ()async{ 
                clear();
              await getCameraImage();
              ReusableClass.setRootView(EditPage());
            }),
            Divider(color:Colors.green),
            ReusableClass.dialogOption('From Gallery',onpressed: ()async{
               clear();  
               await getGalleryImage();
               ReusableClass.setRootView(EditPage());
            }),
              ]
            ));
          }
        }, child: Text('OPEN',style:TextStyle(color: Colors.white)))),
        body: SingleChildScrollView(
          child:Container(
           
                      child: Column(children: [
              ShowImage(),
             Row(
               crossAxisAlignment:CrossAxisAlignment.end,
               mainAxisAlignment: MainAxisAlignment.center,
               children:[
                 Container(width:MediaQuery.of(context).size.width*0.3,child: TextButton(onPressed: (){}, 
                 child: Text('Styles',style:TextStyle(color:Colors.green)))),
                  Container(width:MediaQuery.of(context).size.width*0.3,
                  child: TextButton(onPressed: (){
                       showModalBottomSheet(context: context, builder: (BuildContext context){
                        return Container(height: 200,
                        child: GridView.count(crossAxisCount: 3,crossAxisSpacing: 55,children:
                        [
                          
                      ReusableClass.textbuttonIcon('Crop', Icons.crop, (){getCropImage();}),
                       ReusableClass.textbuttonIcon('Text', Icons.text_fields, ()async{
                  await Navigator.push(context, MaterialPageRoute(builder: (context)=>checkText())); 
                    // Text('${_controller.text}');
                    
                       }),
                       ReusableClass.textbuttonIcon('Colors', Icons.color_lens, (){}),
                       ReusableClass.textbuttonIcon('Frame', Icons.filter_frames, (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>checkFrame())); 
                       }),
                       ReusableClass.textbuttonIcon('Rotate', Icons.rotate_right, (){}),
                       ReusableClass.textbuttonIcon('Blur', Icons.blur_on, (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>checkBlur()));
                       }),
                          
                          ]));
                      });
                  }, child: Text('Tools',style:TextStyle(color:Colors.green))),),
                  Container(width:MediaQuery.of(context).size.width*0.3,child: TextButton(onPressed: (){
                    showModalBottomSheet(context: context, builder: (BuildContext context){
                      return Container(height:200,child:Column(children: [
                         ListTile(title: Text('Share'),subtitle: Text('Share your image with people'),
                         leading: Icon(Icons.share,color: Colors.green,),onTap: ()async{
                                final directory = (await getExternalStorageDirectory())!.path;
                             image = File('$directory/Snapseed.png');


                           Share.shareFiles([image.path]);
                         },),
                         Divider(),
               ListTile(title: Text('Save'),subtitle: Text('Create a copy of your photos'),
                         leading: Icon(Icons.share,color: Colors.green,),onTap: ()async{
                           Navigator.pop(context);
                           await saveScreen();
                         },),     
                      ],)
                      );
                      });
                  }, 
                  child: Text('Export',style:TextStyle(color:Colors.green))),),
               ]
             )
            ],),
          )
        )
    );
  }
}


/*


GestureDetector(child: Stack(
        children:[
          Container(
                      child: EditableText(controller: _controller, focusNode: FocusNode(),
             style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black), cursorColor:Colors.black, backgroundCursorColor: Colors.grey),
          ),
          Positioned(top:top ,left: left, child:Text(_controller.text),
          
          )
        ]
      ),onHorizontalDragUpdate: (DragUpdateDetails dd){
        print(dd);
        setState(() {
          top=dd.localPosition.dy;
        left=dd.localPosition.dx;
        });
      },),

*/