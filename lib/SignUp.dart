import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:snapseed/HomeView.dart';

import 'ReusableClass.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
 bool check=false;
  @override
  Widget build(BuildContext context) {
    
   
    return Scaffold(
    appBar: AppBar(title:Text('Sign Up'),backgroundColor:Colors.green),
    body: SingleChildScrollView(
        child:Column(
           // mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Align(alignment: AlignmentDirectional.center,
              //   child: Image.asset('Asset/logo.png',scale: 6.0,)),
              //   SizedBox(height:12),
     //   Text('   Create your Account',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
     //  SizedBox(height:12),
     ReusableClass.textField('Enter Full name',obscure:false,prefix:Icon(Icons.person),textinputaction: TextInputAction.next),
            ReusableClass.textField('E-mail',obscure:false,prefix:Icon(Icons.mail),textinputaction: TextInputAction.next),
             ReusableClass.textField('Password',obscure: false,prefix:Icon(Icons.lock),textinputaction: TextInputAction.next),
             ReusableClass.textField('Confirm Password',obscure:check,prefix:Icon(Icons.lock),textinputaction: TextInputAction.go),
            SizedBox(height:58),
             ReusableClass.raisedButton('Sign Up', (){
               setState(() {
                 ReusableClass.setRootView(HomeView());
               });
             }),
             Text('-- Or Sign Up with --'),
              Container(
                              child:
                          //      Column(
                          //  crossAxisAlignment: CrossAxisAlignment.center,
                          //  children: [
                             
                          //   Text('-Or sign up with-'),
                              Row(
                                
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   IconButton(onPressed: (){}, icon: Image.asset('Asset/google.png')),
                                    IconButton(onPressed: (){}, icon: Image.asset('Asset/facebook.png')),
                                    IconButton(onPressed: (){}, icon: Image.asset('Asset/twitter.png'))
                                 ],),
                          // ],),
              ),
       
       
             
      
        ],)
      ),
    
    );
  }
}
