part of 'notifications_bloc.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();
}

class FetchNotifications extends NotificationsEvent {
  @override
  List<Object> get props => [];
}

class DeleteNotification extends NotificationsEvent {
  final Notification notification;
  DeleteNotification(this.notification);
  @override
  List<Object> get props => [notification];
}

class DeleteAllNotifications extends NotificationsEvent {
  @override
  List<Object> get props => [];
}
