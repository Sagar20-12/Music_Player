import 'package:flutter/material.dart';

import 'colors.dart';
const bold = "bold";
const regular = "regular";

ourStyle({fontFamily = "regular", double?size = 14, color = Colors.white}){
  return TextStyle(
          fontSize: size,
           color: color,
           fontFamily: "bold",
           );
}