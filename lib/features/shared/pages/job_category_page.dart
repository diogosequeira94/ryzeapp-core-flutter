import 'package:firebaseblocryze/features/home_page/presentation/widgets/shared/job_card_item.dart';
import 'package:firebaseblocryze/features/shared/widgets/job_category_page_header.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:flutter/material.dart';

class JobCategoryPage extends StatelessWidget {
  final String category;
  final List<JobPost> jobsList;

  const JobCategoryPage(this.category, this.jobsList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          category,
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            JobCategoryPageHeader(category,
                'Restaurant jobs can be from Bartending, Front-of-House, Cook, Chef and many other. Always dress sharp and stay clean!'),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                    child: Text('${jobsList.length.toString()} Jobs found'),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: jobsList.length,
                    itemBuilder: (context, index) {
                      final jobPost = jobsList[index];
                      return JobCardItem(jobPost);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
