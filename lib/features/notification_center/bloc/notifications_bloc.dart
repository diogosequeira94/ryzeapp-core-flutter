import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        final FirebaseAuth auth = FirebaseAuth.instance;
        final User user = auth.currentUser;
        final uid = user.uid;
        notificationsList = await applicationsNotifierRepository
            .getNotificationsList(userId: uid);
      } on Exception {
        yield NotificationsFetchFailure('FAIL');
        return;
      }
      if (notificationsList == null) {
        yield NotificationsFetchFailure('EMPTY OBJECT');
        return;
      }
      yield NotificationsFetchSuccess(notificationsList: notificationsList);
    }
  }
}
