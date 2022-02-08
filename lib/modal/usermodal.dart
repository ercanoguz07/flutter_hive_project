import 'package:hive/hive.dart';
import 'package:testbank/manager/hive_constants.dart';
part 'usermodal.g.dart';

@HiveType(typeId: HiveConstants.userTypeId)
class UserModel {
  UserModel(
      {this.id,
      this.gender,
      this.username,
      this.email,
      this.password,
      this.date});

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? gender;
  @HiveField(2)
  String? username;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? password;
  @HiveField(5)
  DateTime? date;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? json["id"],
        gender: json["name"] ?? json["name"],
        username: json["username"] ?? json["username"],
        email: json["email"] ?? json["email"],
        password: json["phone"] ?? json["phone"],
        date: json["date"] ?? json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? id,
        "gender": gender ?? gender,
        "username": username ?? username,
        "email": email ?? email,
        "password": password ?? password,
        "date": date ?? date,
      };
}
