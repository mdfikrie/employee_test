import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String? email;
  final String? password;

  const LoginParams({this.email, this.password});

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      LoginParams(email: json["email"], password: json["password"]);

  Map<String, dynamic> toJson() => {"email": email, "password": password};

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
