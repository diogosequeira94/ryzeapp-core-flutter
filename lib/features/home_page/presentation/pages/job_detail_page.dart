import 'package:firebaseblocryze/features/home_page/presentation/model/job_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class JobDetailPage extends StatelessWidget {
  final JobPostModel jobPostModel;
  JobDetailPage({@required this.jobPostModel});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Job Details',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: [
              Container(
                height: height * 0.55,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(jobPostModel.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.5),
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobPostModel.title,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      jobPostModel.description,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      jobPostModel.city,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      'Pay Rate',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      jobPostModel.hourRate,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    InkWell(
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
                            'Apply Now',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
