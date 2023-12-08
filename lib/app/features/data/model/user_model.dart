import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;
  const UserModel(
      {this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, firstName, lastName, avatar];
}
