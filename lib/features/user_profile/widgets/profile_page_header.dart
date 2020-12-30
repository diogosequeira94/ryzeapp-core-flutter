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
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0),
      child: Container(
        width: width,
        height: height / 4.5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(user.profilePic,
                  fit: BoxFit.fill, height: 150, width: 150),
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
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  user.jobTitle,
                  style: TextStyle(fontSize: 13.0, color: Colors.black54),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.camera_alt, color: Colors.blueAccent),
                    SizedBox(width: 8),
                    Icon(Icons.mail, color: Colors.blueAccent),
                    SizedBox(width: 8),
                    Icon(Icons.add, color: Colors.blueAccent),
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
