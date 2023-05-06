import 'package:flutter/material.dart';

Image logoWidget(String imageName){
  return Image.asset(height: 220,width: 330,
    imageName,
    fit: BoxFit.fitWidth,
    color: Colors.white,);
}