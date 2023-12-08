part of 'create_user_cubit.dart';

sealed class CreateUserState extends Equatable {
  const CreateUserState();
}

final class CreateUserInitial extends CreateUserState {
  @override
  List<Object> get props => [];
}

final class CreateUserLoading extends CreateUserState {
  @override
  List<Object> get props => [];
}

final class CreateUserLoaded extends CreateUserState {
  final UserParam? user;
  const CreateUserLoaded({this.user});
  @override
  List<Object> get props => [user!];
}

final class CreateUserError extends CreateUserState {
  final String? error;
  const CreateUserError({this.error});
  @override
  List<Object> get props => [error!];
}
