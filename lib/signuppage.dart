import 'package:flutter/material.dart';
import 'package:bucket/signuppage.dart';
import 'loginpage.dart';

class SignupPage extends StatefulWidget{
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var newuserid=TextEditingController();
  var newuserpass=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child:
        Container(width: 300,child: Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
      TextField(controller:newuserid,decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),prefixText: "Username  "),),
        Container(height: 11,),
        TextField(controller:newuserpass,obscureText: true,decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),prefixText: "Password  "),),
        Container(height: 11,),
        ElevatedButton(onPressed:(){
          String nuname=newuserid.text;
          String nupass=newuserpass.text;
          print(nuname);print(nupass);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage(),));
          //userid.clear();userpass.clear();
        }, child: Text("SignUp"))
    ],),),),);
  }
}