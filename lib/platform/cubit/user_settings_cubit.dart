import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/features/login/utils/shared_preferences.dart';

part 'user_settings_state.dart';

class UserSettingsCubit extends Cubit<UserSettingsState> {
  UserSettingsCubit() : super(UserSettingsState());

  void receiveInvitesChanged(bool value) {
    sharedPrefs.isReceiveInviteNotifications = value;
    emit(state.copyWith(
      shouldHideUnsuccessful: state.shouldHideUnsuccessful,
      receiveInviteNotifications: value,
      receiveResponseNotifications: state.receiveResponseNotifications,
    ));
  }

  void receiveResponsesChanged(bool value) {
    sharedPrefs.isReceiveResponsesNotifications = value;
    emit(state.copyWith(
      shouldHideUnsuccessful: state.shouldHideUnsuccessful,
      receiveInviteNotifications: state.receiveInviteNotifications,
      receiveResponseNotifications: value,
    ));
  }

  void shouldHideNotificationsChanged(bool value) {
    sharedPrefs.shouldHideUnsuccessfulApps = value;
    emit(state.copyWith(
      shouldHideUnsuccessful: value,
      receiveInviteNotifications: state.receiveInviteNotifications,
      receiveResponseNotifications: state.receiveResponseNotifications,
    ));
  }
}
