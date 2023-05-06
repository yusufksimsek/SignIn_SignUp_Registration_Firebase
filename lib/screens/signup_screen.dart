import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_login_register_firebase_system/Color/color_utils.dart';
import 'package:user_login_register_firebase_system/screens/home_screen.dart';
import 'package:user_login_register_firebase_system/widgets/SignButton_widget.dart';
import 'package:user_login_register_firebase_system/widgets/TextField_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("4DD4AC"),
                //hexStringToColor("DD1010"),
                hexStringToColor("0E31AE"),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                     SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Username", Icons.person_outline, false,
                        _userNameTextController),
                     SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Email Id", Icons.alternate_email_outlined, false,
                        _emailTextController),
                     SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outlined, true,
                        _passwordTextController),
                     SizedBox(height: 20,),
                   signInSignUpButton(context, false, (){
                     FirebaseAuth.instance.createUserWithEmailAndPassword(
                         email: _emailTextController.text,
                         password: _passwordTextController.text).then((value) {
                       print("Created new Account");
                       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                         }).catchError((error) {
                       ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                           content: Text('The email address is already in use by another account.',style: TextStyle(color: Colors.black),),
                           backgroundColor: Colors.white,
                           behavior: SnackBarBehavior.floating,
                         ),
                       );
                       print("Error: ${error.toString()}");
                     });
                   }),
                    Row(
                      children: [
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.height * 0.18,
                          color: Colors.grey,
                        ),
                        const Text("   Or Sign Up with   ",style: TextStyle(color: Colors.white70),),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.height * 0.18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(height: 50,width: 50,
                          child: Image.asset("images/twitter.png"),
                          margin: EdgeInsets.only(left: 20),
                        ),
                        Container(height: 50,width: 50,
                          child: Image.asset("images/google.png"),
                          margin: EdgeInsets.only(left: 50),
                        ),
                        Container(height: 90,width: 90,
                          child: Image.asset("images/apple.png"),
                          margin: EdgeInsets.only(left: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ))),
    );
  }
}



