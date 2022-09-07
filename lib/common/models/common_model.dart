// To parse this JSON data, do
//
//     final commonModel = commonModelFromJson(jsonString);

import 'dart:convert';

CommonModel commonModelFromJson(String str) =>
    CommonModel.fromJson(json.decode(str));

String commonModelToJson(CommonModel data) => json.encode(data.toJson());

class CommonModel {
  CommonModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datum>? data;

  factory CommonModel.fromJson(Map<String, dynamic> json) => CommonModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.memberId,
    this.somitiId,
    this.officerId,
    this.amount,
    this.requestDate,
    this.paydate,
    this.method,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? memberId;
  int? somitiId;
  int? officerId;
  int? amount;
  String? requestDate;
  dynamic paydate;
  String? method;
  String? description;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        memberId: json["member_id"],
        somitiId: json["somiti_id"],
        officerId: json["officer_id"],
        amount: json["amount"],
        requestDate: json["request_date"],
        paydate: json["paydate"],
        method: json["method"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "member_id": memberId,
        "somiti_id": somitiId,
        "officer_id": officerId,
        "amount": amount,
        "request_date": requestDate,
        "paydate": paydate,
        "method": method,
        "description": description,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
