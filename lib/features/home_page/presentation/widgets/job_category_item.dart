import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebaseblocryze/repository/job_posts/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 1.0, right: 1.0),
      child: GestureDetector(
        onTap: () {},
        child: Material(
          borderRadius: BorderRadius.circular(15.0),
          elevation: 1.0,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).cardColor.withOpacity(0.3),
                    spreadRadius: 2.0,
                    blurRadius: 3.0,
                  ),
                ],
                color: Theme.of(context).cardColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                    child: CachedNetworkImage(
                        imageUrl: category.imageUrl,
                        height: 50,
                        width: double.infinity,
                        fit: BoxFit.contain),
                  ),
                ),
                Text(
                  category.title,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
