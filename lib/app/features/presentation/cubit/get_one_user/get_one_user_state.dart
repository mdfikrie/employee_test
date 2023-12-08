part of 'get_one_user_cubit.dart';

sealed class GetOneUserState extends Equatable {
  const GetOneUserState();
}

final class GetOneUserInitial extends GetOneUserState {
  @override
  List<Object> get props => [];
}

final class GetOneUserLoaded extends GetOneUserState {
  final UserModel? user;
  const GetOneUserLoaded({this.user});
  @override
  List<Object> get props => [user!];
}

final class GetOneUserLoading extends GetOneUserState {
  @override
  List<Object> get props => [];
}

final class GetOneUserError extends GetOneUserState {
  final String? error;
  const GetOneUserError({this.error});
  @override
  List<Object> get props => [error!];
}
