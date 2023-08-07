import 'dart:convert';

ListSiswaResponseModel listSiswaResponseModelFromJson(String str) =>
    ListSiswaResponseModel.fromJson(json.decode(str));

String listSiswaResponseModelToJson(ListSiswaResponseModel data) =>
    json.encode(data.toJson());

class ListSiswaResponseModel {
  List<Siswa> data;

  ListSiswaResponseModel({
    required this.data,
  });

  factory ListSiswaResponseModel.fromJson(Map<String, dynamic> json) =>
      ListSiswaResponseModel(
        data: List<Siswa>.from(json["data"].map((x) => Siswa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Siswa {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String calibrationStatus;
  DateTime createdAt;
  DateTime updatedAt;
  String institutionId;
  dynamic isTeacher;
  String isStudent;
  dynamic createdBy;
  dynamic updatedBy;
  String identityNumber;

  String? phoneNumber;
  Gender? gender;
  dynamic image;
  dynamic path;

  Siswa({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.calibrationStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.institutionId,
    required this.isTeacher,
    required this.isStudent,
    required this.createdBy,
    required this.updatedBy,
    required this.identityNumber,
    required this.phoneNumber,
    required this.gender,
    required this.image,
    required this.path,
  });

  factory Siswa.fromJson(Map<String, dynamic> json) => Siswa(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        calibrationStatus: json["calibration_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        institutionId: json["institution_id"],
        isTeacher: json["is_teacher"],
        isStudent: json["is_student"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        identityNumber: json["identity_number"],
        phoneNumber: json["phone_number"],
        gender: genderValues.map[json["gender"]],
        image: json["image"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "calibration_status": calibrationStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "institution_id": institutionId,
        "is_teacher": isTeacher,
        "is_student": isStudent,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "identity_number": identityNumber,
        "phone_number": phoneNumber,
        "gender": genderValues.reverse[gender],
        "image": image,
        "path": path,
      };

  bool isEqual(Siswa model) {
    return id == model.id;
  }
}

enum CategoryIdentityNumber { NISN }

final categoryIdentityNumberValues =
    EnumValues({"NISN": CategoryIdentityNumber.NISN});

enum Gender { LAKI_LAKI, PEREMPUAN }

final genderValues =
    EnumValues({"Laki-laki": Gender.LAKI_LAKI, "Perempuan": Gender.PEREMPUAN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
