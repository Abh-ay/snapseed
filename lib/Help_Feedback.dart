

import 'package:flutter/material.dart';
import 'package:snapseed/ReusableClass.dart';

class Help_Feedback extends StatefulWidget {
  @override
  _Help_FeedbackState createState() => _Help_FeedbackState();
}

class _Help_FeedbackState extends State<Help_Feedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Help & feedback'),backgroundColor:Colors.green),
      body: Container(
        padding:EdgeInsets.all(15),
        child:Column(children: [
          ReusableClass.text('Feedback'),
          ListTile(title:Text('Feedback'),onTap: (){},),
          Divider(),
          ReusableClass.text('Help'),
           ListTile(title:Text('Help Center'),onTap: (){}),
           Divider(),
            ListTile(title:Text('Facebook Page'),onTap: (){},),
            Divider(),
             ListTile(title:Text('License'),onTap: (){},),
             Divider(),
             ReusableClass.text('Legal'),
               ListTile(title:Text('Terms of Service'),onTap: (){}),
               Divider(),
            ListTile(title:Text('Privacy Policy'),onTap: (){},),
            Divider(),
            ReusableClass.text('About'),
            ListTile(title:Text('Snapseed'),onTap:(){},subtitle: Text('1.0.0+1'),)


        ],)
      ),
      
    );
  }
}