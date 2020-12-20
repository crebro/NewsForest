import 'package:NewsForest/constants/papersImages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                    child: Image.network(
                  PaperImages.kantipur,
                  height: 75,
                  width: 225,
                )),
                Center(
                  child: Image.network(
                    PaperImages.himalayanTimes,
                    width: 300,
                    height: 100,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Center(
                  child: Text(
                    "News Forest",
                    style: TextStyle(
                        color: Color(0xffFF6464),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 50),
                  ),
                ),
                Center(
                  child: Text(
                    "News From Every Resources",
                    style: TextStyle(
                        color: Color(0xffFF6464),
                        fontWeight: FontWeight.w700,
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontSize: 25),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Center(
                  child: Image.network(
                    PaperImages.nayaPatrika,
                    width: 300,
                    height: 50,
                  ),
                ),
                Center(
                  child: Image.network(
                    PaperImages.kathmanduPost,
                    width: 300,
                    height: 50,
                  ),
                ),
                Center(
                  child: Image.network(
                    PaperImages.nagarik,
                    width: 300,
                    height: 60,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
