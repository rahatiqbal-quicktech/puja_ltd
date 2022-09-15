// To parse this JSON data, do
//
//     final profileDetailsModel = profileDetailsModelFromJson(jsonString);

import 'dart:convert';

ProfileDetailsModel profileDetailsModelFromJson(String str) =>
    ProfileDetailsModel.fromJson(json.decode(str));

String profileDetailsModelToJson(ProfileDetailsModel data) =>
    json.encode(data.toJson());

class ProfileDetailsModel {
  ProfileDetailsModel({
    this.status,
    this.profile,
  });

  String? status;
  Profile? profile;

  factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProfileDetailsModel(
        status: json["status"],
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "profile": profile?.toJson(),
      };
}

class Profile {
  Profile({
    this.id,
    this.accountNo,
    this.openingdate,
    this.name,
    this.slug,
    this.fathername,
    this.mothername,
    this.spouse,
    this.presentAddress,
    this.parmenentAddress,
    this.occupation,
    this.signature,
    this.monthlyIncome,
    this.dob,
    this.maritalStatus,
    this.religion,
    this.academicQualification,
    this.loancategoryId,
    this.somitiId,
    this.nid,
    this.contactNo,
    this.email,
    this.nomineeName,
    this.nomineeBirthday,
    this.nomineeRelation,
    this.nomineeContact,
    this.nomineeImage,
    this.nomineeSignature,
    this.image,
    this.verify,
    this.resetToken,
    this.savingsPersent,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? accountNo;
  DateTime? openingdate;
  String? name;
  String? slug;
  String? fathername;
  String? mothername;
  String? spouse;
  String? presentAddress;
  String? parmenentAddress;
  String? occupation;
  String? signature;
  int? monthlyIncome;
  DateTime? dob;
  String? maritalStatus;
  String? religion;
  String? academicQualification;
  dynamic loancategoryId;
  int? somitiId;
  String? nid;
  int? contactNo;
  String? email;
  String? nomineeName;
  DateTime? nomineeBirthday;
  String? nomineeRelation;
  String? nomineeContact;
  String? nomineeImage;
  String? nomineeSignature;
  String? image;
  String? verify;
  String? resetToken;
  int? savingsPersent;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        accountNo: json["account_no"],
        openingdate: DateTime.parse(json["openingdate"]),
        name: json["name"],
        slug: json["slug"],
        fathername: json["fathername"],
        mothername: json["mothername"],
        spouse: json["spouse"],
        presentAddress: json["present_address"],
        parmenentAddress: json["parmenent_address"],
        occupation: json["occupation"],
        signature: json["signature"],
        monthlyIncome: json["monthly_income"],
        dob: DateTime.parse(json["dob"]),
        maritalStatus: json["marital_status"],
        religion: json["religion"],
        academicQualification: json["academic_qualification"],
        loancategoryId: json["loancategory_id"],
        somitiId: json["somiti_id"],
        nid: json["nid"],
        contactNo: json["contact_no"],
        email: json["email"],
        nomineeName: json["nominee_name"],
        nomineeBirthday: DateTime.parse(json["nominee_birthday"]),
        nomineeRelation: json["nominee_relation"],
        nomineeContact: json["nominee_contact"],
        nomineeImage: json["nominee_image"],
        nomineeSignature: json["nominee_signature"],
        image: json["image"],
        verify: json["verify"],
        resetToken: json["reset_token"],
        savingsPersent: json["savings_persent"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_no": accountNo,
        "openingdate": openingdate?.toIso8601String(),
        "name": name,
        "slug": slug,
        "fathername": fathername,
        "mothername": mothername,
        "spouse": spouse,
        "present_address": presentAddress,
        "parmenent_address": parmenentAddress,
        "occupation": occupation,
        "signature": signature,
        "monthly_income": monthlyIncome,
        "dob": dob?.toIso8601String(),
        "marital_status": maritalStatus,
        "religion": religion,
        "academic_qualification": academicQualification,
        "loancategory_id": loancategoryId,
        "somiti_id": somitiId,
        "nid": nid,
        "contact_no": contactNo,
        "email": email,
        "nominee_name": nomineeName,
        "nominee_birthday":
            "${nomineeBirthday?.year.toString().padLeft(4, '0')}-${nomineeBirthday?.month.toString().padLeft(2, '0')}-${nomineeBirthday?.day.toString().padLeft(2, '0')}",
        "nominee_relation": nomineeRelation,
        "nominee_contact": nomineeContact,
        "nominee_image": nomineeImage,
        "nominee_signature": nomineeSignature,
        "image": image,
        "verify": verify,
        "reset_token": resetToken,
        "savings_persent": savingsPersent,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
