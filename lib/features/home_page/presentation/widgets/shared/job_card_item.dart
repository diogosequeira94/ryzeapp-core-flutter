import 'package:expandable_text/expandable_text.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/pages.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:flutter/material.dart';

class JobCardItem extends StatelessWidget {
  final JobPost jobPost;
  const JobCardItem(this.jobPost);
  @override
  Widget build(BuildContext context) {
    return _newJobCard(context, jobPost);
  }

  Widget _oldCard(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(jobPost.title),
        subtitle: Text(jobPost.city),
        trailing: Text(jobPost.hourRate),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => JobDetailPage(
                        jobPost: jobPost,
                      )));
        },
      ),
    );
  }

  Widget _newJobCard(BuildContext context, JobPost jobPost) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => JobDetailPage(
                      jobPost: jobPost,
                    )));
      },
      child: Card(
        child: Container(
          constraints:
              BoxConstraints(minHeight: 180, minWidth: double.infinity),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        jobPost.title,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black54,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          print('Tapped');
                        },
                        child: Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.black87,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text('${jobPost.city}, Portugal'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(jobPost.hourRate),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Starting: ${jobPost.startDate}'),
                          const SizedBox(height: 4.0),
                          Text('Ending: ${jobPost.endDate}')
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Flexible(
                    child: ExpandableText(
                      jobPost.description,
                      collapseText: 'Show less',
                      expandText: 'Show more',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
