import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:firebaseblocryze/features/user_profile/model/user_profile_model.dart';

class UserMocks {
  static UserProfileModel getMockUser() {
    return UserProfileModel(
        name: 'Diogo Sequeira',
        jobTitle: 'Software Programmer',
        profilePic:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbQU03HNQk4dsJUHxDwZuJaAPI164FWc6wjg&usqp=CAU',
        about: HomePageStrings.dummyProfileSection +
            HomePageStrings.dummyProfileSection,
    email: 'diogocnsequeira@gmail.com',
    currentCity: 'Lisbon ',
    dateOfBirth: '6/5/1994');
  }
}
