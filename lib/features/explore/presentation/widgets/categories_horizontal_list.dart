import 'package:firebaseblocryze/features/home_page/presentation/widgets/job_category_item.dart';
import 'package:firebaseblocryze/repository/job_posts/models/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesHorizontalListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesList = DUMMY_CATEGORIES.map((cat) {
      return CategoryItem(cat);
    }).toList()
      ..sort((a, b) => a.category.title.compareTo(b.category.title));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CategoryItem(categoriesList[index].category),
            );
          }),
    );
  }
}
