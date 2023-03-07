part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  UserState(this.allUsers);

  List<User> allUsers;

  @override
  List<Object> get props => [allUsers];
}

class UserInitial extends UserState {
  UserInitial(List<User> allUsers) : super(allUsers);
}

class UserLoading extends UserState {
  UserLoading(List<User> allUsers) : super(allUsers);
}

class UserFinish extends UserState {
  UserFinish(List<User> allUsers) : super(allUsers);
}

class UserError extends UserState {
  UserError(List<User> allUsers) : super(allUsers);
}
