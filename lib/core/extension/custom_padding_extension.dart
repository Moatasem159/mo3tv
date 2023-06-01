import 'package:flutter/material.dart';
extension CustomPadding on Widget{
  addAllPadding(double val)=>Padding(padding:EdgeInsets.all(val),child:this);
  addSymmetricPadding({double h=0,double v=0})=>Padding(
      padding: EdgeInsets.symmetric(horizontal: h,vertical:v),child:this);
  addPadding({double t=0,double b=0,double r=0,double l=0})=>Padding(
      padding: EdgeInsets.only(top:t,bottom:b,right:r ,left:l),child:this);
}