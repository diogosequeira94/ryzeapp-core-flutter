import 'package:firebaseblocryze/features/home_page/presentation/widgets/confirmation_page_header.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class JobConfirmationPage extends StatelessWidget {
  final JobPost jobPost;
  const JobConfirmationPage({@required this.jobPost});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.close, color: Colors.black),
          onTap: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Job Confirmation',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConfirmationPageHeader(jobEntityName: jobPost.title),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                child: Image.network(
                    'https://www.sfmission.com/gallery_files/site_pics/Portugal/Lisbon/maps_and_guides/Lisbon-Google-Map.jpg',
                    width: width,
                    height: 200,
                    fit: BoxFit.fill),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              jobPost.description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Location',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              jobPost.city,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Pay Rate',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              jobPost.hourRate,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 26.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF3229bf),
                          Color(0xFF4568ff),
                        ],
                      ),
                      borderRadius:
                      BorderRadius.all(Radius.circular(50.0))),
                  child: Center(
                    child: const Text(
                      'Add to my Calendar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 26.0),
          ],
        ),
      ),
    );
  }
}
