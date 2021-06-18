import 'package:firebaseblocryze/features/home_page/presentation/cubit/job_form_cubit.dart';
import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_mocks.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_page_header.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_page_section.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditInformationPage extends StatelessWidget {
  final user = UserMocks.getMockUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          UserProfileString.editProfileTitle,
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilePageHeaderWidget(user: user),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 6.0, right: 6.0),
                child: Divider(
                  color: Colors.grey[300],
                  thickness: 2.0,
                ),
              ),
              _AboutInput(),
              _CityInput(),
              _PhoneNumberInput(),

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
                hasDivider: false,),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: RyzePrimaryButton(
                    title: 'Save Changes',
                    action: () => Navigator.pop(context),
                    isAffirmative: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutInput extends StatelessWidget {
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
            labelText: 'About',
            hintText: 'Write something to describe yourself',
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
        ));
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        autofocus: false,
        maxLength: 15,
        keyboardType: TextInputType.text,
        enabled: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: 'City',
          hintText: 'E.g Lisbon',
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
          ),
        ),
        onChanged: (city) => context.read<JobFormCubit>().cityChanged(city),
      ),
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        autofocus: false,
        maxLength: 15,
        keyboardType: TextInputType.number,
        enabled: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: 'Phone Number',
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
          ),
        ),
        onChanged: (city) => context.read<JobFormCubit>().cityChanged(city),
      ),
    );
  }
}
