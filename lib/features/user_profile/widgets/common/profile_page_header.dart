import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebaseblocryze/features/user_profile/cubit/user_form_cubit.dart';
import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePageHeaderWidget extends StatelessWidget {
  final UserProfile user;
  final bool isEditing;

  ProfilePageHeaderWidget({@required this.user, this.isEditing = false});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 0.87;
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        width: width,
        height: height / 4.5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async => isEditing ? await getImage(context) : null,
              child: _ProfileAvatar(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbQU03HNQk4dsJUHxDwZuJaAPI164FWc6wjg&usqp=CAU',
                  isEditing),
            ),
            SizedBox(width: 20.0),
            _DetailsRow(
                '${user.firstName} ${user.lastName}', 'Software Developer'),
          ],
        ),
      ),
    );
  }

  Future getImage(BuildContext context) async {
    ImagePicker picker = ImagePicker();
    PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final _image = File(pickedFile.path);
      context.read<UserProfileFormCubit>().profilePictureSelected(_image);
    }
  }
}

class _ProfileAvatar extends StatelessWidget {
  final String profilePicUrl;
  final bool isEditing;
  const _ProfileAvatar(this.profilePicUrl, this.isEditing);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 60.0,
          backgroundImage: NetworkImage(profilePicUrl),
        ),
        Positioned(
            bottom: isEditing ? null : 0.0,
            right: isEditing ? null : 0.0,
            left: isEditing ? 0.0 : null,
            top: isEditing ? 0.0 : null,
            child: isEditing
                ? Container(
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
                    child: Icon(
                      Icons.edit,
                      color: Colors.black54,
                    ),
                  )
                : Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ))
      ],
    );
  }
}

class _DetailsRow extends StatelessWidget {
  final String userName;
  final String jobTitle;

  const _DetailsRow(this.userName, this.jobTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              userName,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            jobTitle,
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.redAccent,
              ),
              SizedBox(width: 5.0),
              Text('Lisbon, Portugal')
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialMediaIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CachedNetworkImage(
            imageUrl:
                'https://assets.stickpng.com/images/58e91afdeb97430e81906504.png',
            width: 24,
            height: 24,
            fit: BoxFit.cover),
        const SizedBox(width: 12.0),
        CachedNetworkImage(
            imageUrl:
                'https://blueprint-api-production.s3.amazonaws.com/uploads/story/thumbnail/72606/948737b3-1919-47f7-b549-36da4f6a304e.png',
            width: 26,
            height: 26,
            fit: BoxFit.fill),
        const SizedBox(width: 12.0),
        CachedNetworkImage(
            imageUrl:
                'https://cdn.iconscout.com/icon/free/png-512/apple-phone-2-493154.png',
            width: 26,
            height: 26,
            fit: BoxFit.fill),
      ],
    );
  }
}
