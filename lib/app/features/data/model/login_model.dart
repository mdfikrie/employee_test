import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String? token;
  const LoginModel({this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(token: json["token"]);

  @override
  // TODO: implement props
  List<Object?> get props => [token];
}
