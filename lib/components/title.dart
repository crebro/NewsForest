import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      padding: EdgeInsets.all(5),
      child: Center(
        child: Text(
          "News Forest",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.robotoSlab().fontFamily,
              fontSize: 40),
        ),
      ),
    );
  }
}
