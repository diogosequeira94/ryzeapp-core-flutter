import 'package:expandable_text/expandable_text.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/pages.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/shared/favourites_icon.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:flutter/material.dart';

class JobCardItem extends StatelessWidget {
  final JobPost jobPost;
  const JobCardItem(this.jobPost);
  @override
  Widget build(BuildContext context) {
    return _newJobCard(context, jobPost);
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
                      child: AddToFavouritesIcon(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text('${jobPost.city}, Portugal'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(jobPost.hourRate),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Icon(Icons.calendar_today_outlined, size: 20.0),
                      //         const SizedBox(width: 6.0),
                      //         Text('${jobPost.startDate}'),
                      //       ],
                      //     ),
                      //     const SizedBox(height: 4.0),
                      //     Row(
                      //       children: [
                      //         Icon(
                      //           Icons.alarm,
                      //           size: 20.0,
                      //         ),
                      //         const SizedBox(width: 6.0),
                      //         Text('${jobPost.startTime}'),
                      //       ],
                      //     )
                      //   ],
                      // ),
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
