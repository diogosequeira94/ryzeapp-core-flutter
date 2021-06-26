import 'package:firebaseblocryze/features/home_page/presentation/widgets/home_page/job_category_item.dart';
import 'package:firebaseblocryze/repository/job_posts/models/categories/main_categories.dart';
import 'package:flutter/material.dart';

class CategoriesGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: MAIN_CATEGORIES.map((cat) {
          return CategoryItem(cat);
        }).toList()
          ..sort((a, b) => a.category.title.compareTo(b.category.title)));
  }
}
