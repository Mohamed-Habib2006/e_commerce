import 'package:e_commerce/Splashscreen.dart';
import 'package:e_commerce/signin_page.dart';
import 'package:e_commerce/signup_page.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(const ECommerceApp());
}
class ECommerceApp extends StatelessWidget{
  const ECommerceApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Splashscreen()
        );
    }
}