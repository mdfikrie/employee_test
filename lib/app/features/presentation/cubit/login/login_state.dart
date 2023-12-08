part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginLoaded extends LoginState {
  final LoginModel? login;
  const LoginLoaded({this.login});
  @override
  List<Object> get props => [login!];
}

final class LoginError extends LoginState {
  final String? error;
  const LoginError({this.error});
  @override
  List<Object> get props => [error!];
}
