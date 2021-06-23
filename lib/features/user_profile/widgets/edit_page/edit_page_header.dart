import 'dart:io';

import 'package:firebaseblocryze/features/user_profile/cubit/user_form_cubit.dart';
import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPageHeaderWidget extends StatelessWidget {
  final UserProfile user;

  EditPageHeaderWidget({@required this.user});

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
            _ProfileAvatar(user),
            SizedBox(width: 20.0),
            _DetailsRow(
                '${user.firstName} ${user.lastName}', 'Software Developer'),
          ],
        ),
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  final UserProfile user;
  const _ProfileAvatar(this.user);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileFormCubit, UserFormState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () async => await getImage(context),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: state.profilePicture != null
                  ? Image.file(
                      state.profilePicture,
                      fit: BoxFit.scaleDown,
                    ).image
                  : AssetImage('assets/profile-avatar-placeholder.png'),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              child: Container(
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
              ),
            )
          ],
        ),
      );
    });
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
