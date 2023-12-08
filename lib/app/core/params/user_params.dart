import 'package:employee_test/app/features/data/model/user_model.dart';
import 'package:equatable/equatable.dart';

class UserParam extends Equatable {
  final String? name;
  final String? nickname;
  final String? job;
  final String? email;
  final String? site;
  final String? telp;

  UserParam(
      {this.name, this.job, this.nickname, this.email, this.site, this.telp});

  factory UserParam.fromJson(Map<String, dynamic> json) => UserParam(
        name: json["name"],
        job: json["job"],
        nickname: json["nickname"],
        telp: json["telp"],
        email: json["email"],
        site: json["site"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "nickname": nickname,
        "telp": telp,
        "email": email,
        "site": site,
      };

  UserModel toUserModel() => UserModel(
        id: 1,
        firstName: name,
        lastName: "",
        email: email,
        avatar: "",
      );

  @override
  List<Object?> get props => throw UnimplementedError();
}
