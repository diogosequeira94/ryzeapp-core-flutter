import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:firebaseblocryze/features/home_page/utils/job_post_strings.dart';
import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/bloc.dart';
import 'package:firebaseblocryze/features/user_profile/cubit/user_form_cubit.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/common/profile_page_header.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/common/profile_page_section.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/edit_page/date_of_birth_picker.dart';
import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class EditProfileForm extends StatefulWidget {
  final UserProfile userProfile;
  const EditProfileForm(this.userProfile);

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  FocusNode aboutNode;
  FocusNode phoneNumberNode;
  FocusNode cityNode;
  FocusNode submitNode;
  TextEditingController aboutController;
  TextEditingController phoneNumberController;
  TextEditingController cityController;

  @override
  void initState() {
    super.initState();
    aboutNode = FocusNode();
    cityNode = FocusNode();
    phoneNumberNode = FocusNode();
    submitNode = FocusNode();
    aboutController = TextEditingController();
    phoneNumberController = TextEditingController();
    cityController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    aboutNode.dispose();
    phoneNumberNode.dispose();
    cityNode.dispose();
    submitNode.dispose();
    aboutController.dispose();
    phoneNumberController.dispose();
    cityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfilePageHeaderWidget(user: widget.userProfile),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 6.0, right: 6.0),
              child: Divider(
                color: Colors.grey[300],
                thickness: 2.0,
              ),
            ),
            _AboutInput(widget.userProfile.about),
            DateOfBirthPicker(),
            _CityInput(widget.userProfile.city),
            _PhoneNumberInput(widget.userProfile.phoneNumber),
            _EducationInput(),
            _SkillsInput(),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: CheckboxListTile(
                  value: true,
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: Text(
                      'Driver',
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.platform,
                  contentPadding: EdgeInsets.all(0.0),
                  activeColor: Theme.of(context).accentColor,
                  onChanged: (bool checkBoxValue) {}),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: ProfilePageSection(
                title: UserProfileString.attachmentsSection,
                body: HomePageStrings.dummyProfileSection,
                hasDivider: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: _CreateJobButton(widget.userProfile),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutInput extends StatelessWidget {
  final String about;
  const _AboutInput(this.about);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileFormCubit, UserFormState>(
        builder: (context, state) {
      return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextFormField(
              autofocus: false,
              minLines: 3,
              maxLines: 16,
              maxLengthEnforced: true,
              maxLength: 500,
              keyboardType: TextInputType.text,
              enabled: true,
              initialValue: about,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'About',
                hintText: 'Write something to describe yourself',
                errorText:
                    state.about.invalid ? 'About Section is Invalid' : null,
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
                ),
              ),
              onChanged: (about) {
                context.read<UserProfileFormCubit>().aboutChanged(about);
              }));
    });
  }
}

class _EducationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: TextFormField(
          autofocus: false,
          minLines: 3,
          maxLines: 16,
          maxLengthEnforced: true,
          maxLength: 500,
          keyboardType: TextInputType.text,
          enabled: true,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Education',
            hintText: 'Education About yourself',
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
        ));
  }
}

class _SkillsInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: TextFormField(
          autofocus: false,
          minLines: 3,
          maxLines: 16,
          maxLengthEnforced: true,
          maxLength: 500,
          keyboardType: TextInputType.text,
          enabled: true,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Skills',
            hintText: 'Write something about your skills',
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
        ));
  }
}

class _CityInput extends StatelessWidget {
  final String city;
  const _CityInput(this.city);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileFormCubit, UserFormState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextFormField(
          autofocus: false,
          maxLength: 15,
          keyboardType: TextInputType.text,
          enabled: true,
          textInputAction: TextInputAction.next,
          initialValue: city ?? '',
          decoration: InputDecoration(
            labelText: 'City',
            hintText: 'E.g Lisbon',
            errorText:
                state.city.invalid ? JobPostStrings.jobFormInvalidCity : null,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
          onChanged: (city) =>
              context.read<UserProfileFormCubit>().cityChanged(city),
        ),
      );
    });
  }
}

class _PhoneNumberInput extends StatelessWidget {
  final String phoneNumber;
  const _PhoneNumberInput(this.phoneNumber);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileFormCubit, UserFormState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextFormField(
          autofocus: false,
          maxLength: 15,
          keyboardType: TextInputType.number,
          enabled: true,
          textInputAction: TextInputAction.next,
          initialValue: phoneNumber ?? '',
          decoration: InputDecoration(
            labelText: 'Phone Number',
            errorText:
                state.phoneNumber.invalid ? 'Invalid phone number.' : null,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
          onChanged: (phoneNumber) => context
              .read<UserProfileFormCubit>()
              .phoneNumberChanged(phoneNumber),
        ),
      );
    });
  }
}

class _CreateJobButton extends StatelessWidget {
  final UserProfile userProfile;
  const _CreateJobButton(this.userProfile);
  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    return BlocBuilder<UserProfileFormCubit, UserFormState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, formState) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            return RyzePrimaryButton(
              title: 'Save Changes',
              enabled: formState.status.isValidated,
              action: () {
                formState.profilePicture == null
                    ? _showConfirmationDialog(context, formState)
                    : _updateUserProfilePost(context, userProfile, formState);
              },
              isAffirmative: true,
              isLoading: userState is UserProfileEditInProgress,
            );
          },
        );
      },
    );
  }

  _updateUserProfilePost(
      BuildContext context, UserProfile userProfile, UserFormState formState) {
    final _userBloc = context.read<UserBloc>();
    final userId = BlocProvider.of<AuthBloc>(context).userId;
    _userBloc.add(UserProfileSavePressed(
        userProfile: UserProfile(
          firstName: userProfile.firstName,
          lastName: userProfile.lastName,
          about: formState.about.value,
          email: userProfile.email,
          phoneNumber: formState.phoneNumber.value,
          dateOfBirth: null,
          city: formState.city.value,
          isDriver: false,
          skills: null,
          education: null,
          jobsCompleted: null,
          noShows: null,
        ),
        userId: userId,
        profileImage: formState.profilePicture));
  }

  _showConfirmationDialog(BuildContext context, UserFormState formState) {
    AwesomeDialog(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      context: context,
      width: 350,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      dialogType: DialogType.NO_HEADER,
      title: 'Confirmation',
      desc: 'Are you sure you want to continue without selecting any photo?',
      btnCancelText: 'Go Back',
      btnCancelColor: Theme.of(context).accentColor,
      btnOkText: 'Continue',
      btnOkColor: Colors.black,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        _updateUserProfilePost(context, userProfile, formState);
      },
    )..show();
  }
}
