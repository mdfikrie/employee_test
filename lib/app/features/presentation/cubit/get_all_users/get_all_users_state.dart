part of 'get_all_users_cubit.dart';

sealed class GetAllUsersState extends Equatable {
  const GetAllUsersState();
}

final class GetAllUsersInitial extends GetAllUsersState {
  @override
  List<Object> get props => [];
}

final class GetAllUsersLoaded extends GetAllUsersState {
  final List<UserModel>? userList;
  final List<String>? userStar;
  const GetAllUsersLoaded({this.userList, this.userStar});
  @override
  List<Object> get props => [userList!, userStar!];
}

final class GetAllUsersLoading extends GetAllUsersState {
  @override
  List<Object> get props => [];
}

final class GetAllUsersError extends GetAllUsersState {
  final String? error;
  const GetAllUsersError({this.error});
  @override
  List<Object> get props => [error!];
}
