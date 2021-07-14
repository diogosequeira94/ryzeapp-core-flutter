import 'package:firebaseblocryze/platform/hive/hive_orchestrator.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:flutter/material.dart';

class AddToFavouritesIcon extends StatefulWidget {
  final JobPost jobPost;
  AddToFavouritesIcon(this.jobPost);
  @override
  _AddToFavouritesIconState createState() => _AddToFavouritesIconState();
}

class _AddToFavouritesIconState extends State<AddToFavouritesIcon> {
  final hiveOrchestrator = HiveOrchestrator();
  @override
  Widget build(BuildContext context) {
    bool isSelected = hiveOrchestrator.exists(widget.jobPost.jobID);
    return GestureDetector(
      onTap: () {
        if (isSelected) {
          setState(() {
            hiveOrchestrator.deletePost(widget.jobPost.jobID);
          });
        } else {
          setState(() {
            hiveOrchestrator.addPost(
              id: widget.jobPost.jobID,
              title: widget.jobPost.title,
              posterName: widget.jobPost.posterName,
              description: widget.jobPost.description,
              payRate: widget.jobPost.hourRate,
              location: widget.jobPost.city,
            );
          });
        }
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black54,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Icon(
          isSelected ? Icons.favorite : Icons.favorite_border_rounded,
          color: Colors.black87,
          size: 16.0,
        ),
      ),
    );
  }
}
