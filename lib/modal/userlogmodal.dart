import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testbank/manager/hive_constants.dart';
part 'userlogmodal.g.dart';

@HiveType(typeId: HiveConstants.userLogTypeId)
class UserLogModel {
  UserLogModel(
      {this.userId,
      this.fullname,
      this.phone,
      this.amount,
      this.country,
      this.islem,
      this.islemDate});

  @HiveField(0)
  int? userId;
  @HiveField(1)
  String? fullname;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  String? amount;
  @HiveField(4)
  String? country;
  @HiveField(5)
  String? islem;
  @HiveField(6)
  DateTime? islemDate;

  factory UserLogModel.fromJson(Map<String, dynamic> json) => UserLogModel(
        userId: json["userId"] ?? json["userId"],
        fullname: json["fullname"] ?? json["fullname"],
        phone: json["phone"] ?? json["phone"],
        amount: json["amount"] ?? json["amount"],
        country: json["country"] ?? json["country"],
        islem: json["islem"] ?? json["islem"],
        islemDate: json["islem"] ?? json["islemDate"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId ?? userId,
        "fullname": fullname ?? fullname,
        "phone": phone ?? phone,
        "amount": amount ?? amount,
        "country": country ?? country,
        "islem": islem ?? islem,
        "islemDate": islemDate ?? islemDate,
      };
}
