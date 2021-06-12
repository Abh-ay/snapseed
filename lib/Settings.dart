
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapseed/EditPage.dart';
import 'package:snapseed/HomeView.dart';
import 'package:snapseed/LoginScreen.dart';
import 'ReusableClass.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  
  bool theme=false;
  var val='Do not resize';
  var jpg='JPG 95%';
   @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title:Text('Settings'),backgroundColor: Colors.green,),
      body: Container(
        padding:EdgeInsets.all(15),
        child:Column(
         // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         ReusableClass.text("Appearance"),
          SwitchListTile(
                  value: theme, 
                  activeColor: Colors.green,
                  onChanged: (toggle){
                    setState(() {
               //     theme=ReusableClass.theme(toggle);
               theme=toggle;
                             });
                  },title: Text('Dark theme'),),
                  ReusableClass.text('Exporting & sharing'),
                  SizedBox(height:10),
 ListTile(title: Text('Image Sizing'),subtitle: Column(
   children:[
     Align(alignment:AlignmentDirectional.topStart,child: Text('$val'),),
     SizedBox(height: 6,),
     Text('Choose the maximum image size for exporting and sharing. The sizes given refer to the long edge of the image and would only to images and larger than the selected valu. Smaller images will not be enlarged')
   ]
 ),onTap:(){
   showDialog(context:context,builder: (_)=> SimpleDialog(children: [
       ReusableClass.radio('Do not resize', val, (value){
         setState(() {
           value='Do not resize';
           val=value;
           Navigator.pop(context);
         });
       }),
       Divider(),
      ReusableClass.radio('4000 px', val, (value){
         setState(() {
           value='4000 px';
           val=value;
           Navigator.pop(context);
         });
       }),
        Divider(),
        ReusableClass.radio('2000 px', val, (value){
         setState(() {
           value='2000 px';
           val=value;
           Navigator.pop(context);
         });
       }),
        Divider(),
        ReusableClass.radio('1920 px', val, (value){
         setState(() {
           value='1920 px';
           val=value;
           Navigator.pop(context);
         });
       }),
        Divider(),
      ReusableClass.radio('1366 px', val, (value){
         setState(() {
           value='1366 px';
           val=value;
           Navigator.pop(context);
         });
       }),
        Divider(),
       ReusableClass.radio('800 px', val, (value){
         setState(() {
           value='800 px';
           val=value;
           Navigator.pop(context);
         });
       }),
       Row(mainAxisAlignment:MainAxisAlignment.end,
       children: [
         TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel'))
       ],)   
     ],
  ) );
 }),
 Divider(),
 ListTile(title: Text('Format and Quality'),subtitle: Column(
   children:[
     Align(alignment: AlignmentDirectional.topStart,child: Text('$jpg'),),
     SizedBox(height:6),
     Text('Choose the format and quality rate that will be applied when exporting or sharing JPG 100% will give the best JPEG image at the xost of increased file size')
   ]
 ),onTap:(){
   showDialog(context:context,builder: (_)=> SimpleDialog(children: [
       ReusableClass.radio('JPG 100%', jpg, (value){
         setState(() {
           value='JPG 100%';
           jpg=value;
           Navigator.pop(context);
         });
       }),
       Divider(),
      ReusableClass.radio('JPG 95%', jpg, (value){
         setState(() {
           value='JPG 95%';
           jpg=value;
           Navigator.pop(context);
         });
       }),
        Divider(),
        ReusableClass.radio('JPG 80%', jpg, (value){
         setState(() {
           value='JPG 80%';
           jpg=value;
           Navigator.pop(context);
         });
       }),
        Divider(),
        ReusableClass.radio('PNG', jpg, (value){
         setState(() {
           value='PNG';
           jpg=value;
           Navigator.pop(context);
         });
       }),  
       Row(mainAxisAlignment:MainAxisAlignment.end,
       children: [
         TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel'))
       ],)   
     ],
  ) );
 }),
 SizedBox(height:10),
         ReusableClass.text("Logins"),
         ListTile(title:Text('Log Out'),onTap: (){
           showDialog(context: context, builder: (_)=>AlertDialog(title:Text('Are you Sure ?'),
           actions: [
             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               mainAxisSize: MainAxisSize.max,
               children: [
              // Divider(color: Colors.green,),  
               FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Cancel',style: TextStyle(color:Colors.green),)),
               FlatButton(onPressed: (){
                 setState(() {
                   check=null;
                   image=null;       
                 });
                 ReusableClass.setRootView(LoginScreen());}, child: Text('Log Out',style: TextStyle(color:Colors.red),))
             ],)
           ],),);
         },)        
                  
        ],)
      ),
      
      
    );
  }
}

 