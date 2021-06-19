import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserProfileFetched extends UserEvent {
  final String userId;
  const UserProfileFetched({this.userId});
  @override
  List<Object> get props => [userId];
}
