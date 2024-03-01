import 'package:flutter/material.dart';

class SignButton extends StatelessWidget{

  final Function()? onTap;
  final String message;

 const SignButton ({super.key, required this.onTap, required this.message});

  @override

  Widget build (BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.black),
        ),
        
        child: Center(
          child: Text(
            message,
            style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
  }