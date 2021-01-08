import 'package:NewsForest/constants/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  CategoryItem({this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ColorFiltered(
                colorFilter:
                    ColorFilter.mode(Colors.grey[500], BlendMode.modulate),
                child: Image.network(
                  this.category.imageLocation,
                  width: 275,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.category.name,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
