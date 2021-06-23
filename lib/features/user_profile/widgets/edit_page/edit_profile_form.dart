import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:firebaseblocryze/features/home_page/utils/job_post_strings.dart';
import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/bloc.dart';
import 'package:firebaseblocryze/features/user_profile/cubit/user_form_cubit.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/common/profile_page_header.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/common/profile_page_section.dart';
import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class EditProfileForm extends StatefulWidget {
  final UserProfile userProfile;
  const EditProfileForm(this.userProfile);

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  UserProfileFormCubit userFormCubit;
  FocusNode aboutNode;
  FocusNode phoneNumberNode;
  FocusNode cityNode;
  FocusNode submitNode;

  @override
  void initState() {
    super.initState();

    aboutNode = FocusNode();
    cityNode = FocusNode();
    phoneNumberNode = FocusNode();
    submitNode = FocusNode();

    userFormCubit = BlocProvider.of<UserProfileFormCubit>(context);

    //Add Default Values
    userFormCubit.aboutChanged(widget.userProfile.about);
    userFormCubit.cityChanged(widget.userProfile.city);
    userFormCubit.phoneNumberChanged(widget.userProfile.phoneNumber);
    userFormCubit.dateOfBirthSelected(widget.userProfile.dateOfBirth);
  }

  @override
  void dispose() {
    super.dispose();
    aboutNode.dispose();
    phoneNumberNode.dispose();
    cityNode.dispose();
    submitNode.dispose();
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
            _AboutInput(),
            _DateOfBirthPicker(),
            _CityInput(),
            _PhoneNumberInput(),
            _EducationInput(),
            _SkillsInput(),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: CheckboxListTile(
                  value: true,
                  title: Padding(
                    padding: const EdgeInsets.only(top: 6.0, bottom: 14.0),
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
              child: _UpdateUserProfileButton(widget.userProfile),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileFormCubit, UserFormState>(
        builder: (context, state) {
      print('THE INITIAL VALUE IS: ${state.about.value}');
      return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextFormField(
              autofocus: false,
              minLines: 1,
              maxLines: 16,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              maxLength: 500,
              keyboardType: TextInputType.text,
              enabled: true,
              initialValue: state.about.value,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'About',
                hintText: 'Write something to describe yourself',
                labelStyle: TextStyle(height: 0),
                errorText:
                    state.about.invalid ? 'About Section is Invalid' : null,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).accentColor),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).accentColor),
                ),
              ),
              onChanged: (about) {
                print('On Changed About: $about');
                context.read<UserProfileFormCubit>().aboutChanged(about);
              }));
    });
  }
}

class _EducationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextFormField(
          autofocus: false,
          minLines: 1,
          maxLines: 16,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLength: 500,
          keyboardType: TextInputType.text,
          enabled: true,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Education',
            labelStyle: TextStyle(height: 0),
            hintText: 'Education About yourself',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).accentColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).accentColor),
            ),
          ),
        ));
  }
}

class _SkillsInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        autofocus: false,
        minLines: 1,
        maxLines: 16,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        maxLength: 500,
        keyboardType: TextInputType.text,
        enabled: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: 'Skills',
          hintText: 'Write something about your skills',
          labelStyle: TextStyle(height: 0),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).accentColor),
          ),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).accentColor)),
        ),
      ),
    );
  }
}

class _CityInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileFormCubit, UserFormState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextFormField(
            autofocus: false,
            maxLength: 20,
            keyboardType: TextInputType.name,
            enabled: true,
            textInputAction: TextInputAction.next,
            initialValue: state.city.value ?? '',
            decoration: InputDecoration(
              labelText: 'City',
              labelStyle: TextStyle(height: 0),
              hintText: 'E.g Lisbon',
              errorText:
                  state.city.invalid ? JobPostStrings.jobFormInvalidCity : null,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor),
              ),
            ),
            onChanged: (city) {
              print('On Changed City: $city');
              context.read<UserProfileFormCubit>().cityChanged(city);
            }),
      );
    });
  }
}

class _PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileFormCubit, UserFormState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextFormField(
          autofocus: false,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          enabled: true,
          textInputAction: TextInputAction.next,
          initialValue: state.phoneNumber.value ?? '',
          decoration: InputDecoration(
            labelText: 'Phone Number',
            labelStyle: TextStyle(height: 0),
            errorText:
                state.phoneNumber.invalid ? 'Invalid phone number.' : null,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).accentColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).accentColor),
            ),
          ),
          onChanged: (phoneNumber) {
            print('On PhoneNumber: $phoneNumber');
            context
                .read<UserProfileFormCubit>()
                .phoneNumberChanged(phoneNumber);
          },
        ),
      );
    });
  }
}

class _DateOfBirthPicker extends StatefulWidget {
  @override
  _DateOfBirthPickerState createState() => _DateOfBirthPickerState();
}

class _DateOfBirthPickerState extends State<_DateOfBirthPicker> {
  String birthDateInString = 'Eg: 01/01/2000';
  DateTime birthDate;
  bool isDateSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileFormCubit, UserFormState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: GestureDetector(
          onTap: () async {
            final initialDate = DateTime.now();
            final datePick = await showDatePicker(
                context: context,
                initialDate: initialDate,
                firstDate: DateTime(1940),
                lastDate: DateTime(initialDate.year + 1));
            if (datePick != null && datePick != birthDate) {
              context.read<UserProfileFormCubit>().dateOfBirthSelected(
                  '${datePick.day}/${datePick.month}/${datePick.year}');
              isDateSelected = true;
            }
          },
          child: TextFormField(
            key: Key(state.dateOfBirth.value),
            autofocus: false,
            minLines: 1,
            maxLines: 1,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            keyboardType: TextInputType.number,
            enabled: false,
            initialValue: state.dateOfBirth.value ?? birthDateInString,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Date of Birth',
              labelStyle: TextStyle(height: 0),
              errorText:
                  state.dateOfBirth.invalid ? 'Invalid Date of Birth' : null,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor),
              ),
            ),
            onChanged: (dateOfBirth) => context
                .read<UserProfileFormCubit>()
                .dateOfBirthSelected(dateOfBirth),
          ),
        ),
      );
    });
  }
}

class _UpdateUserProfileButton extends StatelessWidget {
  final UserProfile userProfile;
  const _UpdateUserProfileButton(this.userProfile);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileFormCubit, UserFormState>(
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
          dateOfBirth: formState.dateOfBirth.value,
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
