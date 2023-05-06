import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_login_register_firebase_system/Color/color_utils.dart';
import 'package:user_login_register_firebase_system/screens/home_screen.dart';
import 'package:user_login_register_firebase_system/screens/signup_screen.dart';
import 'package:user_login_register_firebase_system/widgets/SignButton_widget.dart';
import 'package:user_login_register_firebase_system/widgets/TextField_widget.dart';
import 'package:user_login_register_firebase_system/widgets/logo_widget.dart';
import 'package:user_login_register_firebase_system/widgets/signup_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("4DD4AC"),
            //hexStringToColor("DD1010"),
            hexStringToColor("0E31AE"),
          ],
          begin: Alignment.topCenter,end: Alignment.bottomCenter,
          ),
        ),
      child: SingleChildScrollView(
       child: Padding(
        padding: EdgeInsets.fromLTRB(20,MediaQuery.of(context).size.height * 0.1,20,0),
         child: Column(
          children: <Widget>[
            logoWidget("images/logo.png"),
            SizedBox(height: 10,),
            reusableTextField(
                "Enter Email or Username",
                Icons.person_outline,
                false,
              _emailTextController,
            ),
            SizedBox(height: 10,),
            reusableTextField(
              "Enter Password",
              Icons.lock_outline,
              true,
              _passwordTextController,
            ),
            SizedBox(height: 20,),
            signInSignUpButton(context, true, () {
              FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text).then((value) {
                Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
              }).catchError((error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Your Email or password is wrong, please try again',style: TextStyle(color: Colors.black),),
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
                width: MediaQuery.of(context).size.height * 0.19,
                color: Colors.grey,
              ),
              const Text("   Or Login with   ",style: TextStyle(color: Colors.white70),),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.height * 0.19,
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
          signup_button(context: context),
          ],
         ),
          ),
        ),
      ),
    );
  }
}





