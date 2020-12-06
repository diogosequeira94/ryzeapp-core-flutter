import 'package:firebaseblocryze/repository/job_posts/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {

  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context){
    print('Category tapped');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () => _selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child:
        Column(
          children: <Widget>[
            Text(category.title),
            SizedBox(height: 10.0),
            Image.network(category.imageUrl,
                height: 40,
                width: double.infinity,
                fit: BoxFit.contain)
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
              colors:[
                category.color.withOpacity(0.5),
                category.color
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
        ),
      ),
    );
  }
}