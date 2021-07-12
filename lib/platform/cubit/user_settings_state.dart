part of 'user_settings_cubit.dart';

class UserSettingsState extends Equatable {
  const UserSettingsState(
      {this.shouldHideUnsuccessful,
      this.receiveInviteNotifications,
      this.receiveResponseNotifications});

  final bool shouldHideUnsuccessful;
  final bool receiveInviteNotifications;
  final bool receiveResponseNotifications;

  @override
  List<Object> get props => [
        shouldHideUnsuccessful,
        receiveInviteNotifications,
        receiveResponseNotifications
      ];

  UserSettingsState copyWith({
    bool shouldHideUnsuccessful,
    bool receiveInviteNotifications,
    bool receiveResponseNotifications,
  }) {
    return UserSettingsState(
      shouldHideUnsuccessful:
          shouldHideUnsuccessful ?? sharedPrefs.shouldHideUnsuccessfulApps,
      receiveInviteNotifications: receiveInviteNotifications ??
          sharedPrefs.isReceiveInviteNotifications,
      receiveResponseNotifications: receiveResponseNotifications ??
          sharedPrefs.isReceiveResponsesNotifications,
    );
  }
}
