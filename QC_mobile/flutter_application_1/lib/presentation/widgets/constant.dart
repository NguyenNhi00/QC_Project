import 'package:flutter/material.dart';

late double screenWidthGlobal;

class Constants{
  static const String baseUrl = "http://10.84.50.10:8084";

  static const Color mainColor = Color(0xff001D37); 
  static const Color secondaryColor = Color(0xff00294D);
  static const Color thirdColor = Color(0xff00294D);
  static const Duration timeOutLimittation = Duration(seconds: 5);
}
class SizeConfig{
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth; // glogical pixel
  static late double screenheight; // glogical pixel
   late double aspech;
   
  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenheight = _mediaQueryData.size.height;
    screenWidthGlobal = screenWidth;

  }
}