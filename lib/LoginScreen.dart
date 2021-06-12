import 'package:flutter/material.dart';
import 'package:snapseed/HomeView.dart';
import 'package:snapseed/SignUp.dart';

import 'ReusableClass.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title:Text('Welcome',style: TextStyle(color:Colors.black),),
      // centerTitle:true,backgroundColor: Colors.blueGrey[100],),
      body:  SingleChildScrollView(
                child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget>[
                SizedBox(height:25),
                Center(
                  child:Image.asset('Asset/logo.png',scale: 2.0,),
                ),
                Text('S n a p S e e d',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
                SizedBox(height:18),
            ReusableClass.textField('E-mail', obscure: false,prefix: Icon(Icons.person,),textinputaction: TextInputAction.next),
            // ReusableClass.textField('Password', obscure:check,prefix: IconButton(onPressed: (){
            //  setState(() {
            //    check=!check;
            //  });
            // }, icon: check?Icon(Icons.visibility_off):Icon(Icons.visibility_off))),
            ReusableClass.textField('Password',obscure: true,prefix: Icon(Icons.lock),textinputaction: TextInputAction.done),
            SizedBox(height:28),
         // TextButton(child:Text('dkhgfdk') ,onPressed:(){ReusableClass.setRootView(HomeScreen());}),
            ReusableClass.raisedButton('SIGN IN', (){ReusableClass.setRootView(HomeView());}),
            SizedBox(height:25),
            Row
            ( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
                children:[
                   IconButton(onPressed: (){}, icon: Image.asset('Asset/google.png',),iconSize: 35,),
                   IconButton(onPressed: (){}, icon: Image.asset('Asset/facebook.png'),iconSize:35 ),
                   IconButton(onPressed: (){}, icon: Image.asset('Asset/twitter.png'),iconSize:35 )
            ]
            ),  
                       Row(
        //   crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text("Don't have an account?",style: TextStyle(fontWeight:FontWeight.bold),),
                 TextButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                 }, child: Text('SIGN UP NOW',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.green),))
                 //Ink(child:Text('SIGN UP NOW',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.green)))
                ],),
            
            ]
          ),
              
      ),
      
      
      
    );
  }

}
//  Row(
//         //   crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                  Text("Don't have an account?",style: TextStyle(fontWeight:FontWeight.bold),),
//                TextButton(onPressed: (){
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
//                }, child: Text('SIGN UP NOW',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.green),))
//                //Ink(child:Text('SIGN UP NOW',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.green)))
//               ],),