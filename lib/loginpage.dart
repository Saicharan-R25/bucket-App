import 'package:flutter/material.dart';
import 'package:bucket/intropage.dart';
import 'signuppage.dart';
class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
  var userid=TextEditingController();
  var userpass=TextEditingController();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(child:
          Container(width: 300,child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              TextField(controller:userid,decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),prefixText: "Username  "),),
              Container(height: 11,),
              TextField(controller:userpass,obscureText: true,decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),prefixText: "Password  "),),
              Container(height: 11,),
              ElevatedButton(onPressed:(){
                String uname=userid.text;
                String upass=userpass.text;
                print(uname);print(upass);
                userid.clear();userpass.clear();
              }, child: Text("Login")),
            Text("Dont have a Account?"),TextButton(onPressed:(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupPage(),));
              }, child: Text("Signup"))
            ],),

          ),
        ),
      );
    }
  }