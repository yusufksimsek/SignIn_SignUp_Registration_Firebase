import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_login_register_firebase_system/Color/color_utils.dart';
import 'package:user_login_register_firebase_system/screens/signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? userEmail;

  @override
  void initState() {
    super.initState();
    getUserEmail();
  }

  Future<void> getUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            hexStringToColor("4DD4AC"),
            hexStringToColor("0E31AE"),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/avatar.png",
              height: 150,
              width: 250,
              color: Colors.white,
            ),
            Text("Welcome to your account", style: TextStyle(color: Colors.white, fontSize: 20,),),
            userEmail != null ? Text(
              userEmail!,
              style: TextStyle(color: Colors.white54,fontSize: 15),
            ) : SizedBox(),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Signed Out',style: TextStyle(color: Colors.black),),
                      backgroundColor: Colors.white,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.yellow,
              ),
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}




