import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebaseblocryze/features/user_profile/model/user_profile_model.dart';
import 'package:flutter/material.dart';

class ProfilePageHeaderWidget extends StatelessWidget {
  final UserProfileModel user;

  ProfilePageHeaderWidget({@required this.user});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        width: width,
        height: height / 4.5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).textTheme.headline6.color, width: 1.2),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(user.profilePic, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    user.name,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  user.jobTitle,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(imageUrl: 'https://assets.stickpng.com/images/58e91afdeb97430e81906504.png', width: 24, height: 24, fit: BoxFit.cover),
                    const SizedBox(width: 12.0),
                    CachedNetworkImage(imageUrl: 'https://blueprint-api-production.s3.amazonaws.com/uploads/story/thumbnail/72606/948737b3-1919-47f7-b549-36da4f6a304e.png', width: 26, height: 26, fit: BoxFit.fill),
                    const SizedBox(width: 12.0),
                    CachedNetworkImage(imageUrl: 'https://cdn.iconscout.com/icon/free/png-512/apple-phone-2-493154.png', width: 26, height: 26, fit: BoxFit.fill),

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
