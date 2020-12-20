import 'package:flutter/material.dart';

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            color: Colors.grey,
          ),
          SizedBox(height: 10),
          Container(
            width: 150,
            height: 25,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
