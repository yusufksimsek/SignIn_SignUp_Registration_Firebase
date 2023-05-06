import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  Container signInSignUpButton(
    BuildContext context,
    bool isLogin,
    void Function() onTap,
  ){
    return Container(height: 50,width: MediaQuery.of(context).size.width/2,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),),
      child: ElevatedButton(
          onPressed: onTap,
          child: Text(isLogin ? 'LOG IN' : 'SIGN UP',style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if(states.contains(MaterialState.pressed)){
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      ),
    );
  }