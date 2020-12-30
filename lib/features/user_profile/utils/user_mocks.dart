import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:firebaseblocryze/features/user_profile/model/user_profile_model.dart';

class UserMocks {
  static UserProfileModel getMockUser() {
    return UserProfileModel(
        name: 'Walter White',
        jobTitle: 'Meth Professor',
        profilePic:
            'https://i.insider.com/5dade9bc045a3139e8686c33?width=1136&format=jpeg',
        about: HomePageStrings.dummyProfileSection +
            HomePageStrings.dummyProfileSection,
    email: 'bluemethdealer@gmail.com',
    currentCity: 'Albuquerque ',
    dateOfBirth: '6/5/1956');
  }
}
