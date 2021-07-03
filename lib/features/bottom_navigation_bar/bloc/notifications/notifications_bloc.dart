import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/repository/applications_notifier/applications_notifier_repository.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/notification.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final ApplicationsNotifierRepository applicationsNotifierRepository;
  NotificationsBloc(this.applicationsNotifierRepository)
      : super(NotificationsInitial());

  @override
  Stream<NotificationsState> mapEventToState(
    NotificationsEvent event,
  ) async* {
    if (event is FetchNotifications) {
      yield NotificationsFetchInProgress();
      var notificationsList;
      try {
        notificationsList = await applicationsNotifierRepository
            .getNotificationsList(userId: '123');
      } on Exception {
        yield NotificationsFetchFailure('FAIL');
        return;
      }

      if (notificationsList == null) {
        yield NotificationsFetchFailure('EMPTY OBJECT');
        return;
      }

      print(
          '######### NOTIFICATIONS Data in BLoc: ${notificationsList.toJson().toString()}');
      yield NotificationsFetchSuccess(notificationsList: notificationsList);
    }
  }
}
